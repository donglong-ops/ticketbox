import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_box/src/common/constants.dart';
import 'package:path/path.dart';

class Utils {
  static Image resolveImg(String? url, {double? width, BoxFit? fit}) {
    if (url == null) {
      return Image.asset(Constants.imageErr);
    }
    return Image(
      fit: fit,
      width: width,
      image: NetworkImage(url),
      errorBuilder: (context, error, stackTrace) =>
          Image.asset(Constants.imageErr),
    );
  }

  static ImageProvider<Object> resolveFileImg(String? url, String? altUrl) {
    if ((url == null || url.isEmpty) && (altUrl == null || altUrl.isEmpty)) {
      throw Exception("Required file image or alternative image");
    }
    if (url != null && url.isNotEmpty) {
      return FileImage(File(url));
    }
    return NetworkImage(altUrl!);
  }

  static ImageProvider<Object> resolveNetworkImg(String? url, String? altUrl) {
    if ((url == null || url.isEmpty) && (altUrl == null || altUrl.isEmpty)) {
      throw Exception("Required image or alternative image");
    }
    if (url != null && url.isNotEmpty) {
      return NetworkImage(url);
    }
    return AssetImage(altUrl!);
  }

  static DecorationImage resolveDecoImg(String? url, {BoxFit? fit = BoxFit.cover}) {
    if (url == null) {
      return DecorationImage(image: AssetImage(Constants.imageErr));
    }
    return DecorationImage(
      onError: (exception, stackTrace) => Image.asset(Constants.imageErr),
      image: NetworkImage(url),
      fit: fit,
    );
  }

  // Future uploadFile(File file) async {
  //   if (file == null) return;
  //
  //   final fileName = basename(file!.path);
  //   final destination = 'files/$fileName';
  //   try {
  //     // task = FirebaseApi.uploadFile(destination, file!);
  //     UploadTask task = FirebaseStorage.instance.ref(destination).putFile(file!);
  //     if (task == null) {
  //       print('null cmnr');
  //     };
  //     final snapshot = await task!.whenComplete(() {});
  //     final urlDownload = await snapshot.ref.getDownloadURL();
  //     print('Download-Link: $urlDownload');
  //   } on FirebaseException catch (e) {
  //     print('lỗi rồi nè: ' + e.toString());
  //   }
  // }

}
