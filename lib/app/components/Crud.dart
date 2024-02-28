import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Crud {
  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        print('Response Body$responsebody');
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch ${e.toString()}");
    }
  }

  postRequest(String url, Map data) async {
    try {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        print('Response Body$responsebody');
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch ${e.toString()}");
    }
  }

  filesendrequest(String url, Map data, File file) async {
    var getRequest = http.MultipartRequest('POST', Uri.parse(url));
    int length = await file.length();
    var streams = http.ByteStream(file.openRead());
    var MultipartRequest = http.MultipartFile('file', streams, length,
        filename: basename(file.path));
    getRequest.files.add(MultipartRequest);
    data.forEach((key, value) {
      getRequest.fields[key] = value;
    });
    var myrequest = await getRequest.send();
    var response = await http.Response.fromStream(myrequest);
    print('response %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%$response');
    if (response.statusCode == 200) {
      print('ADEEDD SECCESSFULLY');
      return jsonDecode(response.body);
    } else {
      print('have error');
    }
  }
}
