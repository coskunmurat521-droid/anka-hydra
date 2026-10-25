# ANKA Akıllı Analiz Merkezi

Bu klasör, ANKA projeleri için saha/test kaydı ve analiz altyapısını içerir.

## Mevcut durum

- `index.html`: ilk arayüz prototipi.
- Kayıtlar yalnızca bu tarayıcının yerel depolamasında tutulur.
- JSON dışa aktarma ve tekil kayıt silme vardır.
- Supabase bağlantısı, kullanıcı girişi ve gerçek yapay zekâ analizi henüz bağlı değildir.
- `database-schema-draft.sql` mevcut veritabanı yapısı doğrulanmadan çalıştırılmamalıdır.
- `diagnostik-ve-guvenlik-kontrol.sql` salt-okunur teşhis sorgusudur; kayıtları veya ayarları değiştirmez. Sütun keşfi, sabit tablo listesi yerine `anka%` ile başlayan tüm tabloları kapsar.
- `TEST-PLANI.md` yerel prototipin manuel test adımlarını ve bulut bağlantısı için güvenlik kontrollerini içerir.
- `BULUT-ENTEGRASYON-PLANI.md` mevcut veritabanını koruyarak Supabase bağlantısına geçiş adımlarını açıklar.
- Service worker önbelleği `v03` sürümüne yükseltildi; bu, eski önbelleğin yeni sayfayı göstermesi riskini azaltır, ancak her cihazda anında güncelleneceğini garanti etmez.

## Güvenli kurulum sırası

1. Supabase projesinde SQL Editor bölümünü açın.
2. [Teşhis sorgusunu](./diagnostik-ve-guvenlik-kontrol.sql) açıp tamamını tek seferde çalıştırın.
3. Sonuç tablosunu metin olarak paylaşın. Sonuçlar gelmeden tablo, sütun veya erişim politikası tahmin edilerek değiştirilmemelidir.
4. Gerçek şema ve erişim politikaları doğrulandıktan sonra mevcut verileri koruyan entegrasyon hazırlanmalıdır.
5. Web sayfasına yalnızca tarayıcıda kullanılmak üzere tasarlanmış genel erişim anahtarı konabilir; yönetici anahtarları ve veritabanı parolaları web sayfasına veya sohbete eklenmemelidir.

## Üretime hazır olma kontrol listesi

- [ ] Gerçek veritabanı şeması ve erişim politikaları doğrulandı.
- [ ] Yetkisiz okuma/yazma denendi ve engellendi.
- [ ] Kayıt ekleme, listeleme, güncelleme ve silme uçtan uca test edildi.
- [ ] Hata ve çevrimdışı durumları anlaşılır biçimde gösteriliyor.
- [ ] JSON yedekleme ve geri yükleme test edildi.
- [ ] Mobil görünüm ve temel güvenlik kontrolleri yapıldı.
- [ ] Yapay zekâ özelliği varsa kapsamı, sınırları ve uzman doğrulaması açıkça belirtiliyor.

Bu kontroller tamamlanmadan sistem üretime hazır kabul edilmemelidir.
