import 'dart:convert';
import "package:http/http.dart" as http;
import '../models/city_model.dart';

class UserRepository {
  Future<CiitiesResponse?> getCityApi() async {
    final response = await http.get(Uri.parse(
        "https://fluttertest.q3logics.com/api/getCities?device_id=aa1b0a9bab56fab2&token=e4b54fd3d47a5e92eb31b7a1ffa705f7&lang_id=1&country_id=189"));
    var material = await jsonDecode(response.body.toString());
    print(material['data'][0]);
    if (response.statusCode == 200) {
      return CiitiesResponse.fromJson(material);
    }
    return null;
  }
}
