//package model;
//
//public class VipReservation extends Reservation {
//
//    public VipReservation(String id, String name, String date, String time, int guests, int table) {
//        super(id, name, date, time, guests, table);
//    }
//
//    @Override
//    public double calculateCost() {
//        return getGuests() * 2000;
//    }
//}
package model;

public class VipReservation extends Reservation {

    private static final double RATE_PER_GUEST = 2000.0;

    public VipReservation(String id, String name, String date,
                          String time, int guests, int table) {
        super(id, name, date, time, guests, table, "VIP");
    }

    @Override
    public double calculateCost() {
        return getGuests() * RATE_PER_GUEST;
    }
}
