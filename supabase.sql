-- PBIC The Legends backend
create table if not exists public.submissions (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  instagram text,
  class_name text,
  details text,
  photo_url text not null,
  song_url text,
  ai_intro text,
  status text not null default 'pending' check (status in ('pending','approved','rejected')),
  created_at timestamptz not null default now()
);

create table if not exists public.profiles (
  id uuid primary key default gen_random_uuid(),
  submission_id uuid unique references public.submissions(id) on delete cascade,
  name text not null,
  instagram text,
  class_name text,
  details text,
  photo_url text not null,
  song_url text,
  ai_intro text,
  created_at timestamptz not null default now()
);

alter table public.submissions enable row level security;
alter table public.profiles enable row level security;

create policy "anyone can submit" on public.submissions for insert to anon, authenticated with check (status = 'pending');
create policy "anyone can view approved submissions" on public.submissions for select to anon, authenticated using (status = 'approved');
create policy "public can view profiles" on public.profiles for select to anon, authenticated using (true);
create policy "authenticated admins insert profiles" on public.profiles for insert to authenticated with check (true);
create policy "authenticated admins update submissions" on public.submissions for update to authenticated using (true) with check (true);

-- Create Storage buckets named: pbic-photos and pbic-songs.
-- For a simple public gallery, make both buckets public in Storage settings.
