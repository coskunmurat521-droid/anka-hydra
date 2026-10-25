-- ANKA Akilli Analiz Merkezi
-- TEK SEFERLIK, SALT-OKUNUR DIAGNOSTIK SORGUSU
-- Supabase SQL Editor'da bu dosyanin TAMAMINI calistirin.
-- Verileri, tabloları, guvenlik ayarlarini degistirmez.
-- Tum kontroller tek sonuc tablosunda listelenir.

WITH objects AS (
  SELECT
    'NESNE_RLS'::text AS bolum,
    c.relname::text AS ad,
    jsonb_build_object(
      'schema', n.nspname,
      'tur', CASE c.relkind
        WHEN 'r' THEN 'table'
        WHEN 'p' THEN 'partitioned table'
        WHEN 'v' THEN 'view'
        WHEN 'm' THEN 'materialized view'
        WHEN 'f' THEN 'foreign table'
        ELSE c.relkind::text
      END,
      'rls_acik', c.relrowsecurity,
      'rls_zorunlu', c.relforcerowsecurity
    ) AS ayrinti
  FROM pg_class c
  JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE n.nspname = 'public' AND c.relname LIKE 'anka%'
),
policies AS (
  SELECT
    'RLS_POLITIKASI'::text AS bolum,
    tablename || ' / ' || policyname AS ad,
    jsonb_build_object(
      'roller', roles,
      'komut', cmd,
      'kosul', qual,
      'yazma_kosulu', with_check
    ) AS ayrinti
  FROM pg_policies
  WHERE schemaname = 'public' AND tablename LIKE 'anka%'
),
columns_info AS (
  SELECT
    'SUTUN'::text AS bolum,
    table_name || ' / ' || column_name AS ad,
    jsonb_build_object(
      'sira', ordinal_position,
      'veri_turu', data_type,
      'bos_gecebilir', is_nullable,
      'varsayilan', column_default
    ) AS ayrinti
  FROM information_schema.columns
  WHERE table_schema = 'public'
    AND table_name LIKE 'anka%'
),
foreign_keys AS (
  SELECT
    'ILISKI'::text AS bolum,
    tc.table_name || ' / ' || kcu.column_name AS ad,
    jsonb_build_object(
      'bagli_tablo', ccu.table_name,
      'bagli_sutun', ccu.column_name,
      'kisit', tc.constraint_name
    ) AS ayrinti
  FROM information_schema.table_constraints tc
  JOIN information_schema.key_column_usage kcu
    ON tc.constraint_name = kcu.constraint_name
   AND tc.constraint_schema = kcu.constraint_schema
  JOIN information_schema.constraint_column_usage ccu
    ON ccu.constraint_name = tc.constraint_name
   AND ccu.constraint_schema = tc.constraint_schema
  WHERE tc.constraint_type = 'FOREIGN KEY'
    AND tc.table_schema = 'public'
    AND tc.table_name LIKE 'anka%'
)
SELECT bolum, ad, ayrinti FROM objects
UNION ALL
SELECT bolum, ad, ayrinti FROM policies
UNION ALL
SELECT bolum, ad, ayrinti FROM columns_info
UNION ALL
SELECT bolum, ad, ayrinti FROM foreign_keys
ORDER BY bolum, ad;
