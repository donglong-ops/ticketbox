import 'package:bot_toast/bot_toast.dart';
import 'package:ticket_box/src/services/api/account_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ticket_box/src/routes/routes.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';

class UpdateProfileController extends GetxController {
  final SharedStates sharedStates = Get.find();
  final IAccountService accountService = Get.find();

  ImagePicker _imagePicker = Get.find();
  final filePath = ''.obs;

  // Pick Image of visitor
  Future<void> getImage() async {
    final picked = await _imagePicker.pickImage(source: ImageSource.gallery);
    filePath.value = picked?.path ?? '';
  }

  // User login with phone
  User? user;

  // email
  final newEmail = "".obs;

  // set email
  void setEmail(String email) {
    newEmail.value = email;
  }

  // userName
  final userName = "".obs;

  // set userName
  void setUserName(String name) {
    userName.value = name;
  }

  void updateUser() async {
    DateTime applyDate = DateTime.now();
    if (userName.value.isNotEmpty && newEmail.value.isNotEmpty && filePath.isNotEmpty) {
      BotToast.showLoading();
      // chuyển image thành đường link là dc
      var createResult = await accountService.createAccount(
          {
            "roleId": '2',
            "email": newEmail.value,
            "fullname": userName.value,
            "phone": sharedStates.phoneLogin.value,
            "isDeleted": 'false',
            "avatarUrl": filePath.value,
            "createDate": applyDate.toString(),
            "modifyDate": applyDate.toString(),
          });
        if (createResult != null ) {
          BotToast.showText(
            text: "Đăng ký thành công",
            duration: const Duration(seconds: 4),
          );
          sharedStates.account = createResult;
          Get.toNamed(Routes.home);
        }
      BotToast.closeAllLoading();
    } else {
      BotToast.showText(
          text: "Required Information!",
          textStyle: TextStyle(fontSize: 16),
          duration: const Duration(seconds: 5));
    }
  }
}
