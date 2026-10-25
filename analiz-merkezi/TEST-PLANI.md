# ANKA Akıllı Analiz Merkezi — Manuel Test Planı

Bu kontrol listesi testin nasıl yapılacağını tanımlar. Maddeler işaretlenmeden testlerin başarıyla tamamlandığı varsayılmaz.

## A. Kayıt işlemleri
- [ ] Sayfa açılıyor ve 12 proje başlığı görünüyor.
- [ ] Zorunlu alanlar boş bırakıldığında form kaydı engelliyor.
- [ ] Yeni kayıt ekleniyor ve kayıt sayısı artıyor.
- [ ] Proje, aşama, veri durumu, tarih, yer, hava, ölçüm, gözlem, yöntem ve sonraki adım doğru görüntüleniyor.
- [ ] Gözlem / Ölçüm / Tahmin / Uzman tarafından doğrulanmış seçenekleri kayıtta doğru gösteriliyor.
- [ ] Tek bir kaydı silme onayı iptal edildiğinde kayıt korunuyor; onaylandığında siliniyor.

## B. Arama ve dışa aktarma
- [ ] Arama proje, yer, ölçüm ve gözlem metinlerinde sonuçları daraltıyor.
- [ ] Veri durumu filtresi Gözlem, Ölçüm, Tahmin ve Doğrulanmış kayıtlarını ayrı ayrı gösteriyor.
- [ ] Arama kutusu ve veri durumu filtresi birlikte doğru çalışıyor.
- [ ] JSON yedeği indiriliyor ve geçerli JSON olarak açılıyor.
- [ ] CSV dosyası Türkçe karakterleri ve satır sonlarını doğru koruyor.
- [ ] Bozuk JSON dosyası yüklenince anlaşılır hata gösteriliyor.
- [ ] Aynı kayıt kimliği içeren yedek tekrar yüklendiğinde kopya kayıt eklenmiyor.
- [ ] 5 MB üzerindeki yedek reddediliyor.
- [ ] Yükleme iptal edilince mevcut kayıtlar değişmiyor.

## C. Cihaz ve çevrimdışı davranış
- [ ] Sayfa yenilendiğinde aynı tarayıcıdaki kayıtlar duruyor.
- [ ] Başka bir tarayıcı/cihazda kayıtların otomatik görünmediği açıkça anlaşılıyor; bu sürüm bulut eşitlemesi yapmaz.
- [ ] Tarayıcı depolaması kullanılamadığında kayıt hatası kullanıcıya gösteriliyor.
- [ ] Mobil ekranda form, butonlar ve kayıt kartları yatay taşma olmadan kullanılabiliyor.
- [ ] Yeni sürüm yayımlandıktan sonra sayfa kapatılıp yeniden açıldığında yeni arayüz geliyor.

## D. Bulut bağlantısı ve güvenlik — henüz yapılmadı
- [ ] Supabase mevcut tablo ve sütunları salt-okunur teşhisle doğrulandı.
- [ ] Mevcut verilerin yedeği alındı; mevcut şemayla çakışan taslak SQL çalıştırılmadı.
- [ ] Kullanıcı kimlik doğrulaması ve en az ayrıcalık ilkesi doğrulandı.
- [ ] RLS politikalarıyla yetkisiz okuma, ekleme, güncelleme ve silme test edildi.
- [ ] Kayıt oluşturma, listeleme, güncelleme ve silme gerçek veritabanında test edildi.
- [ ] Hata, ağ kesintisi ve oturum süresi dolması senaryoları test edildi.
- [ ] İkinci cihazdan aynı yetkili kullanıcıyla eşitleme doğrulandı.

## Sonuç kaydı
Her kontrol için tarih, cihaz/tarayıcı, beklenen sonuç, gözlenen sonuç ve geçti/kaldı durumu not edilmelidir. Test edilmeyen maddeler tamamlanmış olarak işaretlenmemelidir.

**Güvenlik notu:** Supabase yönetici/service-role anahtarı, veritabanı parolası veya özel erişim anahtarları HTML dosyasına ya da istemci tarafı koda konmamalıdır.
