class ApiConstants {
   ApiConstants._();

   static const String baseUrl = 'http://127.0.0.1:8080/api';

   static const String signup = '/auth/signup';
   static const String login = '/auth/login';
   static const String refresh = "/auth/refresh";

   static const Duration connectionTimeout = Duration(seconds: 15);
   static const Duration receiveTimeout = Duration(seconds: 15);

}