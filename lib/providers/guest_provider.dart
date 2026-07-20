import 'package:flutter/material.dart';
import '../models/guest_model.dart';

class GuestProvider extends ChangeNotifier {
  List<GuestModel> _guests = [];

  List<GuestModel> get guests => _guests;

  List<GuestModel> getGuestsByEvent(String eventId) {
    return _guests.where((g) => g.eventId == eventId).toList();
  }

  int getConfirmedCount(String eventId) {
    return _guests.where((g) => 
      g.eventId == eventId && g.status == GuestStatus.confirmed
    ).length;
  }

  int getTotalGuestsCount(String eventId) {
    return _guests
      .where((g) => g.eventId == eventId)
      .fold(0, (sum, g) => sum + (g.numberOfGuests ?? 1));
  }

  void addGuest(GuestModel guest) {
    _guests.add(guest);
    notifyListeners();
  }

  void updateGuest(GuestModel guest) {
    final index = _guests.indexWhere((g) => g.id == guest.id);
    if (index != -1) {
      _guests[index] = guest;
      notifyListeners();
    }
  }

  void deleteGuest(String id) {
    _guests.removeWhere((g) => g.id == id);
    notifyListeners();
  }

  void loadDummyGuests(String eventId) {
    _guests = [
      GuestModel(
        id: 'g1',
        eventId: eventId,
        name: 'محمد العلي',
        phone: '0501234567',
        status: GuestStatus.confirmed,
        type: GuestType.family,
        numberOfGuests: 2,
        createdAt: DateTime.now(),
      ),
      GuestModel(
        id: 'g2',
        eventId: eventId,
        name: 'فاطمة الزهراء',
        phone: '0559876543',
        status: GuestStatus.invited,
        type: GuestType.friend,
        numberOfGuests: 1,
        createdAt: DateTime.now(),
      ),
      GuestModel(
        id: 'g3',
        eventId: eventId,
        name: 'أحمد الخالد',
        phone: '0561112233',
        status: GuestStatus.maybe,
        type: GuestType.colleague,
        numberOfGuests: 1,
        createdAt: DateTime.now(),
      ),
    ];
    notifyListeners();
  }
}
