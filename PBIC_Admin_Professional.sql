-- PBIC Admin: Edit and Delete published profiles

drop policy if exists "authenticated admins can update profiles"
on public.profiles;

create policy "authenticated admins can update profiles"
on public.profiles
for update
to authenticated
using (true)
with check (true);


drop policy if exists "authenticated admins can delete profiles"
on public.profiles;

create policy "authenticated admins can delete profiles"
on public.profiles
for delete
to authenticated
using (true);


-- Allow admins to view all submissions
drop policy if exists "authenticated admins can view submissions"
on public.submissions;

create policy "authenticated admins can view submissions"
on public.submissions
for select
to authenticated
using (true);


-- Allow admins to delete rejected/unwanted requests
drop policy if exists "authenticated admins can delete submissions"
on public.submissions;

create policy "authenticated admins can delete submissions"
on public.submissions
for delete
to authenticated
using (true);
