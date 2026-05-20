//package model;
//
//public abstract class Reservation {
//
//    private String id;
//    private String name;
//    private String date;
//    private String time;
//    private int guests;
//    private int table;
//
//    public Reservation(String id, String name, String date, String time, int guests, int table) {
//        this.id = id;
//        this.name = name;
//        this.date = date;
//        this.time = time;
//        this.guests = guests;
//        this.table = table;
//    }
//
//    // Getters (Encapsulation)
//    public String getId() { return id; }
//    public String getName() { return name; }
//    public String getDate() { return date; }
//    public String getTime() { return time; }
//    public int getGuests() { return guests; }
//    public int getTable() { return table; }
//
//    // Abstract method (Abstraction + Polymorphism)
//    public abstract double calculateCost();
//}

package model;

public abstract class Reservation {

    private String id;
    private String name;
    private String date;
    private String time;
    private int guests;
    private int table;
    private String type;

    public Reservation(String id, String name, String date, String time,
                       int guests, int table, String type) {
        this.id    = id.trim();
        this.name  = name.trim();
        this.date  = date.trim();
        this.time  = time.trim();
        this.guests = guests;
        this.table  = table;
        this.type   = type.trim();
    }

    // Getters
    public String getId()     { return id; }
    public String getName()   { return name; }
    public String getDate()   { return date; }
    public String getTime()   { return time; }
    public int    getGuests() { return guests; }
    public int    getTable()  { return table; }
    public String getType()   { return type; }

    // Abstract — subclasses define pricing logic
    public abstract double calculateCost();

    /**
     * Serialises the reservation to a CSV line.
     * Format: id,name,date,time,guests,table,type,cost
     */
    public String toCsv() {
        return String.join(",",
                id,
                name,
                date,
                time,
                String.valueOf(guests),
                String.valueOf(table),
                type,
                String.format("%.2f", calculateCost())
        );
    }

    /**
     * Factory method — reconstructs a Reservation from a CSV line.
     */
    public static Reservation fromCsv(String line) {
        String[] p = line.split(",", -1);
        if (p.length < 7) throw new IllegalArgumentException("Malformed record: " + line);

        String id    = p[0];
        String name  = p[1];
        String date  = p[2];
        String time  = p[3];
        int guests   = Integer.parseInt(p[4]);
        int table    = Integer.parseInt(p[5]);
        String type  = p[6];

        if ("VIP".equalsIgnoreCase(type)) {
            return new VipReservation(id, name, date, time, guests, table);
        } else {
            return new StandardReservation(id, name, date, time, guests, table);
        }
    }
}
