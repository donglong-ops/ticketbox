import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ticket_box/src/pages/notifications/controllers/notifications_controller.dart';
import 'package:ticket_box/src/widgets/custom_bottom_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NotificationsPage extends GetView<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff2AD4D3),
        elevation: 1,
        title: Text(
          'Thông báo',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Alert(
            context: context,
            type: AlertType.warning,
            title: "Thông báo",
            desc: "Tài khoản của bạn sắp hết!",
            buttons: [
              DialogButton(
                child: Text(
                  "Ok",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () => Navigator.pop(context),
                color: Color.fromRGBO(0, 179, 134, 1.0),
              ),
            ],
          ).show();
        },
        label: Text("Notification"),
      ),
      bottomNavigationBar: CustomBottombar(),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            height: 30,
            thickness: 0.5,
            color: Colors.grey,
            indent: 10,
            endIndent: 12,
          ),
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://raw.githubusercontent.com/thehienvnag/beauty-at-home-mobile/main/public/img/notification.PNG'),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 280,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Bạn có một khoản nợ sắp đết hạn!',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '24/06/2020',
                            style: TextStyle(fontSize: 14),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.info),
                            label: Text('Xem chi tiết'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }

}
