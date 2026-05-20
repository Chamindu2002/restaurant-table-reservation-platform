<%--<html>--%>
<%--<head>--%>
<%--    <title>Result</title>--%>

<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"--%>
<%--          rel="stylesheet">--%>

<%--    <style>--%>
<%--        body {--%>
<%--            background: #eef2f7;--%>
<%--        }--%>

<%--        .box {--%>
<%--            margin-top: 120px;--%>
<%--            background: white;--%>
<%--            padding: 40px;--%>
<%--            border-radius: 20px;--%>
<%--            box-shadow: 0 0 15px rgba(0,0,0,0.1);--%>
<%--            text-align: center;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>

<%--<body>--%>

<%--<div class="container col-md-6">--%>

<%--    <div class="box">--%>

<%--        <h2 class="mb-4">System Message</h2>--%>

<%--        <div class="alert alert-info">--%>
<%--            <%= request.getAttribute("msg") %>--%>
<%--        </div>--%>

<%--        <div class="mt-4">--%>

<%--            <a href="index.jsp" class="btn btn-primary btn-lg">--%>
<%--                Home--%>
<%--            </a>--%>

<%--            <a href="create.jsp" class="btn btn-success btn-lg">--%>
<%--                Add Another--%>
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
    <title>Result — Réservation</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
        :root {
            --ink: #0a0a0a; --gold: #c9a84c; --gold2: #e8d5a3;
            --cream: #f5f0e8; --muted: #6b6355; --line: rgba(201,168,76,0.25);
            --success: #27ae60; --error: #c0392b;
        }
        html, body { height: 100%; background: var(--ink); color: var(--cream); font-family: 'DM Sans', sans-serif; }
        body::before {
            content: ''; position: fixed; inset: 0; z-index: 0;
            background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");
            pointer-events: none; opacity: 0.6;
        }
        .top-bar { position: fixed; top: 0; left: 0; right: 0; z-index: 10; height: 2px;
            background: linear-gradient(90deg, transparent, var(--gold), transparent); }
        .page { position: relative; z-index: 1; min-height: 100vh;
            display: flex; align-items: center; justify-content: center; padding: 40px 24px; }
        .card { width: 100%; max-width: 480px; border: 1px solid var(--line);
            background: rgba(255,255,255,0.03); padding: 52px 48px; text-align: center;
            animation: pop 0.5s cubic-bezier(0.34, 1.56, 0.64, 1) forwards; }

        .icon { font-size: 40px; margin-bottom: 20px; }
        .eyebrow { font-size: 10px; letter-spacing: 0.3em; text-transform: uppercase;
            color: var(--muted); margin-bottom: 12px; }
        h2 { font-family: 'Cormorant Garamond', serif; font-size: 36px;
            font-weight: 300; margin-bottom: 20px; line-height: 1.2; }

        .msg-box { padding: 18px 24px; margin-bottom: 36px; font-size: 14px; line-height: 1.6; }
        .msg-box.success { background: rgba(39,174,96,0.1); border: 1px solid rgba(39,174,96,0.3); color: #6fcf97; }
        .msg-box.error   { background: rgba(192,57,43,0.1); border: 1px solid rgba(192,57,43,0.3); color: #e57373; }

        .ornament { display: flex; align-items: center; gap: 12px; justify-content: center; margin-bottom: 32px; }
        .ornament::before, .ornament::after { content: ''; width: 40px; height: 1px; background: var(--line); }
        .ornament-diamond { width: 5px; height: 5px; background: var(--gold); transform: rotate(45deg); }

        .actions { display: flex; gap: 12px; justify-content: center; flex-wrap: wrap; }
        .btn-primary { padding: 13px 28px; background: var(--gold); color: var(--ink);
            border: none; font-family: 'DM Sans', sans-serif; font-size: 11px;
            letter-spacing: 0.18em; text-transform: uppercase; font-weight: 500;
            cursor: pointer; text-decoration: none; transition: background 0.2s; display: inline-block; }
        .btn-primary:hover { background: var(--gold2); }
        .btn-ghost { padding: 13px 24px; background: transparent; border: 1px solid var(--line);
            color: var(--muted); font-family: 'DM Sans', sans-serif; font-size: 11px;
            letter-spacing: 0.15em; text-transform: uppercase; text-decoration: none;
            display: inline-block; transition: all 0.2s; }
        .btn-ghost:hover { border-color: var(--gold); color: var(--cream); }

        @keyframes pop {
            from { opacity: 0; transform: scale(0.95) translateY(20px); }
            to   { opacity: 1; transform: scale(1) translateY(0); }
        }
    </style>
</head>
<body>
<div class="top-bar"></div>
<div class="page">
    <%
        String msg = (String) request.getAttribute("msg");
        if (msg == null) msg = "";
        boolean isSuccess = msg.startsWith("✅");
    %>
    <div class="card">

        <div class="icon"><%= isSuccess ? "✦" : "◇" %></div>
        <p class="eyebrow">System Response</p>
        <h2><%= isSuccess ? "All Done" : "Notice" %></h2>

        <div class="msg-box <%= isSuccess ? "success" : "error" %>">
            <%= msg %>
        </div>

        <div class="ornament"><div class="ornament-diamond"></div></div>

        <div class="actions">
            <a href="index.jsp" class="btn-ghost">Home</a>
            <a href="reservation?action=viewAll" class="btn-ghost">View All</a>
            <a href="create.jsp" class="btn-primary">New Reservation</a>
        </div>

    </div>
</div>
</body>
</html>
