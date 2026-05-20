//package service;
//
//import model.*;
//import util.FileManager;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
//public class ReservationService {
//
//    // ================= CREATE =================
//    public String createReservation(String id, String name, String date,
//                                    String time, int guests, int table, String type) {
//
//        try {
//
//            // VALIDATIONS
//            if (id.isEmpty() || name.isEmpty() || date.isEmpty() ||
//                    time.isEmpty() || type.isEmpty()) {
//
//                return "❌ All fields are required!";
//            }
//
//            if (guests <= 0) {
//                return "❌ Guests must be greater than 0!";
//            }
//
//            if (table <= 0) {
//                return "❌ Invalid table number!";
//            }
//
//            List<String> all = FileManager.readAll();
//
//            // Duplicate ID check
//            for (String line : all) {
//                String[] parts = line.split(",");
//
//                if (parts[0].equals(id)) {
//                    return "❌ Reservation ID already exists!";
//                }
//            }
//
//            // Table conflict check
//            for (String line : all) {
//                String[] parts = line.split(",");
//
//                if (parts[2].equals(date)
//                        && parts[3].equals(time)
//                        && parts[5].equals(String.valueOf(table))) {
//
//                    return "❌ Table already booked for selected date/time!";
//                }
//            }
//
//            Reservation r;
//
//            if (type.equalsIgnoreCase("VIP")) {
//                r = new VipReservation(id, name, date, time, guests, table);
//            } else {
//                r = new StandardReservation(id, name, date, time, guests, table);
//            }
//
//            String data = r.getId() + "," +
//                    r.getName() + "," +
//                    r.getDate() + "," +
//                    r.getTime() + "," +
//                    r.getGuests() + "," +
//                    r.getTable() + "," +
//                    type;
//
//            FileManager.save(data);
//
//        } catch (Exception e) {
//            return "❌ Error: " + e.getMessage();
//        }
//
//        return "Reservation created successfully!";
//    }
//
//    // ================= READ =================
//    public List<String> searchReservation(String keyword) throws IOException {
//
//        List<String> result = new ArrayList<>();
//        List<String> all = FileManager.readAll();
//
//        for (String line : all) {
//
//            if (line.toLowerCase().contains(keyword.toLowerCase())) {
//                result.add(line);
//            }
//        }
//
//        return result;
//    }
//
//    // ================= UPDATE =================
//    public String updateReservation(String id, String name, String date,
//                                    String time, int guests, int table, String type) {
//
//        try {
//
//            if (name.isEmpty() || date.isEmpty() ||
//                    time.isEmpty() || type.isEmpty()) {
//
//                return "❌ All fields are required!";
//            }
//
//            List<String> all = FileManager.readAll();
//            List<String> updated = new ArrayList<>();
//
//            boolean found = false;
//
//            for (String line : all) {
//
//                String[] parts = line.split(",");
//
//                // Conflict validation
//                if (!parts[0].equals(id)
//                        && parts[2].equals(date)
//                        && parts[3].equals(time)
//                        && parts[5].equals(String.valueOf(table))) {
//
//                    return "❌ Another reservation already uses this table at selected time!";
//                }
//            }
//
//            for (String line : all) {
//
//                String[] parts = line.split(",");
//
//                if (parts[0].equals(id)) {
//
//                    line = id + "," +
//                            name + "," +
//                            date + "," +
//                            time + "," +
//                            guests + "," +
//                            table + "," +
//                            type;
//
//                    found = true;
//                }
//
//                updated.add(line);
//            }
//
//            if (!found) {
//                return "❌ Reservation not found!";
//            }
//
//            FileManager.overwrite(updated);
//
//        } catch (Exception e) {
//            return "❌ Update failed!";
//        }
//
//        return "✅ Reservation updated successfully!";
//    }
//
//    // ================= DELETE =================
//    public String deleteReservation(String id) {
//
//        try {
//
//            List<String> all = FileManager.readAll();
//            List<String> updated = new ArrayList<>();
//
//            boolean found = false;
//
//            for (String line : all) {
//
//                String[] parts = line.split(",");
//
//                if (parts[0].equals(id)) {
//                    found = true;
//                    continue;
//                }
//
//                updated.add(line);
//            }
//
//            if (!found) {
//                return "❌ Reservation not found!";
//            }
//
//            FileManager.overwrite(updated);
//
//        } catch (Exception e) {
//            return "❌ Delete failed!";
//        }
//
//        return "✅ Reservation deleted successfully!";
//    }
//}

package service;

import model.*;
import util.FileManager;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Business logic layer for all reservation operations.
 * All public methods return a plain String status message — never null.
 */
public class ReservationService {

    // ──────────────────────────────────────────────
    // CREATE
    // ──────────────────────────────────────────────
    public String createReservation(String id, String name, String date,
                                    String time, int guests, int table, String type) {
        try {
            // ── Field validation ──
            String validationError = validateFields(id, name, date, time, type, guests, table);
            if (validationError != null) return validationError;

            List<String> all = FileManager.readAll();

            // ── Duplicate ID check ──
            for (String line : all) {
                String[] parts = line.split(",", -1);
                if (parts[0].equalsIgnoreCase(id.trim())) {
                    return "❌ Reservation ID already exists!";
                }
            }

            // ── Table conflict check ──
            String conflict = checkTableConflict(all, null, date, time, table);
            if (conflict != null) return conflict;

            // ── Build model object (polymorphism) ──
            Reservation r = buildReservation(id, name, date, time, guests, table, type);

            // ── Persist (cost is now saved too) ──
            FileManager.save(r.toCsv());

        } catch (NumberFormatException e) {
            return "❌ Invalid number format in input!";
        } catch (IOException e) {
            return "❌ Storage error: " + e.getMessage();
        } catch (Exception e) {
            return "❌ Unexpected error: " + e.getMessage();
        }

        return "✅ Reservation created successfully!";
    }

