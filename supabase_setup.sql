create table if not exists public.reward_game_state (
  id text primary key,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.reward_game_state enable row level security;

grant usage on schema public to anon, authenticated;
grant select, insert, update on table public.reward_game_state to anon, authenticated;

drop policy if exists "reward_game_state_select_anon" on public.reward_game_state;
create policy "reward_game_state_select_anon"
on public.reward_game_state
for select
to anon, authenticated
using (true);

drop policy if exists "reward_game_state_insert_anon" on public.reward_game_state;
create policy "reward_game_state_insert_anon"
on public.reward_game_state
for insert
to anon, authenticated
with check (true);

drop policy if exists "reward_game_state_update_anon" on public.reward_game_state;
create policy "reward_game_state_update_anon"
on public.reward_game_state
for update
to anon, authenticated
using (true)
with check (true);
