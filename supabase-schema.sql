-- Run this once in the Supabase SQL editor.
create extension if not exists pgcrypto;

create table if not exists public.lots (
  id text primary key,
  name text not null,
  starting_price integer not null check (starting_price >= 0),
  current_bid integer not null check (current_bid >= 0),
  image_url text,
  ends_at timestamptz
);

create table if not exists public.bids (
  id uuid primary key default gen_random_uuid(),
  lot_id text not null references public.lots(id) on delete cascade,
  user_id text not null,
  user_name text not null,
  amount integer not null check (amount > 0),
  created_at timestamptz not null default now()
);

create table if not exists public.cart_items (
  id uuid primary key default gen_random_uuid(),
  lot_id text not null references public.lots(id) on delete cascade,
  user_id text not null,
  created_at timestamptz not null default now(),
  unique (lot_id, user_id)
);

-- Seed the lots currently displayed by index-4.html. Re-running is safe.
insert into public.lots (id, name, starting_price, current_bid) values
  ('LOT-0032', 'Nike Air Max Deadstock', 2000, 2000),
  ('LOT-0058', 'Sterling 8-Ball Ring Set', 2000, 2000),
  ('LOT-0047', '1990s Carhartt Detroit Jacket', 4200, 4200)
on conflict (id) do nothing;

alter table public.lots enable row level security;
alter table public.bids enable row level security;
alter table public.cart_items enable row level security;

grant usage on schema public to anon, authenticated;
grant select, update on public.lots to anon, authenticated;
grant select, insert on public.bids to anon, authenticated;
grant select, insert, delete on public.cart_items to anon, authenticated;

-- This static-site implementation sends Clerk user IDs with each write. Tighten
-- these policies with Clerk JWT claims before a production deployment.
create policy "lots are readable" on public.lots for select using (true);
create policy "lots may be updated" on public.lots for update using (true) with check (true);
create policy "bids are readable" on public.bids for select using (true);
create policy "signed-in clients may create bids" on public.bids for insert with check (true);
create policy "cart owner can read cart" on public.cart_items for select using (true);
create policy "clients may add cart items" on public.cart_items for insert with check (true);
create policy "clients may remove cart items" on public.cart_items for delete using (true);

alter publication supabase_realtime add table public.bids;