    // ──────────────────────────────────────────────
    // READ (search / view all)
    // ──────────────────────────────────────────────
    public List<Reservation> searchReservations(String keyword) throws IOException {
        List<Reservation> result = new ArrayList<>();
        String kw = (keyword == null) ? "" : keyword.toLowerCase().trim();

        for (String line : FileManager.readAll()) {
            if (kw.isEmpty() || line.toLowerCase().contains(kw)) {
                try {
                    result.add(Reservation.fromCsv(line));
                } catch (Exception ignored) {
                    // Skip malformed lines gracefully
                }
            }
        }
        return result;
    }

    // ──────────────────────────────────────────────
    // UPDATE
    // ──────────────────────────────────────────────
    public String updateReservation(String id, String name, String date,
                                    String time, int guests, int table, String type) {
        try {
            // ── Field validation (id not re-validated since it's a lookup key) ──
            if (isBlank(name) || isBlank(date) || isBlank(time) || isBlank(type)) {
                return "❌ All fields are required!";
            }
            if (guests <= 0 || guests > 20) return "❌ Guests must be between 1 and 20!";
            if (table  <= 0 || table  > 50) return "❌ Table number must be between 1 and 50!";

            List<String> all     = FileManager.readAll();
            List<String> updated = new ArrayList<>();
            boolean found = false;

            // ── Table conflict check (exclude current record) ──
            String conflict = checkTableConflict(all, id, date, time, table);
            if (conflict != null) return conflict;

            for (String line : all) {
                String[] parts = line.split(",", -1);
                if (parts[0].equalsIgnoreCase(id.trim())) {
                    // Replace line with updated data
                    Reservation r = buildReservation(id, name, date, time, guests, table, type);
                    updated.add(r.toCsv());
                    found = true;
                } else {
                    updated.add(line);
                }
            }

            if (!found) return "❌ Reservation not found!";

            FileManager.overwrite(updated);

        } catch (IOException e) {
            return "❌ Storage error: " + e.getMessage();
        } catch (Exception e) {
            return "❌ Update failed: " + e.getMessage();
        }

        return "✅ Reservation updated successfully!";
    }

    // ──────────────────────────────────────────────
    // DELETE
    // ──────────────────────────────────────────────
    public String deleteReservation(String id) {
        try {
            List<String> all     = FileManager.readAll();
            List<String> updated = new ArrayList<>();
            boolean found = false;

            for (String line : all) {
                String[] parts = line.split(",", -1);
                if (parts[0].equalsIgnoreCase(id.trim())) {
                    found = true; // skip this line → effectively deletes it
                } else {
                    updated.add(line);
                }
            }

            if (!found) return "❌ Reservation not found!";

            FileManager.overwrite(updated);

        } catch (IOException e) {
            return "❌ Storage error: " + e.getMessage();
        } catch (Exception e) {
            return "❌ Delete failed: " + e.getMessage();
        }

        return "✅ Reservation deleted successfully!";
    }

    // ══════════════════════════════════════════════
    // Private helpers
    // ══════════════════════════════════════════════

    private String validateFields(String id, String name, String date,
                                  String time, String type, int guests, int table) {
        if (isBlank(id) || isBlank(name) || isBlank(date) ||
                isBlank(time) || isBlank(type)) {
            return "❌ All fields are required!";
        }
        if (guests <= 0 || guests > 20) return "❌ Guests must be between 1 and 20!";
        if (table  <= 0 || table  > 50) return "❌ Table number must be between 1 and 50!";

        // ID: alphanumeric + hyphens only (prevents CSV injection)
        if (!id.trim().matches("[A-Za-z0-9\\-_]+")) {
            return "❌ Reservation ID may only contain letters, numbers, hyphens and underscores!";
        }
        return null; // no error
    }

    /**
     * Checks whether any existing reservation has the same table on the same
     * date/time. Pass {@code excludeId} to skip the record being updated.
     */
    private String checkTableConflict(List<String> all, String excludeId,
                                      String date, String time, int table) {
        for (String line : all) {
            String[] p = line.split(",", -1);
            if (p.length < 6) continue;

            boolean isSelf = excludeId != null && p[0].equalsIgnoreCase(excludeId.trim());
            if (isSelf) continue;

            if (p[2].equals(date) && p[3].equals(time)
                    && p[5].equals(String.valueOf(table))) {
                return "❌ Table " + table + " is already booked for " + date + " at " + time + "!";
            }
        }
        return null;
    }

    private Reservation buildReservation(String id, String name, String date,
                                         String time, int guests, int table, String type) {
        if ("VIP".equalsIgnoreCase(type.trim())) {
            return new VipReservation(id.trim(), name.trim(), date.trim(),
                    time.trim(), guests, table);
        }
        return new StandardReservation(id.trim(), name.trim(), date.trim(),
                time.trim(), guests, table);
    }

    private boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }
}
