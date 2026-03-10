import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/post.dart';

List<Post> parseJson(String responseBody){
  final List<dynamic> data = jsonDecode(responseBody);
  return data.map((item) => Post.fromJson(item)).toList();
}

Future<List<Post>> fetchPostsWithAwait() async{
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts')
  );
  if (response.statusCode == 200){
    return parseJson(response.body);
  }else{
    throw Exception('Failed to load posts');
  }
}

Future<List<Post>> fetchPostsWithThen(){
  return http
  .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
  .then((response){
    if (response.statusCode == 200){
      return parseJson(response.body);
    }else{
      throw Exception('Failed to load posts');
    }
  });
}