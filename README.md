# Thriftbid-via-Swaraj-
a thrift store where anyone can bid for the product 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>THRIFTBID — Bid on the Real Thing</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Space+Mono:wght@400;700&family=Work+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
  :root{
    --ink:#15140F;
    --ink-2:#1E1D16;
    --paper:#F2EFE4;
    --paper-dim:#E7E3D4;
    --text-lt:#F5F3EA;
    --muted:#A8A597;
    --muted-dk:#6b6a60;
    --red:#E8402C;
    --red-dk:#C22F1E;
    --yellow:#F2B705;
    --blue:#2E6F9E;
    --green:#3E9142;
    --line: rgba(245,243,234,0.12);
  }
  *{margin:0;padding:0;box-sizing:border-box;}
  html{scroll-behavior:smooth;}
  body{
    background:var(--ink);
    color:var(--text-lt);
    font-family:'Work Sans',sans-serif;
    font-size:16px;
    line-height:1.5;
    overflow-x:hidden;
  }
  ::selection{background:var(--red);color:var(--text-lt);}
  a{color:inherit;text-decoration:none;}
  .wrap{max-width:1180px;margin:0 auto;padding:0 32px;}
  .display{font-family:'Anton',sans-serif;font-weight:400;letter-spacing:0.5px;text-transform:uppercase;}
  .mono{font-family:'Space Mono',monospace;}
  .eyebrow{
    font-family:'Space Mono',monospace;
    font-size:12px;
    letter-spacing:3px;
    text-transform:uppercase;
    color:var(--red);
    display:flex;align-items:center;gap:10px;
  }
  .eyebrow::before{content:"";width:7px;height:7px;border-radius:50%;background:var(--red);display:inline-block;flex-shrink:0;}
  img{display:block;max-width:100%;}
  button{font-family:inherit;cursor:pointer;border:none;background:none;}

  /* ---------- NAV ---------- */
  header{
    position:sticky;top:0;z-index:50;
    background:rgba(21,20,15,0.88);
    backdrop-filter:blur(10px);
    border-bottom:1px solid var(--line);
  }
  nav{
    display:flex;align-items:center;justify-content:space-between;
    padding:20px 32px;max-width:1180px;margin:0 auto;
  }
  .logo{font-family:'Anton',sans-serif;font-size:22px;letter-spacing:0.5px;}
  .logo span{color:var(--red);}
  .navlinks{display:flex;gap:36px;align-items:center;}
  .navlinks a{font-size:14px;font-weight:600;color:var(--muted);transition:color .2s;}
  .navlinks a:hover{color:var(--text-lt);}
  .btn{
    display:inline-flex;align-items:center;gap:8px;
    padding:12px 22px;border-radius:3px;
    font-size:13px;font-weight:700;letter-spacing:0.5px;text-transform:uppercase;
    transition:transform .15s ease, background .2s;
  }
  .btn:hover{transform:translateY(-2px);}
  .btn-red{background:var(--red);color:var(--text-lt);}
  .btn-red:hover{background:var(--red-dk);}
  .btn-ghost{border:1.5px solid var(--line);color:var(--text-lt);}
  .btn-ghost:hover{border-color:var(--text-lt);}
  .navcta{display:none;}
  @media(min-width:880px){.navcta{display:inline-flex;}}
  .navlinks{display:none;}
  @media(min-width:880px){.navlinks{display:flex;}}

  /* ---------- HERO ---------- */
  .hero{
    padding:80px 0 60px;
    position:relative;
  }
  .hero-grid{
    display:grid;grid-template-columns:1fr;gap:56px;align-items:center;
  }
  @media(min-width:960px){.hero-grid{grid-template-columns:1.05fr 0.85fr;}}
  h1.headline{
    font-size:clamp(44px,7vw,84px);
    line-height:0.98;
    margin:18px 0 22px;
  }
  h1.headline .lt{color:var(--text-lt);}
  h1.headline .rd{color:var(--red);}
  .hero p.sub{
    font-size:18px;color:var(--muted);max-width:480px;margin-bottom:32px;line-height:1.55;
  }
  .hero-ctas{display:flex;gap:16px;flex-wrap:wrap;margin-bottom:40px;}
  .trust-row{display:flex;gap:28px;flex-wrap:wrap;}
  .trust-item{display:flex;align-items:center;gap:8px;font-size:12.5px;color:var(--muted);font-weight:600;letter-spacing:0.3px;}
  .dot{width:7px;height:7px;border-radius:50%;display:inline-block;flex-shrink:0;}
  .dot-red{background:var(--red);} .dot-yellow{background:var(--yellow);} .dot-blue{background:var(--blue);} .dot-green{background:var(--green);}

  /* swinging tag */
  .tag-stage{position:relative;display:flex;justify-content:center;padding-top:20px;}
  .string{
    width:2px;height:60px;background:linear-gradient(var(--muted-dk),transparent);
    margin:0 auto;
  }
  .tag-swing{
    transform-origin:top center;
    animation:swing 5.5s ease-in-out infinite;
  }
  @keyframes swing{
    0%,100%{transform:rotate(-3deg);}
    50%{transform:rotate(3deg);}
  }
  .tag-card{
    width:300px;background:var(--paper);color:var(--ink);
    border-radius:14px;padding:22px;position:relative;
    box-shadow:0 30px 60px -20px rgba(0,0,0,0.55);
  }
  .tag-hole{
    width:16px;height:16px;border-radius:50%;background:var(--ink);
    position:absolute;top:-8px;left:50%;transform:translateX(-50%);
    border:5px solid var(--paper);
  }
  .tag-top{display:flex;justify-content:space-between;align-items:center;margin-bottom:14px;}
  .tag-lot{font-family:'Space Mono',monospace;font-size:11px;color:var(--muted-dk);letter-spacing:1px;}
  .tag-live{
    font-family:'Space Mono',monospace;font-size:10px;letter-spacing:1px;color:#fff;
    background:var(--red);padding:3px 8px;border-radius:3px;display:flex;align-items:center;gap:5px;
  }
  .pulse{width:6px;height:6px;border-radius:50%;background:#fff;animation:pulse 1.4s infinite;}
  @keyframes pulse{0%,100%{opacity:1;}50%{opacity:.25;}}
  .tag-img{width:100%;height:150px;border-radius:8px;overflow:hidden;margin-bottom:14px;background:#ccc;}
  .tag-img img{width:100%;height:100%;object-fit:cover;}
  .tag-name{font-weight:700;font-size:15px;margin-bottom:2px;}
  .tag-meta{font-size:12px;color:var(--muted-dk);margin-bottom:14px;}
  .tag-bidrow{display:flex;justify-content:space-between;align-items:flex-end;border-top:1px dashed rgba(21,20,15,0.2);padding-top:14px;}
  .tag-bid-label{font-size:10px;letter-spacing:1.5px;color:var(--muted-dk);text-transform:uppercase;margin-bottom:4px;}
  .tag-bid-val{font-family:'Space Mono',monospace;font-size:26px;font-weight:700;}
  .tag-timer{font-family:'Space Mono',monospace;font-size:18px;font-weight:700;color:var(--red-dk);}

  /* ---------- MARQUEE ---------- */
  .marquee{
    background:var(--red);color:var(--ink);
    overflow:hidden;white-space:nowrap;padding:13px 0;
    border-top:1px solid rgba(0,0,0,0.15);border-bottom:1px solid rgba(0,0,0,0.15);
  }
  .marquee-track{display:inline-block;animation:scroll 26s linear infinite;}
  .marquee span{
    font-family:'Space Mono',monospace;font-size:13px;font-weight:700;letter-spacing:1.5px;
    text-transform:uppercase;padding:0 22px;
  }
  @keyframes scroll{0%{transform:translateX(0);}100%{transform:translateX(-50%);}}

  /* ---------- SECTION GENERIC ---------- */
  section{padding:110px 0;}
  .sec-head{max-width:640px;margin-bottom:64px;}
  .sec-head h2{font-size:clamp(30px,4vw,46px);margin-top:16px;line-height:1.08;}
  .sec-head p{color:var(--muted);font-size:16px;margin-top:16px;max-width:520px;}

  /* ---------- HOW IT WORKS ---------- */
  .steps{display:grid;grid-template-columns:1fr;gap:18px;}
  @media(min-width:760px){.steps{grid-template-columns:repeat(4,1fr);}}
  .step-card{
    background:var(--ink-2);border:1px solid var(--line);border-radius:10px;padding:28px 24px;
    position:relative;transition:border-color .2s, transform .2s;
  }
  .step-card:hover{border-color:rgba(245,243,234,0.28);transform:translateY(-4px);}
  .step-dot{width:14px;height:14px;border-radius:50%;margin-bottom:22px;}
  .step-tag{font-family:'Space Mono',monospace;font-size:10.5px;letter-spacing:1.5px;color:var(--muted-dk);text-transform:uppercase;margin-bottom:8px;}
  .step-card h3{font-size:18px;font-weight:700;margin-bottom:10px;}
  .step-card p{font-size:13.5px;color:var(--muted);line-height:1.5;}
  .code-note{
    margin-top:40px;font-family:'Space Mono',monospace;font-size:12.5px;color:var(--muted-dk);
    display:flex;align-items:center;gap:10px;flex-wrap:wrap;
  }

  /* ---------- CATEGORIES ---------- */
  .cat-grid{display:grid;grid-template-columns:repeat(2,1fr);gap:14px;}
  @media(min-width:700px){.cat-grid{grid-template-columns:repeat(3,1fr);}}
  .cat-card{
    position:relative;border-radius:10px;overflow:hidden;aspect-ratio:4/5;
    background:var(--paper-dim);
  }
  .cat-card img{width:100%;height:100%;object-fit:cover;transition:transform .5s ease;}
  .cat-card:hover img{transform:scale(1.07);}
  .cat-overlay{
    position:absolute;inset:0;background:linear-gradient(to top, rgba(10,10,8,0.85) 0%, rgba(10,10,8,0.0) 55%);
  }
  .cat-label{
    position:absolute;bottom:14px;left:14px;right:14px;
    display:flex;justify-content:space-between;align-items:center;
  }
  .cat-label span.name{font-weight:700;font-size:14.5px;color:#fff;}
  .cat-label span.tagchip{
    font-family:'Space Mono',monospace;font-size:10px;color:var(--ink);
    background:var(--paper);padding:3px 7px;border-radius:3px;font-weight:700;
  }

  /* ---------- TRUST SPLIT ---------- */
  .trust-split{display:grid;grid-template-columns:1fr;gap:56px;align-items:center;}
  @media(min-width:900px){.trust-split{grid-template-columns:0.85fr 1.15fr;}}
  .trust-visual{position:relative;border-radius:14px;overflow:hidden;}
  .trust-visual img{width:100%;height:460px;object-fit:cover;}
  .qr-chip{
    position:absolute;bottom:18px;left:18px;background:var(--paper);border-radius:8px;
    padding:12px;display:flex;align-items:center;gap:12px;box-shadow:0 15px 30px -10px rgba(0,0,0,.5);
  }
  .qr-grid{display:grid;grid-template-columns:repeat(5,4px);grid-template-rows:repeat(5,4px);gap:2px;}
  .qr-grid div{background:var(--ink);}
  .qr-grid div.off{background:transparent;}
  .qr-text{color:var(--ink);}
  .qr-text .l1{font-family:'Space Mono',monospace;font-size:10px;font-weight:700;letter-spacing:0.5px;}
  .qr-text .l2{font-size:9.5px;color:var(--muted-dk);margin-top:2px;}

  .trust-list{display:flex;flex-direction:column;gap:26px;margin-top:34px;}
  .trust-row-item{display:flex;gap:18px;}
  .trust-row-item .dotwrap{
    width:34px;height:34px;border-radius:50%;flex-shrink:0;display:flex;align-items:center;justify-content:center;
    font-family:'Space Mono',monospace;font-weight:700;font-size:13px;
  }
  .trust-row-item h4{font-size:16px;margin-bottom:6px;}
  .trust-row-item p{font-size:13.5px;color:var(--muted);line-height:1.5;}

  /* ---------- LIVE LOTS ---------- */
  .lots-grid{display:grid;grid-template-columns:1fr;gap:20px;}
  @media(min-width:820px){.lots-grid{grid-template-columns:repeat(3,1fr);}}
  .lot-card{
    background:var(--ink-2);border:1px solid var(--line);border-radius:12px;overflow:hidden;
    display:flex;flex-direction:column;
  }
  .lot-img{height:220px;background:#333;overflow:hidden;}
  .lot-img img{width:100%;height:100%;object-fit:cover;}
  .lot-body{padding:20px;}
  .lot-toprow{display:flex;justify-content:space-between;align-items:center;margin-bottom:10px;}
  .lot-code{font-family:'Space Mono',monospace;font-size:10.5px;color:var(--muted-dk);}
  .lot-badge{font-family:'Space Mono',monospace;font-size:9.5px;background:var(--green);color:#fff;padding:2px 7px;border-radius:3px;letter-spacing:0.5px;}
  .lot-name{font-weight:700;font-size:15.5px;margin-bottom:14px;}
  .lot-bottom{display:flex;justify-content:space-between;align-items:flex-end;border-top:1px dashed var(--line);padding-top:14px;margin-bottom:16px;}
  .lot-bid-label{font-size:9.5px;letter-spacing:1px;color:var(--muted-dk);text-transform:uppercase;margin-bottom:4px;}
  .lot-bid-val{font-family:'Space Mono',monospace;font-size:20px;font-weight:700;}
  .lot-timer{font-family:'Space Mono',monospace;font-size:14px;color:var(--red);font-weight:700;}
  .lot-cta{
    width:100%;padding:12px;background:var(--paper);color:var(--ink);border-radius:6px;
    font-size:12.5px;font-weight:700;letter-spacing:0.5px;text-transform:uppercase;transition:background .2s;
  }
  .lot-cta:hover{background:#fff;}

  /* ---------- CTA BAND ---------- */
  .cta-band{background:var(--red);color:var(--ink);padding:90px 0;}
  .cta-inner{display:flex;flex-direction:column;align-items:flex-start;gap:26px;}
  @media(min-width:860px){.cta-inner{flex-direction:row;justify-content:space-between;align-items:center;}}
  .cta-inner h2{font-size:clamp(28px,4vw,44px);max-width:520px;line-height:1.05;}
  .cta-form{display:flex;gap:10px;flex-wrap:wrap;min-width:340px;}
  .cta-form input{
    flex:1;min-width:200px;padding:15px 16px;border-radius:4px;border:2px solid var(--ink);
    font-family:'Work Sans',sans-serif;font-size:14px;background:var(--paper);color:var(--ink);
  }
  .cta-form input::placeholder{color:var(--muted-dk);}
  .cta-form button{
    background:var(--ink);color:var(--text-lt);padding:15px 26px;border-radius:4px;
    font-weight:700;font-size:13px;letter-spacing:0.5px;text-transform:uppercase;white-space:nowrap;
    transition:opacity .2s;
  }
  .cta-form button:hover{opacity:.85;}
  .cta-msg{font-family:'Space Mono',monospace;font-size:12px;margin-top:8px;display:none;}

  /* ---------- FOOTER ---------- */
  footer{padding:56px 0 40px;}
  .foot-top{
    display:flex;flex-direction:column;gap:30px;padding-bottom:36px;border-bottom:1px solid var(--line);
    margin-bottom:26px;
  }
  @media(min-width:800px){.foot-top{flex-direction:row;justify-content:space-between;align-items:flex-start;}}
  .foot-links{display:flex;gap:40px;flex-wrap:wrap;}
  .foot-col h5{font-size:11px;letter-spacing:1.5px;text-transform:uppercase;color:var(--muted-dk);margin-bottom:14px;}
  .foot-col a{display:block;font-size:13.5px;color:var(--muted);margin-bottom:10px;}
  .foot-col a:hover{color:var(--text-lt);}
  .foot-bottom{display:flex;flex-direction:column;gap:10px;font-size:12.5px;color:var(--muted-dk);}
  @media(min-width:700px){.foot-bottom{flex-direction:row;justify-content:space-between;}}
  .foot-bottom .founder{color:var(--muted);font-weight:600;}
  .foot-bottom .founder span{color:var(--red);}

  .reveal{opacity:0;transform:translateY(24px);transition:opacity .7s ease, transform .7s ease;}
  .reveal.in{opacity:1;transform:translateY(0);}

  @media (prefers-reduced-motion: reduce){
    .tag-swing{animation:none;}
    .marquee-track{animation:none;}
    .pulse{animation:none;}
    .reveal{transition:none;opacity:1;transform:none;}
  }

  :focus-visible{outline:2px solid var(--yellow);outline-offset:3px;}
</style>
</head>
<body>

<header>
  <nav>
    <div class="logo">THRIFT<span>BID</span></div>
    <div class="navlinks">
      <a href="#how">How it works</a>
      <a href="#categories">Categories</a>
      <a href="#trust">Trust &amp; AI</a>
      <a href="#lots">Live lots</a>
    </div>
    <a href="#join" class="btn btn-red navcta">Join Waitlist</a>
  </nav>
</header>

<section class="hero">
  <div class="wrap hero-grid">
    <div>
      <div class="eyebrow">AI-Powered Thrift Auctions</div>
      <h1 class="headline display">
        <span class="lt">THE TAG</span><br>
        <span class="rd">DOESN'T LIE.</span>
      </h1>
      <p class="sub">Bid on real Carhartt, Nike, and vintage denim — every win backed by AI authentication and a QR code you can scan yourself. No fixed prices. No fakes.</p>
      <div class="hero-ctas">
        <a href="#join" class="btn btn-red">Join the Waitlist</a>
        <a href="#how" class="btn btn-ghost">See How It Works</a>
      </div>
      <div class="trust-row">
        <div class="trust-item"><span class="dot dot-red"></span>AI-Verified</div>
        <div class="trust-item"><span class="dot dot-blue"></span>QR Certified</div>
        <div class="trust-item"><span class="dot dot-green"></span>Live Auctions</div>
      </div>
    </div>

    <div class="tag-stage">
      <div style="position:relative;">
        <div class="string" style="position:absolute;left:50%;top:-60px;"></div>
        <div class="tag-swing">
          <div class="tag-card">
            <div class="tag-hole"></div>
            <div class="tag-top">
              <span class="tag-lot mono">LOT #0047</span>
              <span class="tag-live"><span class="pulse"></span>LIVE</span>
            </div>
            <div class="tag-img"><img src="data:image/jpeg;base64,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