-- Run in the Supabase SQL Editor.
-- Anonymous visitors: INSERT only. Admin: inspect table from authenticated Supabase dashboard.
create table if not exists public.events (
  event_id text primary key,
  session_id text not null,
  event_type text not null,
  property_id text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);
alter table public.events enable row level security;
revoke all on table public.events from anon, authenticated;
grant insert on table public.events to anon;
create policy "public may submit pilot events" on public.events
for insert to anon with check (
  length(session_id) between 8 and 100 and
  length(event_type) between 1 and 80 and
  pg_column_size(metadata) < 16000
);
-- CRITICAL: No SELECT, UPDATE, DELETE policies for anon. Public users cannot read others' logs.
-- Admin reads data via Supabase dashboard SQL Editor (with privileged user), never via client service_role.
-- Example admin SQL:
-- select event_type, count(*) from public.events group by event_type order by count(*) desc;
-- select date_trunc('day', created_at) as day, event_type, count(*) from public.events group by 1,2 order by 1 desc;
