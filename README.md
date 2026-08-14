# Thriftbid-via-Swaraj-

A thrift auction site where anyone can bid on vintage, streetwear, and luxury pieces. Built with static HTML, [Clerk](https://clerk.com/) for sign-in, and [Supabase](https://supabase.com/) for live bids, cart, and lot data.

## Project files

| File | Purpose |
|------|---------|
| `index-4.html` | Main storefront — browse lots, place bids, manage cart |
| `login-1.html` | Sign in |
| `signup.html` | Create an account |
| `dashboard-1.html` | User dashboard — your bids and cart |
| `supabase-schema.sql` | Database tables, seed data, and realtime setup |
| `serve.command` | Start a local web server (macOS) |

## Run locally

You must serve the site over HTTP. Opening the HTML files directly (`file://`) will break sign-in.

**macOS**

```bash
./serve.command
```

This starts a server at `http://127.0.0.1:8000` and opens the login page.

**Windows / Linux**

```bash
python3 -m http.server 8000
```

Then open `http://127.0.0.1:8000/login-1.html` in your browser.

## Supabase setup

1. Create a Supabase project at [supabase.com](https://supabase.com).
2. Open the **SQL Editor** and run `supabase-schema.sql` once.
3. Copy your project URL and anon key into `index-4.html` and `dashboard-1.html`:

```js
const TB_SUPABASE_URL = 'https://YOUR_PROJECT.supabase.co';
const TB_SUPABASE_ANON_KEY = 'YOUR_ANON_KEY';
```

## Clerk setup

Sign-in uses Clerk. Replace the publishable key in `login-1.html` and `signup.html` if you use your own Clerk app:

```html
data-clerk-publishable-key="pk_test_..."
```

## Share with a teammate

Send them the whole project folder. As long as they have Python 3, internet access, and use the same Supabase/Clerk keys, they will connect to the same backend and see the same live data.

## License

AGPL-3.0 — see [LICENSE](LICENSE).
