import 'dart:convert';
import 'package:http/http.dart' as http;

class PostResult
{
  String id;
  String name;

  PostResult({this.id, this.name});

  factory PostResult.createPostResult(Map<String, dynamic> object)
  {
    return PostResult(
        id: object['id'],
        name: object['name']
    );
  }

  static Future<PostResult> connectToAPI(String id, String name) async
  {
    String apiURL ="https://reqres.in/api/users";

    var apiResult= await http.post(apiURL, body:{
      "id": id,
      "name": name,
    });

    var jsonObject= json.decode(apiResult.body);
    return PostResult.createPostResult(jsonObject);
  }
}