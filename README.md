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
| `index.html` | Root page — redirects to the storefront |
| `serve.command` | Start a local web server (macOS) |
| `render.yaml` | Render static site deploy config |

## Deploy on Render

This app is a **static site** (HTML + Clerk + Supabase). No backend server is needed on Render.

### 1. Push the repo to GitHub

Make sure the latest code is on GitHub (your friend’s `nbhdraj/Thriftbid-via-Swaraj-` repo).

### 2. Create the Render static site

1. Go to [render.com](https://render.com) and sign in.
2. Click **New +** → **Static Site**.
3. Connect the GitHub repo `Thriftbid-via-Swaraj-`.
4. Use these settings:

| Setting | Value |
|---------|-------|
| **Name** | `thriftbid` (or anything you like) |
| **Branch** | `main` |
| **Root Directory** | *(leave blank)* |
| **Build Command** | `echo "no build"` |
| **Publish Directory** | `.` |

5. Click **Create Static Site**.

Render will give you a URL like `https://thriftbid.onrender.com`.

Or use the included blueprint: **New +** → **Blueprint** → point at the repo (Render reads `render.yaml` automatically).

### 3. Configure Clerk (required for login & signup)

Clerk must allow your Render domain, or sign-in will fail.

1. Open [dashboard.clerk.com](https://dashboard.clerk.com).
2. Select your app (the one with your publishable key).
3. Go to **Configure → Domains** (or **Paths**).
4. Add your Render URL, for example:
   - `https://thriftbid.onrender.com`
5. Under **Redirect URLs** / allowed origins, add:
   - `https://thriftbid.onrender.com/login-1.html`
   - `https://thriftbid.onrender.com/signup.html`
   - `https://thriftbid.onrender.com/dashboard-1.html`
   - `https://thriftbid.onrender.com/index-4.html`

Replace `thriftbid.onrender.com` with your actual Render URL.

### 4. Supabase (already cloud-hosted)

If you use the same Supabase project and keys already in the HTML files, **no extra Render setup is needed**. Bids, cart, and realtime updates work from the live site.

If you use a new Supabase project, run `supabase-schema.sql` once in the Supabase SQL Editor and update the keys in `index-4.html` and `dashboard-1.html`.

### 5. Test the live site

Open these URLs (replace with your Render domain):

| Page | URL |
|------|-----|
| Home | `https://YOUR-APP.onrender.com/` |
| Login | `https://YOUR-APP.onrender.com/login-1.html` |
| Sign up | `https://YOUR-APP.onrender.com/signup.html` |
| Dashboard | `https://YOUR-APP.onrender.com/dashboard-1.html` |

Shorter redirects also work: `/login`, `/signup`, `/dashboard`.

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
