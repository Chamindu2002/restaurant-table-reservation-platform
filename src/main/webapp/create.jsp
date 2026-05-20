<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<html>--%>
<%--<head>--%>

<%--    <meta charset="UTF-8">--%>

<%--    <title>Create Reservation</title>--%>

<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"--%>
<%--          rel="stylesheet">--%>

<%--    <style>--%>

<%--        body {--%>
<%--            background: #f4f7fa;--%>
<%--        }--%>

<%--        .box {--%>
<%--            background: white;--%>
<%--            padding: 40px;--%>
<%--            border-radius: 20px;--%>
<%--            box-shadow: 0 0 15px rgba(0,0,0,0.1);--%>
<%--        }--%>

<%--        small {--%>
<%--            color: gray;--%>
<%--        }--%>

<%--    </style>--%>

<%--</head>--%>

<%--<body>--%>

<%--<div class="container mt-5 col-md-7">--%>

<%--    <div class="box">--%>

<%--        <h2 class="mb-4 text-center">--%>
<%--            Create Reservation--%>
<%--        </h2>--%>

<%--        <form action="reservation" method="post">--%>

<%--            <input type="hidden" name="action" value="create"/>--%>

<%--            <div class="row">--%>

<%--                <div class="col-md-6 mb-3">--%>

<%--                    <label>ID</label>--%>

<%--                    <input type="text"--%>
<%--                           name="id"--%>
<%--                           class="form-control"--%>
<%--                           required>--%>

<%--                    <small>Reservation ID must be unique</small>--%>

<%--                </div>--%>

<%--                <div class="col-md-6 mb-3">--%>

<%--                    <label>Name</label>--%>

<%--                    <input type="text"--%>
<%--                           name="name"--%>
<%--                           class="form-control"--%>
<%--                           required>--%>

<%--                    <small>Enter customer full name</small>--%>

<%--                </div>--%>

<%--                <div class="col-md-6 mb-3">--%>

<%--                    <label>Date</label>--%>

<%--                    <input type="date"--%>
<%--                           name="date"--%>
<%--                           class="form-control"--%>
<%--                           required>--%>

<%--                    <small>Select reservation date</small>--%>

<%--                </div>--%>

<%--                <div class="col-md-6 mb-3">--%>

<%--                    <label>Time</label>--%>

<%--                    <input type="time"--%>
<%--                           name="time"--%>
<%--                           class="form-control"--%>
<%--                           required>--%>

<%--                    <small>Select reservation time</small>--%>

<%--                </div>--%>

<%--                <div class="col-md-6 mb-3">--%>

<%--                    <label>Guests</label>--%>

<%--                    <input type="number"--%>
<%--                           name="guests"--%>
<%--                           class="form-control"--%>
<%--                           min="1"--%>
<%--                           max="20"--%>
<%--                           required>--%>

<%--                    <small>Allowed range: 1 - 20 guests</small>--%>

<%--                </div>--%>

<%--                <div class="col-md-6 mb-3">--%>

<%--                    <label>Table</label>--%>

<%--                    <input type="number"--%>
<%--                           name="table"--%>
<%--                           class="form-control"--%>
<%--                           min="1"--%>
<%--                           max="50"--%>
<%--                           required>--%>

<%--                    <small>Allowed table numbers: 1 - 50</small>--%>

<%--                </div>--%>

<%--                <div class="col-md-12 mb-3">--%>

<%--                    <label>Reservation Type</label>--%>

<%--                    <select name="type"--%>
<%--                            class="form-select">--%>

<%--                        <option>Standard</option>--%>
<%--                        <option>VIP</option>--%>

<%--                    </select>--%>

<%--                    <small>Select reservation category</small>--%>

<%--                </div>--%>

<%--            </div>--%>

<%--            <div class="text-center mt-4">--%>

<%--                <button class="btn btn-success btn-lg">--%>
<%--                    Create Reservation--%>
<%--                </button>--%>

<%--                <a href="index.jsp"--%>
<%--                   class="btn btn-secondary btn-lg">--%>
<%--                    Back--%>
<%--                </a>--%>

<%--            </div>--%>

