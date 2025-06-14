import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioHelper {
  static late Dio dio;
  static const String kAccessTokenKey = 'AccessToken';
  static String clean(String? s) {
    return s?.replaceAll('\u00A0', ' ').trim() ?? '';
  }

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
          // print('Response: ${response.data}');
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
      Options options = Options(contentType: 'multipart/form-data');

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

  static Future<Response> getJobDetails(String jobId) async {
    try {
      final response = await dio.get('students/jobs/$jobId');
      return response;
    } catch (e) {
      throw Exception('Failed to get job details: $e');
    }
  }

  static Future<Response> deleteJob(String jobId, String jobType) async {
    try {
      String cleanedJobType = clean(jobType);

      String endpoint;
      switch (cleanedJobType) {
        case 'Freelancing job with direct contact':
          endpoint = 'students/directJob/$jobId';
          break;
        case 'Freelancing job on platform':
          endpoint = 'students/platformJob/$jobId';
          break;
        case 'Remote monthly job':
          endpoint = 'students/remoteJob/$jobId';
          break;
        default:
          throw Exception('Unknown job type: $cleanedJobType');
      }

      final response = await dio.delete(endpoint);
      print(response.data);
      return response;
    } catch (e) {
      print('Failed to delete job: $e');
      throw Exception('Failed to delete job: $e');
    }
  }

  static Future<Response> getCertificateDetails(String certificateId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(kAccessTokenKey);
      Options? options;
      if (token != null) {
        options = Options(headers: {'Authorization': 'Bearer $token'});
      }

      final response = await dio.get(
        'students/certificate/$certificateId',
        options: options,
      );
      print('details response: $response.data');
      return response;
    } catch (e) {
      print('Failed to get certificate details: $e');
      throw Exception('Failed to get certificate details: $e');
    }
  }

  static Future<Response> deleteCertificate(String certificateId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(kAccessTokenKey);
      Options? options;
      if (token != null) {
        options = Options(headers: {'Authorization': 'Bearer $token'});
      }

      final response = await dio.delete(
        'students/certificate/$certificateId',
        options: options,
      );
      print(response.data);
      return response;
    } catch (e) {
      throw Exception('Failed to delete certificate: $e');
    }
  }

  static Future<Response> addCertificate(
    Map<String, dynamic> certificateData,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(kAccessTokenKey);

      Options? options;
      if (token != null) {
        options = Options(headers: {'Authorization': 'Bearer $token'});
      }

      final response = await dio.post(
        'students/certificate',
        data: certificateData,
        options: options,
      );

      return response;
    } catch (e) {
      throw Exception('Failed to add certificate: $e');
    }
  }

  static Future<Response> updateCertificate(
    String id,
    Map<String, dynamic> data,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(kAccessTokenKey);

    Options? options;
    if (token != null) {
      options = Options(headers: {'Authorization': 'Bearer $token'});
    }

    final response = await dio.put(
      'students/certificate/$id',
      data: data,
      options: options,
    );

    return response;
  }

  static Future<Response> addRemoteJob(Map<String, dynamic> jobData) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(kAccessTokenKey);

      Options? options;
      if (token != null) {
        options = Options(headers: {'Authorization': 'Bearer $token'});
      }

      final response = await dio.post(
        'students/remoteJob',
        data: jobData,
        options: options,
      );
      print('addremote $response');
      print('Type of response.data: ${response.data.runtimeType}');

      print(response.data);
      return response;
    } catch (e) {
      print('Failed to add remote job: $e');
      throw Exception('Failed to add remote job: $e');
    }
  }

  static Future<Response> updateRemoteJob(
    String id,
    Map<String, dynamic> data,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(kAccessTokenKey);

    Options? options;
    if (token != null) {
      options = Options(headers: {'Authorization': 'Bearer $token'});
    }

    final response = await dio.put(
      'students/remoteJob/$id',
      data: data,
      options: options,
    );

    return response;
  }
}
