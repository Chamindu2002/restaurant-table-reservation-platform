<%--<html>--%>
<%--<head>--%>
<%--    <title>Restaurant Reservation Platform</title>--%>

<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>

<%--    <style>--%>
<%--        body {--%>
<%--            background: linear-gradient(135deg, #141e30, #243b55);--%>
<%--            color: white;--%>
<%--            overflow-x: hidden;--%>
<%--        }--%>

<%--        .hero {--%>
<%--            text-align: center;--%>
<%--            margin-top: 120px;--%>
<%--            animation: fadeIn 1.2s ease;--%>
<%--        }--%>

<%--        h1 {--%>
<%--            font-size: 4rem;--%>
<%--            font-weight: bold;--%>
<%--        }--%>

<%--        .subtitle {--%>
<%--            font-size: 1.3rem;--%>
<%--            color: #ddd;--%>
<%--            margin-top: 15px;--%>
<%--        }--%>

<%--        .main-box {--%>
<%--            margin-top: 60px;--%>
<%--            background: rgba(255,255,255,0.1);--%>
<%--            backdrop-filter: blur(10px);--%>
<%--            padding: 40px;--%>
<%--            border-radius: 20px;--%>
<%--            box-shadow: 0 0 20px rgba(0,0,0,0.3);--%>
<%--        }--%>

<%--        .btn-custom {--%>
<%--            width: 280px;--%>
<%--            padding: 16px;--%>
<%--            font-size: 20px;--%>
<%--            border-radius: 12px;--%>
<%--            transition: 0.4s;--%>
<%--            font-weight: bold;--%>
<%--        }--%>

<%--        .btn-custom:hover {--%>
<%--            transform: scale(1.08);--%>
<%--        }--%>

<%--        @keyframes fadeIn {--%>
<%--            from {--%>
<%--                opacity: 0;--%>
<%--                transform: translateY(30px);--%>
<%--            }--%>
<%--            to {--%>
<%--                opacity: 1;--%>
<%--                transform: translateY(0);--%>
<%--            }--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>

<%--<body>--%>

<%--<div class="container hero">--%>

<%--    <h1>Restaurant Table Reservation</h1>--%>

<%--    <p class="subtitle">--%>
<%--        Modern reservation management platform for restaurants--%>
<%--    </p>--%>

<%--    <div class="main-box col-md-6 mx-auto">--%>

<%--        <div class="d-flex flex-column align-items-center gap-4">--%>

<%--            <a href="create.jsp" class="btn btn-success btn-custom">--%>
<%--                Reserve Table--%>
<%--            </a>--%>

<%--            <a href="reservation?action=viewAll"--%>
<%--               class="btn btn-primary btn-custom">--%>
<%--                View Reservations--%>
<%--            </a>--%>

<%--        </div>--%>

<%--    </div>--%>

<%--</div>--%>

<%--</body>--%>
<%--</html>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Réservation — Restaurant Table Management</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --ink:    #0a0a0a;
            --gold:   #c9a84c;
            --gold2:  #e8d5a3;
            --cream:  #f5f0e8;
            --muted:  #6b6355;
            --line:   rgba(201,168,76,0.25);
        }

        html, body {
            height: 100%;
            background: var(--ink);
            color: var(--cream);
            font-family: 'DM Sans', sans-serif;
            overflow-x: hidden;
        }

        /* ── Noise grain overlay ── */
        body::before {
            content: '';
            position: fixed; inset: 0; z-index: 0;
            background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");
            pointer-events: none;
            opacity: 0.6;
        }

        /* ── Gold decorative line top ── */
        .top-bar {
            position: fixed; top: 0; left: 0; right: 0; z-index: 10;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--gold), transparent);
        }

        /* ── Layout ── */
        .page {
            position: relative; z-index: 1;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 60px 24px;
        }

        /* ── Decorative circle glow ── */
        .glow {
            position: fixed;
            width: 600px; height: 600px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(201,168,76,0.07) 0%, transparent 70%);
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            pointer-events: none;
        }

        /* ── Logo / eyebrow ── */
        .eyebrow {
            font-family: 'DM Sans', sans-serif;
            font-size: 11px;
            font-weight: 500;
            letter-spacing: 0.35em;
            text-transform: uppercase;
            color: var(--gold);
            margin-bottom: 20px;
            opacity: 0;
            animation: rise 0.8s ease 0.2s forwards;
        }

        /* ── Main heading ── */
        h1 {
            font-family: 'Cormorant Garamond', serif;
            font-size: clamp(48px, 8vw, 96px);
            font-weight: 300;
            line-height: 1.0;
            text-align: center;
            letter-spacing: -0.01em;
            opacity: 0;
            animation: rise 0.9s ease 0.35s forwards;
        }

        h1 em {
            font-style: italic;
            color: var(--gold2);
        }

        /* ── Divider ornament ── */
        .ornament {
            display: flex;
            align-items: center;
            gap: 16px;
            margin: 32px 0;
            opacity: 0;
            animation: rise 0.8s ease 0.55s forwards;
        }

        .ornament::before,
        .ornament::after {
            content: '';
            flex: 1;
            max-width: 80px;
            height: 1px;
            background: var(--line);
        }

        .ornament-diamond {
            width: 6px; height: 6px;
            background: var(--gold);
            transform: rotate(45deg);
        }

        /* ── Subtitle ── */
        .subtitle {
            font-size: 14px;
            color: var(--muted);
            letter-spacing: 0.05em;
            text-align: center;
            margin-bottom: 56px;
            opacity: 0;
            animation: rise 0.8s ease 0.65s forwards;
        }

        /* ── Action cards ── */
        .cards {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
            opacity: 0;
            animation: rise 0.9s ease 0.8s forwards;
        }

        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 12px;
            width: 220px;
            padding: 40px 24px;
            border: 1px solid var(--line);
            background: rgba(255,255,255,0.02);
            text-decoration: none;
            color: var(--cream);
            transition: border-color 0.3s, background 0.3s, transform 0.3s;
            cursor: pointer;
            overflow: hidden;
        }

        .card::before {
            content: '';
            position: absolute; inset: 0;
            background: linear-gradient(135deg, rgba(201,168,76,0.08), transparent);
            opacity: 0;
            transition: opacity 0.3s;
        }

        .card:hover {
            border-color: var(--gold);
            background: rgba(201,168,76,0.05);
            transform: translateY(-4px);
        }

        .card:hover::before { opacity: 1; }

        .card-icon {
            font-size: 28px;
            line-height: 1;
        }

        .card-label {
            font-family: 'DM Sans', sans-serif;
            font-size: 11px;
            font-weight: 500;
            letter-spacing: 0.2em;
            text-transform: uppercase;
            color: var(--gold);
        }

        .card-desc {
            font-family: 'Cormorant Garamond', serif;
            font-size: 18px;
            font-weight: 300;
            text-align: center;
            line-height: 1.3;
        }

        /* ── Footer ── */
        footer {
            position: fixed; bottom: 28px; left: 0; right: 0;
            text-align: center;
            font-size: 11px;
            letter-spacing: 0.1em;
            color: var(--muted);
            opacity: 0;
            animation: rise 0.8s ease 1.1s forwards;
        }

        @keyframes rise {
            from { opacity: 0; transform: translateY(18px); }
            to   { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<div class="top-bar"></div>
<div class="glow"></div>

<div class="page">
    <p class="eyebrow">Table Reservation Platform</p>

    <h1>The Art of<br><em>Fine Dining</em></h1>

    <div class="ornament">
        <div class="ornament-diamond"></div>
    </div>

    <p class="subtitle">Manage reservations with elegance &amp; precision</p>

    <div class="cards">

        <a href="create.jsp" class="card">
            <div class="card-icon">✦</div>
            <span class="card-label">New</span>
            <span class="card-desc">Reserve a Table</span>
        </a>

        <a href="reservation?action=viewAll" class="card">
            <div class="card-icon">◈</div>
            <span class="card-label">Browse</span>
            <span class="card-desc">View All Reservations</span>
        </a>

    </div>
</div>

<footer>© Restaurant Reservation Platform &nbsp;·&nbsp; Reservation Management System</footer>
</body>
</html>