<%--        </form>--%>

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
    <title>New Reservation — Réservation</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --ink:   #0a0a0a;
            --gold:  #c9a84c;
            --gold2: #e8d5a3;
            --cream: #f5f0e8;
            --muted: #6b6355;
            --line:  rgba(201,168,76,0.25);
            --panel: rgba(255,255,255,0.03);
            --input-bg: rgba(255,255,255,0.04);
            --input-border: rgba(201,168,76,0.2);
        }

        html, body { min-height: 100%; background: var(--ink); color: var(--cream);
            font-family: 'DM Sans', sans-serif; }

        body::before {
            content: ''; position: fixed; inset: 0; z-index: 0;
            background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");
            pointer-events: none; opacity: 0.6;
        }

        .top-bar { position: fixed; top: 0; left: 0; right: 0; z-index: 10; height: 2px;
            background: linear-gradient(90deg, transparent, var(--gold), transparent); }

        .page { position: relative; z-index: 1; min-height: 100vh;
            display: flex; align-items: flex-start; justify-content: center;
            padding: 80px 24px 60px; }

        .container { width: 100%; max-width: 700px; }

        /* ── Nav breadcrumb ── */
        .breadcrumb { display: flex; align-items: center; gap: 10px;
            font-size: 11px; letter-spacing: 0.2em; text-transform: uppercase;
            color: var(--muted); margin-bottom: 40px;
            animation: rise 0.6s ease forwards; }
        .breadcrumb a { color: var(--gold); text-decoration: none; }
        .breadcrumb a:hover { color: var(--gold2); }
        .breadcrumb-sep { color: var(--muted); }

        /* ── Heading ── */
        .heading-block { margin-bottom: 48px; animation: rise 0.7s ease 0.1s both; }
        .eyebrow { font-size: 10px; letter-spacing: 0.35em; text-transform: uppercase;
            color: var(--gold); margin-bottom: 12px; }
        h1 { font-family: 'Cormorant Garamond', serif; font-size: 48px;
            font-weight: 300; line-height: 1.1; }
        h1 em { font-style: italic; color: var(--gold2); }

        /* ── Panel ── */
        .panel { background: var(--panel); border: 1px solid var(--line);
            padding: 40px; animation: rise 0.8s ease 0.2s both; }

        /* ── Section titles ── */
        .section-title { font-size: 10px; letter-spacing: 0.3em; text-transform: uppercase;
            color: var(--gold); margin-bottom: 20px; padding-bottom: 8px;
            border-bottom: 1px solid var(--line); }

        .row { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 24px; }
        .row.single { grid-template-columns: 1fr; }

        /* ── Form field ── */
        .field { display: flex; flex-direction: column; gap: 6px; }
        .field label { font-size: 10px; letter-spacing: 0.2em; text-transform: uppercase;
            color: var(--muted); }
        .field input, .field select {
            background: var(--input-bg);
            border: 1px solid var(--input-border);
            color: var(--cream);
            padding: 12px 16px;
            font-family: 'DM Sans', sans-serif;
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s, background 0.2s;
            -webkit-appearance: none; appearance: none;
        }
        .field input:focus, .field select:focus {
            border-color: var(--gold);
            background: rgba(201,168,76,0.05);
        }
        .field input::placeholder { color: var(--muted); }
        .field small { font-size: 11px; color: var(--muted); line-height: 1.4; }

        .field select option { background: #1a1a1a; }

        /* ── Type toggle ── */
        .type-toggle { display: grid; grid-template-columns: 1fr 1fr; gap: 1px;
            background: var(--line); border: 1px solid var(--line); }
        .type-toggle input[type="radio"] { display: none; }
        .type-toggle label {
            padding: 14px 20px; text-align: center; cursor: pointer;
            font-size: 12px; letter-spacing: 0.15em; text-transform: uppercase;
            font-weight: 500; color: var(--muted); background: var(--ink);
            transition: all 0.2s;
        }
        .type-toggle input:checked + label {
            background: var(--gold); color: var(--ink); font-weight: 500;
        }

        /* ── Cost preview ── */
        .cost-preview {
            margin-top: 24px; padding: 20px 24px;
            background: rgba(201,168,76,0.06); border: 1px solid var(--line);
            display: flex; align-items: center; justify-content: space-between;
        }
        .cost-label { font-size: 11px; letter-spacing: 0.2em; text-transform: uppercase;
            color: var(--muted); }
        .cost-value { font-family: 'Cormorant Garamond', serif; font-size: 28px;
            font-weight: 300; color: var(--gold2); }

        /* ── Divider ── */
        .divider { height: 1px; background: var(--line); margin: 32px 0; }

        /* ── Buttons ── */
        .actions { display: flex; gap: 16px; align-items: center; flex-wrap: wrap; }
        .btn-primary {
            padding: 14px 36px; background: var(--gold); color: var(--ink);
            border: none; font-family: 'DM Sans', sans-serif; font-size: 12px;
            font-weight: 500; letter-spacing: 0.2em; text-transform: uppercase;
            cursor: pointer; transition: background 0.2s, transform 0.2s;
        }
        .btn-primary:hover { background: var(--gold2); transform: translateY(-1px); }
        .btn-ghost {
            padding: 14px 28px; background: transparent; border: 1px solid var(--line);
            color: var(--muted); font-family: 'DM Sans', sans-serif; font-size: 12px;
            letter-spacing: 0.15em; text-transform: uppercase; text-decoration: none;
            transition: border-color 0.2s, color 0.2s;
        }
        .btn-ghost:hover { border-color: var(--gold); color: var(--cream); }

        @keyframes rise {
            from { opacity: 0; transform: translateY(16px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 580px) {
            .row { grid-template-columns: 1fr; }
            h1 { font-size: 36px; }
        }
    </style>
</head>
<body>
<div class="top-bar"></div>
<div class="page">
    <div class="container">

        <div class="breadcrumb">
            <a href="index.jsp">Home</a>
            <span class="breadcrumb-sep">›</span>
            <span>New Reservation</span>
        </div>

        <div class="heading-block">
            <p class="eyebrow">Reservation Management</p>
            <h1>Reserve a <em>Table</em></h1>
        </div>

        <div class="panel">

            <form action="reservation" method="post" id="createForm">
                <input type="hidden" name="action" value="create">

                <!-- Guest Details -->
                <p class="section-title">Guest Details</p>
                <div class="row">
                    <div class="field">
                        <label for="id">Reservation ID</label>
                        <input type="text" id="id" name="id" placeholder="e.g. RES-001" required
                               pattern="[A-Za-z0-9\-_]+" title="Letters, numbers, hyphens and underscores only">
                        <small>Unique identifier — letters, numbers &amp; hyphens</small>
                    </div>
                    <div class="field">
                        <label for="name">Guest Name</label>
                        <input type="text" id="name" name="name" placeholder="Full name" required>
                        <small>Enter customer full name</small>
                    </div>
                </div>

                <!-- Date & Time -->
                <p class="section-title">Date &amp; Time</p>
                <div class="row">
                    <div class="field">
                        <label for="date">Date</label>
                        <input type="date" id="date" name="date" required>
                        <small>Reservation date</small>
                    </div>
                    <div class="field">
                        <label for="time">Time</label>
                        <input type="time" id="time" name="time" required>
                        <small>Reservation time slot</small>
                    </div>
                </div>

                <!-- Table & Guests -->
                <p class="section-title">Seating</p>
                <div class="row">
                    <div class="field">
                        <label for="guests">Number of Guests</label>
                        <input type="number" id="guests" name="guests"
                               min="1" max="20" placeholder="1 – 20" required>
                        <small>Enter guest count between 1 and 20</small>
                    </div>
                    <div class="field">
                        <label for="table">Table Number</label>
                        <input type="number" id="table" name="table"
                               min="1" max="50" placeholder="1 – 50" required>
                        <small>Select from tables 1 to 50</small>
                    </div>
                </div>

                <!-- Type -->
                <p class="section-title">Reservation Type</p>
                <div class="row single">
                    <div class="field">
                        <div class="type-toggle">
                            <input type="radio" name="type" id="typeStandard" value="Standard" checked>
                            <label for="typeStandard">Standard — Rs. 1,000 / guest</label>
                            <input type="radio" name="type" id="typeVip" value="VIP">
                            <label for="typeVip">VIP — Rs. 2,000 / guest</label>
                        </div>
                        <small>VIP includes premium seating &amp; priority service</small>
                    </div>
                </div>

                <!-- Live cost preview -->
                <div class="cost-preview">
                    <span class="cost-label">Estimated Cost</span>
                    <span class="cost-value" id="costDisplay">Rs. 0.00</span>
                </div>

                <div class="divider"></div>

                <div class="actions">
                    <button type="submit" class="btn-primary">Confirm Reservation</button>
                    <a href="index.jsp" class="btn-ghost">Cancel</a>
                </div>

            </form>
        </div>

    </div>
</div>

<script>
    // Live cost calculation
    const guestsInput  = document.getElementById('guests');
    const costDisplay  = document.getElementById('costDisplay');
    const radios       = document.querySelectorAll('input[name="type"]');

    function updateCost() {
        const guests = parseInt(guestsInput.value) || 0;
        const type   = document.querySelector('input[name="type"]:checked').value;
        const rate   = type === 'VIP' ? 2000 : 1000;
        const total  = guests * rate;
        costDisplay.textContent = 'Rs. ' + total.toLocaleString('en-LK', {minimumFractionDigits: 2});
    }

    guestsInput.addEventListener('input', updateCost);
    radios.forEach(r => r.addEventListener('change', updateCost));

    // Set minimum date to today
    document.getElementById('date').min = new Date().toISOString().split('T')[0];
</script>
</body>
</html>
