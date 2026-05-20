package model;

public class StandardReservation extends Reservation {

    private static final double RATE_PER_GUEST = 1000.0;

    public StandardReservation(String id, String name, String date,
                               String time, int guests, int table) {
        super(id, name, date, time, guests, table, "Standard");
    }

    @Override
    public double calculateCost() {
        return getGuests() * RATE_PER_GUEST;
    }
}
