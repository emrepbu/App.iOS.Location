# iOS MapKit Demo App

## Proje Hakkinda

MapKit Demo App, SwiftUI ve MapKit’in API’lerini kullanarak gelistirilen bir iOS uygulamasidir.

Bu uygulama:

* Harita uzerinde kullaniciya ozel konum isaretleri gosterir,
* Farkli harita stil secenekleri sunar (Standart, Uydu, Hibrit),
* Kullanicinin secimine gore yaya veya arac rotasi olusturur ve harita uzerinde gosterir,
* Apple’in Look Around (Sokak Gorunumu) ozelligini destekler,

---

## Ozellikler

* **Harita Stili Secimi:** Kullanici standart, uydu ve hibrit harita gorunumleri arasinda gecis yapabilir.
* **Ulasim Turu Secimi:** Rota hesaplamalarinda yaya veya arac ulasim secenekleri arasinda secim yapilabilir.
* **Rota Cizimi:** Baslangic ve varis noktalarindaki rota hesaplanir ve harita uzerinde cizilir.
* **Look Around Destegi:** Isaretler uzerinde context menu araciligiyla Look Around goruntusu acilabilir.
* **Kullanici Konumu:** Harita uzerinde kullanici konumu gosterilir.

---

## Teknik Bilgiler

* **Gelistirme Dili:** Swift (SwiftUI)
* **Minimum iOS Surumu:** iOS 17.0
* **Xcode Versiyonu:** 15 ve uzeri
* **Kullanilan API’ler:** MapKit, Swift Concurrency (async/await)

---

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

---

## Kullanim

* Harita uzerinde sabit iki nokta (Times Square ve Central Park) bulunur.
* Alt panelde harita stilini ve ulasim turunu secabilirsiniz.
* "Rota Olustur" butonuna basarak secilen ulasim turune gore rota hesaplanir ve harita uzerinde gosterilir.
* Times Square isaretine uzun basarak acilan context menuden "Look Around" secenegini kullanabilirsiniz.

---
## Program icerisinden ekran goruntuleri

---

## Gelistirme ve Ozellestirme

* Harita uzerindeki isaretciler ve koordinatlar kolayca genisletilebilir.
* Rota baslangic ve varis noktalar dinamik hale getirilebilir.
* Look Around ozelligi destekleyen bolgeler genisletilebilir.
* UI ogeleri SwiftUI ile kolayca ozellestirilebilir.

---

## Lisans

Bu proje MIT Lisansi ile lisanslanmistir. Dilediginiz gibi kullanabilir, degistirebilir ve dagitabilirsiniz.

---

## Iletisim

Projeyle ilgili sorulariniz veya onerileriniz icin:

* Emre Argana
* [emreargana@icloud.com](mailto:emreargana@icloud.com)
* GitHub: [https://github.com/emrepbu](https://github.com/emrepbu)

