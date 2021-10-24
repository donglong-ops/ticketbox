import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ticket_box/src/models/account.dart';
import 'package:ticket_box/src/routes/routes.dart';
import 'package:ticket_box/src/services/api/account_service.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileDetailController extends GetxController {
  IAccountService _service = Get.find();
  final SharedStates sharedData = Get.find();
  Account? userInfo;

  final profileName = "".obs;

  void changeName(String content) {
    profileName.value = content;
  }

  final profilePhone = "".obs;

  void changePhone(String content) {
    profilePhone.value = content;
  }

  ImagePicker _imagePicker = Get.find();
  final filePath = ''.obs;

  Future<void> getImage() async {
    filePath.value = '';
    final picked = await _imagePicker.getImage(source: ImageSource.gallery);
    filePath.value = picked?.path ?? '';
  }

  void deleteImage() {
    filePath.value = '';
  }

  // Future uploadFile() async {
  //   StorageReference storageReference = FirebaseStorage.instance
  //       .ref()
  //       .child('chats/${Path.basename(_image.path)}}');
  //   StorageUploadTask uploadTask = storageReference.putFile(_image);
  //   await uploadTask.onComplete;
  //   print('File Uploaded');
  //   storageReference.getDownloadURL().then((fileURL) {
  //     setState(() {
  //       _uploadedFileURL = fileURL;
  //     });
  //   });
  // }

  void updateProfile(int accountId) async {
    DateTime applyDate = DateTime.now();
    try {
    BotToast.showLoading();
    userInfo = sharedData.account;
    if(profilePhone.value.isEmpty){
      profilePhone.value = userInfo!.phone!;
    }
    if(profileName.value.isEmpty){
      profileName.value = userInfo!.fullName!;
    }
    print('file hinh: ' +  filePath.value);
    bool updateS = false;
    if(filePath.value.isEmpty){
      updateS = await _service.updateProfileV2(accountId,
        {
          "userId": accountId.toString(),
          "roleId": '2',
          "email": userInfo!.email!,
          "fullname": profileName.value,
          "phone": profilePhone.value,
          "isDeleted": 'false',
          "avatarUrl": userInfo!.avatarUrl!,
          "createDate": userInfo!.createDate.toString(),
          "modifyDate": applyDate.toString(),
        },
      );
    }else {
      updateS = await _service.updateProfile(
          accountId,
            {
              "userId": accountId.toString(),
              "roleId": '2',
              "email": userInfo!.email!,
              "fullname": profileName.value,
              "phone": profilePhone.value,
              "isDeleted": 'false',
              "avatarUrl": filePath.value,
              "createDate": userInfo!.createDate.toString(),
              "modifyDate": applyDate.toString(),
            },
          filePath.value
      );
    }
    if (updateS) {
      BotToast.showText(
          text: "Cập nhật thành công !",
          textStyle: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          duration: const Duration(seconds: 5));
      Get.toNamed(Routes.profile);
    }else{
      BotToast.showText(
          text: "Cập nhật thất bại !",
          textStyle: TextStyle( fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
          duration: const Duration(seconds: 5));
    }
    } catch (e) {
      log("Lỗi: " + e.toString());
      BotToast.showText(text: "Cập nhật thất bại");
    }
    BotToast.closeAllLoading();
  }
}
