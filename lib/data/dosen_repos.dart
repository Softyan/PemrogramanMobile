import 'package:dio/dio.dart';
import 'package:uas/model/dosen_response.dart';
import '../model/bio_dosen.dart';
import '../utils/dio_respone.dart';

abstract class DosenRepos {
  Future<DioResponse<List<BioDosen>>> getListDosen();
  Future<DioResponse<String>> addDosen(BioDosen dosen);
  Future<DioResponse<String>> updateDosen(BioDosen dosen);
  Future<DioResponse<String>> deleteDosen(int id);
}

class DosenRepositoryImpl implements DosenRepos {
  @override
  Future<DioResponse<String>> addDosen(BioDosen dosen) async {
    DioResponse<String> dioResponse = DioResponse();
    try {
      Response response =
      await _dio().post('/biodosen', data: dosen.toJson());
      dioResponse.data = response.data['message'];
    } on DioError catch (e) {
      dioResponse.data = null;
      dioResponse.errorMessage = e.message;
    }
    return dioResponse;
  }

  @override
  Future<DioResponse<String>> deleteDosen(int id) async {
    DioResponse<String> dioResponse = DioResponse();
    try {
      var response = await _dio().delete('/biodosen/$id');
      dioResponse.data = response.data['message'];
    } on DioError catch (e) {
      dioResponse.data = null;
      dioResponse.errorMessage = e.message;
    }
    return dioResponse;
  }

  @override
  Future<DioResponse<List<BioDosen>>> getListDosen() async {
    DioResponse<List<BioDosen>> dioResponse = DioResponse();
    try {
      var response = await _dio().get('/biodosen');
      var dosenResponse = DosenResponse.fromJson(response.data);
      dioResponse.data = dosenResponse.data;
    } on DioError catch (e) {
      dioResponse.data = null;
      dioResponse.errorMessage = e.message;
    }
    return dioResponse;
  }

  @override
  Future<DioResponse<String>> updateDosen(BioDosen dosen) async {
    DioResponse<String> dioResponse = DioResponse();
    try {
      var response = await _dio()
          .put('/biodosen/${dosen.id}}', data: dosen.toJson());
      dioResponse.data = response.data['message'];
    } on DioError catch (e) {
      dioResponse.data = null;
      dioResponse.errorMessage = e.message;
    }
    return dioResponse;
  }
}

Dio _dio() {
  var options = BaseOptions(
      baseUrl: 'http://127.0.0.1:8000/api',
      connectTimeout: 5000,
      receiveTimeout: 10000,
      contentType: 'application/json',
      responseType: ResponseType.json);
  return Dio(options);
}