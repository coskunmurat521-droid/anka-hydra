# ANKA Akıllı Analiz Merkezi — Bulut Entegrasyon Planı

## Amaç
Yerel prototipi, mevcut verileri koruyarak Supabase ile güvenli ve çok cihazlı kullanıma hazırlamak.

## Mevcut durum
- Arayüz kayıtları tarayıcının yerel depolamasına yazıyor.
- JSON yedekleme ve geri yükleme yerel prototip içindir.
- Supabase istemci bağlantısı ve kullanıcı oturumu henüz bu sayfaya eklenmedi.
- Canlı ortamda uçtan uca test yapılmış değildir.
- Bu plan mevcut veritabanı şemasının doğrulandığı anlamına gelmez.

## Uygulama sırası

### 1. Salt-okunur keşif
1. Supabase Dashboard'da doğru projeyi açın.
2. SQL Editor'da `diagnostik-ve-guvenlik-kontrol.sql` dosyasının tamamını çalıştırın.
3. Sonuçları tablo adı, sütunlar, ilişkiler, RLS durumu ve politikalar korunacak şekilde dışa aktarın veya metin olarak kopyalayın.
4. Sonuçları incelemeden `database-schema-draft.sql` dosyasını çalıştırmayın.

### 2. Veri eşleştirme
- Mevcut `anka_field_records` tablosu ile taslaktaki `anka_records` tablosunun alanları karşılaştırılmalı.
- Proje kimliği, tarih, ölçüm, veri durumu ve kayıt sahibi alanlarının gerçek eşlemesi belirlenmeli.
- Herhangi bir yeniden adlandırma, silme veya toplu taşıma öncesi yedek alınmalı.
- Eski yerel kayıtlar otomatik silinmemeli; buluta aktarım öncesi JSON yedeği alınmalı.

### 3. Kimlik doğrulama ve erişim
- Kullanıcı oturumu kurulmalı; kullanıcı kimliği sunucu tarafında doğrulanmalı.
- RLS her ilgili tabloda etkin olmalı ve ihtiyaca uygun politikalar oluşturulmalı.
- Varsayılan olarak erişim kapalı tutulmalı; yalnızca açıkça izin verilen kullanıcılar işlem yapabilmeli.
- İstemci koduna yalnızca istemci tarafında kullanılmaya uygun genel anahtar eklenebilir.
- `service_role`, veritabanı parolası veya başka gizli anahtarlar HTML, JavaScript, GitHub deposu ya da sohbete konmamalı.

### 4. Uygulama bağlantısı
- İstemci bağlantısı ancak proje URL'si ve genel anahtar güvenli şekilde sağlandığında eklenmeli.
- Kayıt oluşturma, listeleme, güncelleme ve silme ayrı ayrı uygulanmalı.
- Çevrimdışı durumda yerel verinin davranışı ve bulutla çakışma çözümü tanımlanmalı.
- Başarılı/başarısız istekler kullanıcıya anlaşılır biçimde gösterilmeli.
- Buluta kaydedildi mesajı yalnızca sunucudan başarı yanıtı alındığında gösterilmeli.

### 5. Test ve devreye alma
- İki farklı yetkili kullanıcıyla erişim sınırları kontrol edilmeli.
- Yetkisiz okuma ve yazma denemeleri reddedilmeli.
- İki cihazdan kayıt ekleme ve yenileme test edilmeli.
- Ağ kesintisi, oturum süresinin dolması, yinelenen kayıt ve hatalı veri test edilmeli.
- Test sonuçları `TEST-PLANI.md` içine tarih ve gözlenen sonuçla yazılmalı.

## Gerekli sonraki girdi
İlk adımda yalnızca `diagnostik-ve-guvenlik-kontrol.sql` sorgusunun sonuçları gerekir. Sonuçlar tablo yapısını ve izinleri ortaya koymadan üretim SQL'i veya uygulama bağlantısı varsayılmamalıdır.

## Tamamlanma ölçütü
Bulut entegrasyonu; gerçek Supabase ortamında doğrulanmış oturum, RLS, CRUD, iki cihaz ve hata senaryoları test edilmeden tamamlanmış sayılmaz.
