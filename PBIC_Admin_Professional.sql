-- Required for the new Admin Dashboard Edit + Delete buttons
-- Run this once in Supabase SQL Editor.

create policy "authenticated admins can update profiles"
on public.profiles
for update
to authenticated
using (true)
with check (true);

drop policy if exists "authenticated admins can delete profiles" on public.profiles;
create policy "authenticated admins can delete profiles"
on public.profiles
for delete
to authenticated
using (true);
