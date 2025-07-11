# iOS MapKit Demo App

## Proje Hakkinda

MapKit Demo App, SwiftUI ve MapKit’in API’lerini kullanarak gelistirilen bir iOS uygulamasidir.

Bu uygulama:

* Harita uzerinde kullaniciya ozel konum isaretleri gosterir,
* Farkli harita stil secenekleri sunar (Standart, Uydu, Hibrit),
* Kullanicinin secimine gore yaya veya arac rotasi olusturur ve harita uzerinde gosterir,
* Apple’in Look Around (Sokak Gorunumu) ozelligini destekler,

## Ozellikler

* **Harita Stili Secimi:** Kullanici standart, uydu ve hibrit harita gorunumleri arasinda gecis yapabilir.
* **Ulasim Turu Secimi:** Rota hesaplamalarinda yaya veya arac ulasim secenekleri arasinda secim yapilabilir.
* **Rota Cizimi:** Baslangic ve varis noktalarindaki rota hesaplanir ve harita uzerinde cizilir.
* **Look Around Destegi:** Isaretler uzerinde context menu araciligiyla Look Around goruntusu acilabilir.
* **Kullanici Konumu:** Harita uzerinde kullanici konumu gosterilir.

## Teknik Bilgiler

* **Gelistirme Dili:** Swift (SwiftUI)
* **Minimum iOS Surumu:** iOS 17.0
* **Xcode Versiyonu:** 15 ve uzeri
* **Kullanilan API’ler:** MapKit, Swift Concurrency (async/await)

## Kurulum ve Calistirma

1. **Xcode 15+** surumunu indirip kurun.
2. Projeyi klonlayin veya indirin.
3. `Info.plist` dosyasina asagidaki izin aciklamasini ekleyin:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Konumunuzu rota olusturmak icin kullaniyoruz.</string>
```

4. Projeyi gercek bir cihazda veya iOS 17+ simulatorde calistirin.
5. Harita uzerinde konum isaretlerini gorebilir, rota olusturabilir ve Look Around deneyimini yasayabilirsiniz.

## Kullanim

* Harita uzerinde sabit iki nokta (Times Square ve Central Park) bulunur.
* Alt panelde harita stilini ve ulasim turunu secabilirsiniz.
* "Rota Olustur" butonuna basarak secilen ulasim turune gore rota hesaplanir ve harita uzerinde gosterilir.
* Times Square isaretine uzun basarak acilan context menuden "Look Around" secenegini kullanabilirsiniz.

## Program icerisinden ekran goruntuleri

| Gorsel 1 | Gorsel 2 | Gorsel 3 | Gorsel 4 |
|:-------------------------------------:|:-------------------------------------:|:-------------------------------------:|:-------------------------------------:|
| <img width="200" alt="image 1" src="https://github.com/user-attachments/assets/0703cdf6-9fc9-45f7-b8e6-fa43178febc8" /> | <img width="200" alt="image 2" src="https://github.com/user-attachments/assets/1ca7dfb1-3d9d-45b2-a38c-07f0d90ad983" /> | <img width="200" alt="image 3" src="https://github.com/user-attachments/assets/84e99ea5-b810-4c95-a403-b6e85ee6a219" /> | <img width="200" alt="image 4" src="https://github.com/user-attachments/assets/25675a9c-5fb3-457b-b6a6-a5e5f5950cce" />|

## Gelistirme ve Ozellestirme

* Harita uzerindeki isaretciler ve koordinatlar kolayca genisletilebilir.
* Rota baslangic ve varis noktalar dinamik hale getirilebilir.
* Look Around ozelligi destekleyen bolgeler genisletilebilir.
* UI ogeleri SwiftUI ile kolayca ozellestirilebilir.

## Lisans

Bu proje MIT Lisansi ile lisanslanmistir. Dilediginiz gibi kullanabilir, degistirebilir ve dagitabilirsiniz.

## Iletisim

Projeyle ilgili sorulariniz veya onerileriniz icin:

* Emre Argana
* [emreargana@icloud.com](mailto:emreargana@icloud.com)
* GitHub: [https://github.com/emrepbu](https://github.com/emrepbu)

