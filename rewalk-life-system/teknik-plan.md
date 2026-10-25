# ANKA REWALK LIFE SYSTEM
## Teknik gereksinimler ve düşük maliyetli laboratuvar demonstratörü — V0.1

**Durum:** Ön taslak / konsept. Bu doküman üretim çizimi, klinik onay veya kullanıma hazır tıbbi cihaz spesifikasyonu değildir.

## 1. İlk aşamanın amacı
İnsan üzerinde kullanılmayan, masa/stand üzerinde çalıştırılan ve kontrollü yük testleri yapılabilen bir demonstratör geliştirmek. İlk aşamada motorlu yürüyüş desteği veya insan taşıyan mekanizma yapılmayacaktır.

## 2. Önerilen geliştirme aşamaları
1. **Gereksinim tanımı:** hedef kullanıcı senaryosu, hangi eklemlere destek düşünüldüğü, hareket sınırları, cihazın takılıp çıkarılması ve acil bırakma ihtiyaçları rehabilitasyon uzmanıyla belirlenir.
2. **Masaüstü algılama prototipi:** hareket sensörleri ve mikrodenetleyici ile açı/konum verisi toplanır; eklem hareketi yerine bir test fikstürü üzerinde denenir.
3. **Mekanik demonstratör:** insan taşımayan fikstürde bağlantılar, boşluklar, sıkışma noktaları ve mekanik durdurucular değerlendirilir.
4. **Elektrik ve kontrol:** akım sınırlama, sigorta, fiziksel acil durdurma, güç kesilince güvenli duruma geçiş ve arıza davranışı test edilir.
5. **Doğrulama raporu:** ölçüm tekrarlanabilirliği, yük altında davranış, sıcaklık, gevşeyen bağlantılar ve arıza senaryoları kaydedilir.
6. **Uzman değerlendirmesi:** insan üzerinde kullanım düşünülmeden önce biyomedikal/mekanik/elektrik-elektronik mühendisleri, rehabilitasyon uzmanı ve ilgili mevzuat/etik gereklilikleri değerlendirilir.

## 3. İşlevsel gereksinimler
- Hareket/eklem açısı ölçümünü insan kullanmadan doğrulayabilme.
- Ham sensör verisine zaman damgası ekleyip kayıt altına alma.
- Sensör kopması veya mantıksız ölçümde sistemi güvenli şekilde durdurma.
- Motorlu hareket uygulanacak sonraki aşamalarda fiziksel acil durdurma, akım/tork sınırı, mekanik hareket sınırı ve enerji kesildiğinde güvenli davranış tasarımı.
- Keskin kenar, sıkışma ve kablo takılması risklerinin kontrol listesi.
- Kullanıcı sağlık verileri toplanacaksa veri minimizasyonu, açık izin ve erişim kontrolü.
- Klinik etkinlik veya iyileşme vaadi ileri sürülmemesi; bunların uygun araştırma ve doğrulama gerektirmesi.

## 4. Laboratuvar demonstratörü için temel bileşen grupları
| Grup | İlk prototipteki rol |
|---|---|
| Mikrodenetleyici geliştirme kartı | Sensör okumalarını toplamak ve kaydetmek |
| IMU/açı sensörü | Fikstürün açısal hareketini ölçmek |
| Test fikstürü ve mafsal | İnsan yerine kontrollü mekanik hareketi temsil etmek |
| Düşük gerilimli güç kaynağı | Akım sınırlı, kontrollü enerji sağlamak |
| Acil durdurma anahtarı | Gücü kesmek; sonraki motorlu testlerde zorunlu güvenlik girdisi |
| Kablo, koruyucu muhafaza, bağlantı elemanları | Güvenli kurulum ve ölçüm |
| Kalibrasyon aracı / referans açıölçer | Sensör verisini karşılaştırmak |

**Not:** Kesin parça/model ve maliyet; hareket aralığı, yük ve test yöntemi mühendislik gereksinimleri belirlendikten sonra seçilmelidir. Bu aşamada insan üzerinde kullanılacak motor, tork veya boyut önerisi verilmemektedir.

## 5. İlk doğrulama planı
- Sensör ölçümünü referans açıölçerle birkaç farklı konumda karşılaştır.
- Aynı konumu tekrarlı ölçerek sapma ve tekrarlanabilirliği kaydet.
- Sensör bağlantısı çıkarıldığında yazılımın hata verdiğini ve güvenli duruma geçtiğini doğrula.
- Fikstürde düşük riskli, kademeli yük denemeleri yap; her denemede bağlantı gevşemesi ve deformasyon kontrolü yap.
- Elektrik kesintisi, yeniden başlatma ve kablo kopması senaryolarını test et.
- Test tarihi, donanım revizyonu, ölçüm, hata ve düzeltici eylemleri kayıt altına al.

## 6. İlk başarı ölçütleri
- Sensör verisi kaydediliyor ve zaman damgası içeriyor.
- Referans ölçümle fark raporlanıyor.
- Hata senaryoları tanımlanmış ve test edilmiş.
- İnsan taşımayan fikstürde bağlantılar ve koruyucular kontrol edilmiş.
- Risk listesi ve bir sonraki revizyon için aksiyonlar hazırlanmış.

## 7. Sorumluluklar
- **Mekanik mühendisliği:** fikstür, eklem kinematiği, hareket sınırları, sıkışma ve yapısal riskler.
- **Elektrik-elektronik/kontrol:** sensör, güç, kablolama, kontrol mantığı, arıza davranışı ve acil durdurma.
- **Biyomedikal/rehabilitasyon uzmanları:** kullanım amacı, ergonomi, klinik ihtiyaçlar ve insan üzerinde test öncesi gereklilikler.
- **Proje sahibi:** tasarım kararları, gereksinimler, fikrî mülkiyet ve revizyon kayıtları.

## 8. Sonraki karar noktası
Önce yalnızca **sensör + veri kaydı + insan taşımayan mekanik fikstür** demonstratörünü tamamla. Motorlu dış iskelet ve insan üzerinde kullanım daha sonraki, ayrı güvenlik ve uzman onaylı aşamalardır.
