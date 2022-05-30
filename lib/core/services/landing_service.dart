import 'dart:convert';
import 'package:catbreeds/core/models/cat_model.dart';
import 'package:http/http.dart' as http;

class FetchBreeds {
  Future<List<Cat>> fetchBreeds() async {
    // // final token = await AuthService.getToken();
    const token = 'bda53789-d59e-46cd-9bc4-2936630fde39';

    final res = await http.get(
      // // Uri.parse('${Environment.apiUrl}/graphql'),
      Uri.parse('https://api.thecatapi.com/v1/breeds'),
      headers: {"x-api-key": token},
    ).timeout(const Duration(seconds: 20));

    if (res.statusCode == 200) {
      // final cat = catFromJson(res.body);
      return catFromJson(res.body);
    } else {
      return [];
    }
  }
}
