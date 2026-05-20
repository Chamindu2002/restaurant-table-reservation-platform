<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ page import="java.util.List" %>--%>

<%--<html>--%>
<%--<head>--%>

<%--    <meta charset="UTF-8">--%>

<%--    <title>Reservations</title>--%>

<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"--%>
<%--          rel="stylesheet">--%>

<%--</head>--%>

<%--<body class="container mt-5">--%>

<%--<h2 class="mb-4 text-center">Reservation List</h2>--%>

<%--<%--%>
<%--    List<String> results =--%>
<%--            (List<String>) request.getAttribute("results");--%>

<%--    if (results != null && !results.isEmpty()) {--%>
<%--%>--%>

<%--<table class="table table-hover table-bordered shadow">--%>

<%--    <tr class="table-dark">--%>

<%--        <th>ID</th>--%>
<%--        <th>Name</th>--%>
<%--        <th>Date</th>--%>
<%--        <th>Time</th>--%>
<%--        <th>Guests</th>--%>
<%--        <th>Table</th>--%>
<%--        <th>Type</th>--%>
<%--        <th>Actions</th>--%>

<%--    </tr>--%>

<%--    <%--%>
<%--        for (String r : results) {--%>

<%--            String[] p = r.split(",");--%>
<%--    %>--%>

<%--    <tr>--%>

<%--        <td><%= p[0] %></td>--%>
<%--        <td><%= p[1] %></td>--%>
<%--        <td><%= p[2] %></td>--%>
<%--        <td><%= p[3] %></td>--%>
<%--        <td><%= p[4] %></td>--%>
<%--        <td><%= p[5] %></td>--%>
<%--        <td><%= p[6] %></td>--%>

<%--        <td class="d-flex gap-2">--%>

<%--            <!-- UPDATE -->--%>

<%--            <form action="update.jsp" method="get">--%>

<%--                <input type="hidden" name="id" value="<%= p[0] %>">--%>
<%--                <input type="hidden" name="name" value="<%= p[1] %>">--%>
<%--                <input type="hidden" name="date" value="<%= p[2] %>">--%>
<%--                <input type="hidden" name="time" value="<%= p[3] %>">--%>
<%--                <input type="hidden" name="guests" value="<%= p[4] %>">--%>
<%--                <input type="hidden" name="table" value="<%= p[5] %>">--%>
<%--                <input type="hidden" name="type" value="<%= p[6] %>">--%>

<%--                <button class="btn btn-warning btn-sm">--%>
<%--                    Update--%>
<%--                </button>--%>

<%--            </form>--%>

<%--            <!-- DELETE -->--%>

<%--            <form action="reservation"--%>
<%--                  method="post"--%>
<%--                  onsubmit="return confirm('Delete this reservation?');">--%>

<%--                <input type="hidden" name="action" value="delete">--%>
<%--                <input type="hidden" name="id" value="<%= p[0] %>">--%>

<%--                <button class="btn btn-danger btn-sm">--%>
<%--                    Delete--%>
<%--                </button>--%>

<%--            </form>--%>

<%--        </td>--%>

<%--    </tr>--%>

<%--    <%--%>
<%--        }--%>
<%--    %>--%>

<%--</table>--%>

<%--<%--%>
<%--} else {--%>
<%--%>--%>

<%--<h4 class="text-danger text-center">--%>
<%--    No reservations found!--%>
<%--</h4>--%>

<%--<%--%>
<%--    }--%>
<%--%>--%>

<%--<div class="text-center mt-4">--%>

<%--    <a href="index.jsp" class="btn btn-secondary btn-lg">--%>
<%--        Back Home--%>
<%--    </a>--%>

<%--</div>--%>

