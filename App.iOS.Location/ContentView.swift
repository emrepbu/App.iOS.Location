//
//  ContentView.swift
//  App.iOS.Location
//
//  Created by emre argana on 22.06.2025.
//

import SwiftUI
import MapKit

/// Harita arayuzu, kullanici lokasyonu, yonlendirme ve gorunum seceneklerini iceren ana gorunum.
struct ContentView: View {
    
    @State private var lookAroundScene: MKLookAroundScene?
    @State private var isPresentedLookAroundSheet: Bool = false
    
    /// Haritanin konumunu ve yakinlastirmasini yoneten dinamik pozisyon
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(center: .timesSquare,
                           latitudinalMeters: 3000,
                           longitudinalMeters: 3000)
    )
    
    /// Secilen harita stilini tutar (standard, imagery, hybrid)
    @State private var selectedStyle: MapStyleOption = .standard
    
    /// Kullanicinin ulasim turu secimi (yaya veya arac)
    @State private var selectedRouteType: RouteType = .automobile
    
    /// Hesaplanan rota bilgisi, harita uzerinde gosterilir
    @State private var route: MKRoute?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // MARK: - Harita Bileseni
            Map(position: $cameraPosition) {
                // Times Square konumu
                Annotation("Times Square", coordinate: .timesSquare, anchor: .bottom) {
                    Image(systemName: "location.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                        .contextMenu {
                            Button {
                                Task {
                                    let scene = await getLookAroundScene(from: .timesSquare)
                                    guard let scene else { return }
                                    await MainActor.run {
                                        lookAroundScene = scene
                                        isPresentedLookAroundSheet = true
                                    }
                                }
                            } label: {
                                Label("Look Around", systemImage: "binoculars")
                            }
                        }
                }
                
                // Central Park konumu
                Annotation("Central Park", coordinate: .centralPark, anchor: .bottom) {
                    Image(systemName: "leaf.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.green)
                }
                
                // Kullanici konumu gosterimi
                UserAnnotation()
                
                // Eger rota varsa, ciz
                if let route {
                    MapPolyline(route.polyline)
                        .stroke(.blue, lineWidth: 5)
                }
            }
            .mapStyle(
                {
                    switch selectedStyle {
                    case .standard:
                        return .standard
                    case .imagery:
                        return .imagery
                    case .hybrid:
                        return .hybrid(elevation: .realistic)
                    }
                }()
            )
            .mapControls {
                MapUserLocationButton()
                MapCompass()
                MapPitchToggle()
                MapScaleView()
            }
            .lookAroundViewer(
                isPresented: $isPresentedLookAroundSheet,
                initialScene: lookAroundScene
            )
            
            // MARK: - Alt Kontrol Paneli
            VStack(spacing: 12) {
                
                // Rota tipi secimi (yaya mi, araba mi)
                Picker("Ulasim Turu", selection: $selectedRouteType) {
                    ForEach(RouteType.allCases) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                // Rota olusturma butonu
                Button {
                    getDirections(
                        from: .timesSquare,
                        to: .centralPark,
                        transportType: selectedRouteType.transportType
                    )
                } label: {
                    Label("Rota Olustur", systemImage: "arrow.triangle.turn.up.right.diamond")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                
                // Harita stil secenekleri
                HStack(spacing: 12) {
                    styleButton(label: "Standart", image: "map", style: .standard)
                    styleButton(label: "Uydu", image: "photo", style: .imagery)
                    styleButton(label: "Hibrit", image: "network", style: .hybrid)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.thinMaterial) // Arka plani yari saydam yapar
                    .shadow(radius: 10)
            )
            .padding()
        }
    }
    
    // MARK: - Yon Tarifi Fonksiyonu
    /// Baslangic ve varis koordinatlari arasinda secilen ulasim tipine gore rota olusturur
    func getDirections(from start: CLLocationCoordinate2D,
                       to end: CLLocationCoordinate2D,
                       transportType: MKDirectionsTransportType) {
        Task {
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: start))
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: end))
            request.transportType = transportType
            
            do {
                let directions = try await MKDirections(request: request).calculate()
                guard let firstRoute = directions.routes.first else {
                    print("Uygun rota bulunamadi.")
                    return
                }
                
                await MainActor.run {
                    self.route = firstRoute
                    self.cameraPosition = .rect(firstRoute.polyline.boundingMapRect)
                }
            } catch {
                print("Rota olusturma hatasi: \(error.localizedDescription)")
            }
        }
    }
    
    /// Belirtilen koordinat icin Look Around sahnesini dondurur
    func getLookAroundScene(from coordinate: CLLocationCoordinate2D) async -> MKLookAroundScene? {
        do {
            let request = MKLookAroundSceneRequest(coordinate: coordinate)
            return try await request.scene
        } catch {
            print("Look Around sahnesi bulunamadi: \(error.localizedDescription)")
            return nil
        }
    }
    
    // MARK: - Harita Stili Butonu
    /// Harita stil butonlarini tek bir yerden olusturmak icin yardimci fonksiyon
    @ViewBuilder
    func styleButton(label: String, image: String, style: MapStyleOption) -> some View {
        Button {
            selectedStyle = style
        } label: {
            VStack {
                Image(systemName: image)
                    .font(.title2)
                Text(label)
                    .font(.caption)
            }
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(
                selectedStyle == style
                ? Color.accentColor.opacity(0.2)
                : Color.gray.opacity(0.1)
            )
            .cornerRadius(10)
        }
    }
}

// MARK: - Koordinat Uzantilari (Konum Tanimlari)
extension CLLocationCoordinate2D {
    static let timesSquare = CLLocationCoordinate2D(latitude: 40.7580, longitude: -73.9855)
    static let centralPark = CLLocationCoordinate2D(latitude: 40.785091, longitude: -73.968285)
}

// MARK: - Harita Stili Secenekleri
enum MapStyleOption: String {
    case standard
    case imagery
    case hybrid
}

// MARK: - Ulasim Tipi Secenekleri
enum RouteType: String, CaseIterable, Identifiable {
    case automobile = "Araba"
    case walking = "Yaya"
    
    var id: String { rawValue }
    
    /// MKDirections icindeki karsiligi
    var transportType: MKDirectionsTransportType {
        switch self {
        case .automobile: return .automobile
        case .walking: return .walking
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
