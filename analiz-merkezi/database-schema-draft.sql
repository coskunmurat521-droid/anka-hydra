-- ANKA Akilli Analiz Merkezi - ilk veri tabani taslagi
-- Supabase SQL Editor'da proje olusturulduktan sonra gozden gecirilerek uygulanacak.
-- Bu taslak tek basina calisan bir veri tabani olusturmaz; once Supabase projesi ve kimlik dogrulama ayarlari gerekir.

create table if not exists public.anka_projects (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  name text not null,
  description text,
  stage text not null default 'Fikir',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.anka_records (
  id uuid primary key default gen_random_uuid(),
  project_id uuid not null references public.anka_projects(id) on delete restrict,
  record_code text,
  stage text not null default 'Gozlem',
  observed_at timestamptz,
  location_text text,
  weather_conditions text,
  observation text not null,
  measurement_value numeric,
  measurement_unit text,
  measurement_method text,
  next_safe_step text,
  data_status text not null default 'Gozlem',
  created_by uuid references auth.users(id),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint anka_records_data_status_check
    check (data_status in ('Gozlem','Olcum','Tahmin','Dogrulanmis'))
);

create table if not exists public.anka_attachments (
  id uuid primary key default gen_random_uuid(),
  record_id uuid not null references public.anka_records(id) on delete cascade,
  file_name text not null,
  storage_path text not null,
  media_type text,
  uploaded_by uuid references auth.users(id),
  created_at timestamptz not null default now()
);

alter table public.anka_projects enable row level security;
alter table public.anka_records enable row level security;
alter table public.anka_attachments enable row level security;

-- Guvenlik varsayilani: RLS acik, ancak kullanici girisi ve izin politikasi
-- kurulmadan tabloya istemciden erisim verilmez. Anon anahtar gizli degildir;
-- service_role gibi yuksek yetkili anahtarlar asla web uygulamasina yazilmaz.

insert into public.anka_projects (code, name, description) values
('HYDRA','ANKA HYDRA','Arac ailesi ve prototip'),
('D-POWER','ANKA D-POWER','Motor verimliligi'),
('ASI-01-PRO','ANKA ASI-01 PRO','Akilli tarim'),
('ZEMRA','ZEMRA','Deprem ve yapi izleme'),
('SEL','ANKA SEL','Sel gozlemi ve erken uyari'),
('VOLKAN','ANKA VOLKAN','Volkanik risk gozlemi'),
('CIG','ANKA CIG','Cig riski'),
('RAY-DIRENC','ANKA RAY-DIRENC','Ray sicakligi ve deformasyon'),
('REWALK','ANKA REWALK','Hareket destek sistemi'),
('CARE','ANKA CARE','Bakim ve saglik destek sistemi'),
('DORSE-FOAM-GUARD','ANKA DORSE FOAM-GUARD','Ticari arac darbe korumasi'),
('ARAZI','ANKA ARAZI','Arazi odakli proje')
on conflict (code) do nothing;
