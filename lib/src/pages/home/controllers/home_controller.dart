import 'dart:async';
import 'package:get/get.dart';
import 'package:ticket_box/src/models/event.dart';
import 'package:ticket_box/src/models/ticket.dart';
import 'package:ticket_box/src/services/api/event_service.dart';
import 'package:ticket_box/src/services/api/ticket_service.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';


class HomeController extends GetxController {
  SharedStates states = Get.find();

  final showSlider = true.obs;
  final isSearching = false.obs;

  // load data of event
  IEventService eventService = Get.find();
  final listEvents = <Event>[].obs;
  Future<void> getEvents() async {
    listEvents.value =  (await eventService.getEvents());
  }
  // load data of ticket
  ITicketService ticketService = Get.find();
  final listTicket = <Ticket>[].obs;
  Future<void> getTickets() async {
    listTicket.value =  (await ticketService.getTickets());
  }

  final listSearchEvents = <Event>[].obs;
  Future<void> searchEvents(List<Event> list, String keySearch) async {
    if (keySearch.isEmpty) {
      listEvents.clear();
      return;
    }
    List<Event>listSearch = [];
    for(int i = 0; i < list.length; i++){
      if(list[i].eventName!.contains(keySearch)){
        listSearch.add(list[i]);
      }
    }

    if (listSearch.length > 0 || listSearch.isEmpty) {
      print('dữ liệu có tồn tại =)): ' + listSearch.length.toString());
      isSearching.value = true;
      listSearchEvents.value = listSearch;
      Timer(Duration(seconds: 1), () => isSearching.value = false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getEvents();
    // getTickets();
  }
}
