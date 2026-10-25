-- ANKA Akilli Analiz Merkezi
-- Guvenli durum tespiti: SADECE SELECT sorgulari; veri veya ayar degistirmez.
-- Supabase SQL Editor'da tek seferde calistirilabilir.
-- Not: Sonuclari ayri bolumler halinde gormek icin sorgulari tek tek secip calistirmak gerekebilir.
-- Bu dosya guvenlik politikasi eklemez; once gercek nesne turu ve mevcut politikalar tespit edilir.

-- 1) ANKA nesnelerinin gercek turu (table, view, partition vb.) ve RLS durumu
SELECT
  n.nspname AS schema_name,
  c.relname AS object_name,
  CASE c.relkind
    WHEN 'r' THEN 'table'
    WHEN 'p' THEN 'partitioned table'
    WHEN 'v' THEN 'view'
    WHEN 'm' THEN 'materialized view'
    WHEN 'f' THEN 'foreign table'
    ELSE c.relkind::text
  END AS object_type,
  c.relrowsecurity AS rls_enabled,
  c.relforcerowsecurity AS rls_forced
FROM pg_class c
JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE n.nspname = 'public'
  AND c.relname LIKE 'anka%'
ORDER BY c.relname;

-- 2) ANKA nesnelerindeki mevcut RLS politikaları
SELECT
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd,
  qual,
  with_check
FROM pg_policies
WHERE schemaname = 'public'
  AND tablename LIKE 'anka%'
ORDER BY tablename, policyname;

-- 3) Saha kayıtları tablosunun gerçek sütunları ve varsayılanları
SELECT
  table_schema,
  table_name,
  ordinal_position,
  column_name,
  data_type,
  is_nullable,
  column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name IN ('anka_projects', 'anka_field_records')
ORDER BY table_name, ordinal_position;

-- 4) Proje ve saha kayıtları arasındaki mevcut foreign key bağlantıları
SELECT
  tc.table_name,
  kcu.column_name,
  ccu.table_name AS referenced_table,
  ccu.column_name AS referenced_column,
  tc.constraint_name
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
ORDER BY tc.table_name, kcu.column_name;
