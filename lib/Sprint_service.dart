import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suiviprojet/models/Sprint.dart';

class SprintService {
  
  static const API_URL = 'http://localhost:3000/Sprints';

  Future<List<Sprint>> fetchSprints(int projectId) async {
    final response = await http.get(Uri.parse('$API_URL?projectId=$projectId'));

    if (response.statusCode == 200) {
      List<dynamic> sprintsJson = json.decode(response.body) as List<dynamic>;
      List<Sprint> sprints = sprintsJson.map((sprint) => Sprint.fromJson(sprint)).toList();
      return sprints;
    } else {
      throw Exception('Failed to fetch sprints');
    }
  }
}