<%--</body>--%>
<%--</html>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Reservation" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Reservations — Réservation</title>
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
            --line:  rgba(201,168,76,0.2);
            --row-hover: rgba(201,168,76,0.04);
            --danger: #c0392b;
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
            padding: 80px 32px 60px; max-width: 1300px; margin: 0 auto; }

        /* ── Breadcrumb ── */
        .breadcrumb { display: flex; align-items: center; gap: 10px;
            font-size: 11px; letter-spacing: 0.2em; text-transform: uppercase;
            color: var(--muted); margin-bottom: 40px; }
        .breadcrumb a { color: var(--gold); text-decoration: none; }
        .breadcrumb a:hover { color: var(--gold2); }

        /* ── Page header ── */
        .header { display: flex; align-items: flex-end; justify-content: space-between;
            flex-wrap: wrap; gap: 24px; margin-bottom: 40px; }
        .header-left .eyebrow { font-size: 10px; letter-spacing: 0.35em;
            text-transform: uppercase; color: var(--gold); margin-bottom: 8px; }
        .header-left h1 { font-family: 'Cormorant Garamond', serif; font-size: 44px;
            font-weight: 300; line-height: 1.1; }
        .header-left h1 em { font-style: italic; color: var(--gold2); }

        /* ── Search bar ── */
        .search-form { display: flex; gap: 0; }
        .search-form input {
            background: rgba(255,255,255,0.03); border: 1px solid var(--line);
            border-right: none; color: var(--cream); padding: 11px 18px;
            font-family: 'DM Sans', sans-serif; font-size: 13px; width: 260px;
            outline: none; transition: border-color 0.2s;
        }
        .search-form input:focus { border-color: var(--gold); }
        .search-form input::placeholder { color: var(--muted); }
        .search-form button {
            padding: 11px 20px; background: var(--gold); border: none; color: var(--ink);
            font-family: 'DM Sans', sans-serif; font-size: 11px; letter-spacing: 0.15em;
            text-transform: uppercase; font-weight: 500; cursor: pointer;
            transition: background 0.2s;
        }
        .search-form button:hover { background: var(--gold2); }

        /* ── Stats bar ── */
        .stats-bar { display: flex; gap: 32px; flex-wrap: wrap;
            padding: 20px 24px; border: 1px solid var(--line);
            background: rgba(255,255,255,0.02); margin-bottom: 24px; }
        .stat { display: flex; flex-direction: column; gap: 4px; }
        .stat-val { font-family: 'Cormorant Garamond', serif; font-size: 26px;
            font-weight: 300; color: var(--gold2); }
        .stat-label { font-size: 10px; letter-spacing: 0.2em; text-transform: uppercase;
            color: var(--muted); }

        /* ── Table ── */
        .table-wrap { border: 1px solid var(--line); overflow-x: auto; }
        table { width: 100%; border-collapse: collapse; }
        thead { border-bottom: 1px solid var(--line); }
        th { padding: 14px 18px; text-align: left; font-size: 10px; letter-spacing: 0.25em;
            text-transform: uppercase; color: var(--gold); font-weight: 500;
            background: rgba(201,168,76,0.04); white-space: nowrap; }
        td { padding: 16px 18px; font-size: 13px; color: var(--cream);
            border-bottom: 1px solid rgba(201,168,76,0.08); vertical-align: middle; }
        tr:last-child td { border-bottom: none; }
        tr:hover td { background: var(--row-hover); }

        /* ── Badges ── */
        .badge {
            display: inline-block; padding: 3px 10px; font-size: 10px;
            letter-spacing: 0.15em; text-transform: uppercase; font-weight: 500;
            border: 1px solid;
        }
        .badge-vip { color: var(--gold); border-color: var(--gold);
            background: rgba(201,168,76,0.08); }
        .badge-standard { color: var(--muted); border-color: var(--muted);
            background: transparent; }

        .cost-cell { font-family: 'Cormorant Garamond', serif; font-size: 16px;
            color: var(--gold2); font-weight: 300; }

        /* ── Actions ── */
        .actions-cell { display: flex; gap: 8px; align-items: center; }
        .btn-edit {
            padding: 6px 14px; border: 1px solid var(--line); background: transparent;
            color: var(--muted); font-size: 10px; letter-spacing: 0.15em; text-transform: uppercase;
            cursor: pointer; transition: all 0.2s; font-family: 'DM Sans', sans-serif;
        }
        .btn-edit:hover { border-color: var(--gold); color: var(--cream); }
        .btn-delete {
            padding: 6px 14px; border: 1px solid rgba(192,57,43,0.3); background: transparent;
            color: rgba(192,57,43,0.7); font-size: 10px; letter-spacing: 0.15em;
            text-transform: uppercase; cursor: pointer; transition: all 0.2s;
            font-family: 'DM Sans', sans-serif;
        }
        .btn-delete:hover { border-color: var(--danger); color: var(--danger); background: rgba(192,57,43,0.07); }

        /* ── Empty state ── */
        .empty { padding: 80px 24px; text-align: center; }
        .empty-icon { font-size: 36px; margin-bottom: 16px; opacity: 0.4; }
        .empty h3 { font-family: 'Cormorant Garamond', serif; font-size: 28px;
            font-weight: 300; color: var(--muted); margin-bottom: 8px; }
        .empty p { font-size: 13px; color: var(--muted); }
        .btn-ghost { display: inline-block; margin-top: 24px; padding: 12px 28px;
            border: 1px solid var(--line); color: var(--muted); text-decoration: none;
            font-size: 11px; letter-spacing: 0.15em; text-transform: uppercase;
            transition: all 0.2s; }
        .btn-ghost:hover { border-color: var(--gold); color: var(--cream); }

        /* ── Delete modal ── */
        .modal-backdrop {
            display: none; position: fixed; inset: 0; z-index: 100;
            background: rgba(0,0,0,0.75); backdrop-filter: blur(4px);
            align-items: center; justify-content: center;
        }
        .modal-backdrop.active { display: flex; }
        .modal {
            background: #111; border: 1px solid var(--line); padding: 40px;
            max-width: 420px; width: 90%; text-align: center;
        }
        .modal h3 { font-family: 'Cormorant Garamond', serif; font-size: 28px;
            font-weight: 300; margin-bottom: 12px; }
        .modal p { font-size: 13px; color: var(--muted); margin-bottom: 28px; line-height: 1.6; }
        .modal-actions { display: flex; gap: 12px; justify-content: center; }
        .modal-cancel {
            padding: 12px 24px; background: transparent; border: 1px solid var(--line);
            color: var(--muted); font-family: 'DM Sans', sans-serif; font-size: 11px;
            letter-spacing: 0.15em; text-transform: uppercase; cursor: pointer;
            transition: all 0.2s;
        }
        .modal-cancel:hover { border-color: var(--gold); color: var(--cream); }
        .modal-confirm {
            padding: 12px 24px; background: var(--danger); border: none;
            color: white; font-family: 'DM Sans', sans-serif; font-size: 11px;
            letter-spacing: 0.15em; text-transform: uppercase; cursor: pointer;
            transition: background 0.2s;
        }
        .modal-confirm:hover { background: #a93226; }

        /* New reservation link */
        .new-link { display: inline-flex; align-items: center; gap: 8px;
            padding: 11px 22px; background: var(--gold); color: var(--ink);
            text-decoration: none; font-size: 11px; letter-spacing: 0.18em;
            text-transform: uppercase; font-weight: 500; transition: background 0.2s; }
        .new-link:hover { background: var(--gold2); }
    </style>
</head>
<body>
<div class="top-bar"></div>

<%
    List<Reservation> results = (List<Reservation>) request.getAttribute("results");
    String keyword = (String) request.getAttribute("keyword");
    if (results == null) results = new java.util.ArrayList<>();

    int totalGuests = 0;
    double totalRevenue = 0;
    int vipCount = 0;
    for (Reservation r : results) {
        totalGuests  += r.getGuests();
        totalRevenue += r.calculateCost();
        if ("VIP".equalsIgnoreCase(r.getType())) vipCount++;
    }
%>

<div class="page">

    <div class="breadcrumb">
        <a href="index.jsp">Home</a>
        <span>›</span>
        <span>Reservations</span>
    </div>

    <div class="header">
        <div class="header-left">
            <p class="eyebrow">Reservation Management</p>
            <h1>All <em>Reservations</em></h1>
        </div>
        <div style="display:flex;gap:12px;align-items:flex-end;flex-wrap:wrap;">
            <form class="search-form" action="reservation" method="get">
                <input type="hidden" name="action" value="search">
                <input type="text" name="keyword" placeholder="Search by name, date, ID…"
                       value="<%= keyword != null ? keyword : "" %>">
                <button type="submit">Search</button>
            </form>
            <a href="create.jsp" class="new-link">+ New Reservation</a>
        </div>
    </div>

    <% if (!results.isEmpty()) { %>

    <!-- Stats -->
    <div class="stats-bar">
        <div class="stat">
            <span class="stat-val"><%= results.size() %></span>
            <span class="stat-label">Reservations</span>
        </div>
        <div class="stat">
            <span class="stat-val"><%= totalGuests %></span>
            <span class="stat-label">Total Guests</span>
        </div>
        <div class="stat">
            <span class="stat-val"><%= vipCount %></span>
            <span class="stat-label">VIP Bookings</span>
        </div>
        <div class="stat">
            <span class="stat-val">Rs. <%= String.format("%,.0f", totalRevenue) %></span>
            <span class="stat-label">Total Revenue</span>
        </div>
    </div>

    <!-- Table -->
    <div class="table-wrap">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Guest Name</th>
                <th>Date</th>
                <th>Time</th>
                <th>Guests</th>
                <th>Table</th>
                <th>Type</th>
                <th>Cost</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (Reservation r : results) { %>
            <tr>
                <td><%= r.getId() %></td>
                <td><strong><%= r.getName() %></strong></td>
                <td><%= r.getDate() %></td>
                <td><%= r.getTime() %></td>
                <td><%= r.getGuests() %></td>
                <td>Table <%= r.getTable() %></td>
                <td>
                    <span class="badge <%= "VIP".equalsIgnoreCase(r.getType()) ? "badge-vip" : "badge-standard" %>">
                        <%= r.getType() %>
                    </span>
                </td>
                <td class="cost-cell">Rs. <%= String.format("%,.2f", r.calculateCost()) %></td>
                <td class="actions-cell">

                    <!-- Edit button → go to update.jsp with query params -->
                    <form action="update.jsp" method="get" style="display:inline;">
                        <input type="hidden" name="id"     value="<%= r.getId() %>">
                        <input type="hidden" name="name"   value="<%= r.getName() %>">
                        <input type="hidden" name="date"   value="<%= r.getDate() %>">
                        <input type="hidden" name="time"   value="<%= r.getTime() %>">
                        <input type="hidden" name="guests" value="<%= r.getGuests() %>">
                        <input type="hidden" name="table"  value="<%= r.getTable() %>">
                        <input type="hidden" name="type"   value="<%= r.getType() %>">
                        <button type="submit" class="btn-edit">Edit</button>
                    </form>

                    <!-- Delete button → triggers modal -->
                    <button class="btn-delete"
                            onclick="openDeleteModal('<%= r.getId() %>', '<%= r.getName() %>')">
                        Delete
                    </button>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <% } else { %>
    <div class="empty">
        <div class="empty-icon">◈</div>
        <h3>No reservations found</h3>
        <p><%= (keyword != null && !keyword.isEmpty())
                ? "No results match \"" + keyword + "\". Try a different search term."
                : "No reservations have been made yet." %></p>
        <a href="create.jsp" class="btn-ghost">Make First Reservation</a>
    </div>
    <% } %>

</div>

<!-- Delete Confirmation Modal -->
<div class="modal-backdrop" id="deleteModal">
    <div class="modal">
        <h3>Delete Reservation</h3>
        <p id="modalMsg">Are you sure you want to delete this reservation?<br>This action cannot be undone.</p>
        <div class="modal-actions">
            <button class="modal-cancel" onclick="closeDeleteModal()">Cancel</button>
            <form id="deleteForm" action="reservation" method="post" style="display:inline;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" id="deleteId">
                <button type="submit" class="modal-confirm">Yes, Delete</button>
            </form>
        </div>
    </div>
</div>

<script>
    function openDeleteModal(id, name) {
        document.getElementById('deleteId').value = id;
        document.getElementById('modalMsg').textContent =
            'Delete the reservation for ' + name + ' (' + id + ')? This cannot be undone.';
        document.getElementById('deleteModal').classList.add('active');
    }
    function closeDeleteModal() {
        document.getElementById('deleteModal').classList.remove('active');
    }
    // Close on backdrop click
    document.getElementById('deleteModal').addEventListener('click', function(e) {
        if (e.target === this) closeDeleteModal();
    });
</script>
</body>
</html>
