package servlet;

import model.Reservation;
import service.ReservationService;
import util.FileManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {

    private final ReservationService service = new ReservationService();

    // ──────────────────────────────────────────────
    // POST  →  create / update / delete
    // ──────────────────────────────────────────────
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        initFilePath(req);

        String action = req.getParameter("action");
        String msg;

        switch (action == null ? "" : action) {

            case "create":
                msg = service.createReservation(
                        param(req, "id"),
                        param(req, "name"),
                        param(req, "date"),
                        param(req, "time"),
                        parseIntSafe(req.getParameter("guests")),
                        parseIntSafe(req.getParameter("table")),
                        param(req, "type")
                );
                break;

            case "update":
                msg = service.updateReservation(
                        param(req, "id"),
                        param(req, "name"),
                        param(req, "date"),
                        param(req, "time"),
                        parseIntSafe(req.getParameter("guests")),
                        parseIntSafe(req.getParameter("table")),
                        param(req, "type")
                );
                break;

            case "delete":
                msg = service.deleteReservation(param(req, "id"));
                break;

            default:
                msg = "❌ Unknown action!";
        }

        req.setAttribute("msg", msg);
        req.getRequestDispatcher("result.jsp").forward(req, resp);
    }

    // ──────────────────────────────────────────────
    // GET  →  viewAll / search
    // ──────────────────────────────────────────────
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        initFilePath(req);

        String action  = req.getParameter("action");
        String keyword = req.getParameter("keyword");  // may be null → viewAll

        if ("viewAll".equals(action) || "search".equals(action)) {
            List<Reservation> results = service.searchReservations(keyword);
            req.setAttribute("results", results);
            req.setAttribute("keyword", keyword == null ? "" : keyword);
            req.getRequestDispatcher("search.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("index.jsp");
        }
    }

    // ──────────────────────────────────────────────
    // Helpers
    // ──────────────────────────────────────────────
    private void initFilePath(HttpServletRequest req) {
        String path = getServletContext().getRealPath("/data/reservations.txt");
        FileManager.setFilePath(path);
    }

    private String param(HttpServletRequest req, String name) {
        String v = req.getParameter(name);
        return v == null ? "" : v.trim();
    }

    private int parseIntSafe(String value) {
        try {
            return Integer.parseInt(value == null ? "0" : value.trim());
        } catch (NumberFormatException e) {
            return 0;
        }
    }
}
