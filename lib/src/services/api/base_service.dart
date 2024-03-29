import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:ticket_box/src/data/api_helper.dart';
import 'package:ticket_box/src/data/file_upload_utils.dart';


abstract class BaseService<T> {
  IApiHelper _apiHelper = Get.find();

  /// Set decode function for entity
  T fromJson(Map<String, dynamic> json);
  /// Set api endpoint for entity
  String endpoint();

  Future<T?> getByIdBase(int id) async {
    Response response = await _apiHelper.getById(endpoint(), id);

    if (response.isOk) {
      return fromJson(response.body);
    }
  }


  /// Get list instances from API with [query]
  Future<List<T>> getAllBase(Map<String, dynamic> query) async {
    Response res = await _apiHelper.getAll(endpoint(), query: query);
    List<T>? content = res.body?.map<T>((x) => fromJson(x)).toList();
    if(content!.isEmpty || (content.length < 0)){
      content = [];
    }
    return content;
  }

  /// Post an instance with [body]
  Future<T?> postBase(Map<String, dynamic> body) async {
    Response res = await _apiHelper.postOne(endpoint(), body);
    print("HTTP STATUS CODE: " + res.statusCode.toString() + "  ===========");
    if (res.statusCode == HttpStatus.created) {
      print(res.body);
      return fromJson(res.body);
    }
    if (res.statusCode == HttpStatus.ok || res.statusCode == HttpStatus.noContent) {
      print(res.body);
      return fromJson(res.body);
    }
  }

  /// Post an instance with [body]
  Future<T?> postWithFilesBase(
      Map<String, dynamic> body,
      List<String> filePaths,
      ) async {
    List<MultipartFile> files = filePaths
        .map((path) => FileUploadUtils.convertToMultipart(path))
        .toList();
    Response res = await _apiHelper.postOneWithFiles(endpoint(), body, files);
    if (res.statusCode == HttpStatus.created) {
      return fromJson(res.body);
    }
  }

  /// Post an instance with [body]
  Future<T?> postWithOneFileBase(Map<String, dynamic> body, String filePath) async {
    Response res = await _apiHelper.postOneWithFile(
      endpoint(), body, FileUploadUtils.convertToMultipart(filePath),
    );
    if (res.statusCode == HttpStatus.created) {
      return fromJson(res.body);
    }
  }

  /// Put an instance with [id] and [body]
  Future<bool> putBase(dynamic id, Map<String, dynamic> body) async {
    Response res = await _apiHelper.putOne(endpoint(), id, body);
    print("HTTP STATUS CODE: " + res.statusCode.toString());
    if (res.statusCode == HttpStatus.noContent) {
      return true;
    }
    return false;
  }


  /// Put an instance with [body] and a file path [filePath]
  Future<bool> putWithOneFileBase(
      Map<String, dynamic> body, String filePath, int id,
      [String fileName = "avatarUrl"]) async {
    if (filePath.isNotEmpty) {
      Response res = await _apiHelper.putOneWithOneFile(
          endpoint() + "/" + id.toString(),
          body,
          FileUploadUtils.convertToMultipart(filePath),
          fileName);
      if (res.statusCode == HttpStatus.noContent) {
        return true;
      }
    } else {
      Response res = await _apiHelper.putOneWithOneFile(endpoint() + "/" + id.toString(), body, null, fileName);
      if (res.statusCode == HttpStatus.noContent) {
        return true;
      }
    }

    return false;
  }

  /// Put an instance with [body]
  Future<T?> putWithFilesBase(
      Map<String, dynamic> body,
      List<String> filePaths,
      ) async {
    List<MultipartFile> files = filePaths.map((path) => FileUploadUtils.convertToMultipart(path)).toList();
    Response res = await _apiHelper.putOneWithFiles(endpoint(), body, files);
    if (res.statusCode == HttpStatus.noContent) {
      return fromJson(res.body);
    }
  }

  /// Delete an instance
  Future<bool> deleteBase(dynamic id) async {
    Response res = await _apiHelper.deleteOne(endpoint(), id);
    return res.statusCode == HttpStatus.noContent;
  }
}
