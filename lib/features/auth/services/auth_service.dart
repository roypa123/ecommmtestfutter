import 'package:dio/dio.dart';

import '../../../core/constants/api_constants.dart';
import '../models/auth_response.dart';


class AuthService {
  final Dio dio;

  const AuthService(this.dio);

  Future<AuthResponse> signup({
    required String name,
    required String email,
    required String password,
  }) async {
     try {
       final response = await dio.post(
        ApiConstants.signup,
        data: {'name': name, 'email': email, 'password': password},
       );
       return AuthResponse.fromJson(response.data as Map<String , dynamic>);
     } on DioException catch (e) {
      throw Exception(_extractMessage(e));
     }
  }
  
  String _extractMessage(DioException e){
    final data = e.response?.data;
    if(data is Map && data['message'] is String){
      return data['message'] as String;
    }
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout){
          return 'Could not reach the server. Check your connection.';

        }
       return 'Something went wrong. Please try again.';
  }




}