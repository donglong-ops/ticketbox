import 'package:ticket_box/src/common/endpoints.dart';
import 'package:ticket_box/src/models/event.dart';
import 'package:ticket_box/src/services/api/base_service.dart';

mixin IEventService {
  Future<Event?> getEventById(int id);
  Future<List<Event>> getEvents();
  Future<List<Event>> searchEvents([String? search]);
}

class EventService extends BaseService<Event> implements IEventService {
  @override
  String endpoint() {
    return Endpoints.events;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Event.fromJson(json);
  }

  @override
  Future<Event?> getEventById(int id) {
    return getByIdBase(id);
  }

  @override
  Future<List<Event>> getEvents() {
    return getAllBase({});
  }

  @override
  Future<List<Event>> searchEvents([String? search]) {
    final params = {
      "pageSize": "5",
      "status": "Active",
    };
    if (search != null) {
      params.putIfAbsent("name", () => search);
      params.putIfAbsent("isAll", () => "true");
    }
    return getAllBase(params);
  }

}


