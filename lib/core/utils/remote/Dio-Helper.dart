import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioHelper {
  static late Dio dio;
  static const String kAccessTokenKey = 'AccessToken';

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
          final token = prefs.getString(kAccessTokenKey);  
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

  static Future<Response> getStudentData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(kAccessTokenKey); 
      Options? options;
      if (token != null) {
        options = Options(headers: {'Authorization': 'Bearer $token'});
      }
      final response = await dio.get('students/data', options: options);
      return response;
    } catch (e) {
      throw Exception('Failed to get student data: $e');
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
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(kAccessTokenKey); 
      Options options = Options(
        contentType: 'multipart/form-data',
      );

      if (token != null) {
        options.headers = {'Authorization': 'Bearer $token'};
      }

      FormData formData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(
          imagePath,
          filename: 'avatar.jpg',
        ),
      });

      Response response = await dio.patch(
        'students/changeAvatar',
        data: formData,
        options: options,
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

  static Future<Response> getAllJobs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(kAccessTokenKey);
      Options? options;
      if (token != null) {
        options = Options(headers: {'Authorization': 'Bearer $token'});
      }
      final response = await dio.get('students/jobs', options: options);
      return response;
    } catch (e) {
      throw Exception('Failed to get all jobs: $e');
    }
  }

  static Future<Response> getAllCertificates() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(kAccessTokenKey);
      Options? options;
      if (token != null) {
        options = Options(headers: {'Authorization': 'Bearer $token'});
      }
      Response response = await dio.get(
        'students/certificate',
        options: options,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to get certificates: $e');
    }
  }

  static Future<Response> forgetPassword(
    Map<String, dynamic> forgetData,
  ) async {
    try {
      Response response = await dio.post(
        'students/forgetPassword',
        data: forgetData,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to forget password: $e');
    }
  }

  static Future<Response> verifyCode(Map<String, dynamic> verifyData) async {
    try {
      Response response = await dio.post(
        'students/verifyCode',
        data: verifyData,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to verify code: $e');
    }
  }

  static Future<Response> resetPassword(
    Map<String, dynamic> data,
    String token,
  ) async {
    return await dio.post(
      'students/resetPassword',
      data: data,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}