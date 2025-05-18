import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://iti-freelancing-hub-server.vercel.app/',
        receiveDataWhenStatusError: true,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('accessToken');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('Response: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print('Error: ${e.message}');
          return handler.next(e);
        },
      ),
    );
  }

  static Future<Response> login(Map<String, dynamic> logindata) async {
    try {
      Response response = await dio.post('students/signin', data: logindata);
      return response;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  static Future<Response> getUserData() async {
    try {
      Response response = await dio.get('students/data');
      return response;
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }

  static Future<Response> sendMessage(Map<String, dynamic> messageData) async {
    try {
      Response response = await dio.post(
        'students/sendMessage',
        data: messageData,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }

  static Future<Response> getChat() async {
    try {
      Response response = await dio.get('students/getChat');
      return response;
    } catch (e) {
      throw Exception('Failed to fetch chat: $e');
    }
  }

  static Future<Response> changeAvatar(String imagePath) async {
    try {
      FormData formData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(
          imagePath,
          filename: 'avatar.jpg',
        ),
      });

      Response response = await dio.patch(
        'students/changeAvatar',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      return response;
    } catch (e) {
      throw Exception('Failed to change avatar: $e');
    }
  }

  static Future<Response> getNotifications() async {
    try {
      Response response = await dio.get('students/notifications');
      return response;
    } catch (e) {
      throw Exception('Failed to fetch notifications: $e');
    }
  }

  static Future<Response> NotificationAsSeen(String notificationId) async {
    try {
      final response = await dio.post('students/notifications/$notificationId');
      return response;
    } catch (e) {
      throw Exception('Failed to mark notification as seen: $e');
    }
  }

  static Future<Response> changeMyPassword(
    Map<String, dynamic> passwordData,
  ) async {
    try {
      final response = await dio.patch(
        'students/changePassword',
        data: passwordData,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to change password: $e');
    }
  }
}
