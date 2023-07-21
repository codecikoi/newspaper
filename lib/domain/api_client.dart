import 'dart:convert';

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:newspaper/domain/post.dart';

abstract class IReddit {
  Future<GetPost> getPost();
  Future<List<GetChildrenObject>> getOnlyChilds();
}

class RedditImplementation implements IReddit {
  static String apiUrl = 'https://www.reddit.com/r/flutterdev/new.json';
  // кастмный клиент (если нужно)
  final http.Client _client;

  // конструктор, который создаёт клиент, если его не передавать
  RedditImplementation({http.Client? client}) : _client = client ?? http.Client();

  @override
  Future<List<GetChildrenObject>> getOnlyChilds() async {
    try {
      final data$response = await _client.get(Uri.parse(RedditImplementation.apiUrl));
      if (data$response.statusCode == 200) {
        //& Простой пример
        //& Получаем данные:
        //& по факту, здесь строка конвертится в Map<String,Object>
        // так как это Map, мы можем перейти по ключу [data][children], как в JSON с сервера
        final childLst = json.decode(utf8.decode(data$response.bodyBytes))['data']['children'];
        //& Создаем модель (объекты GetChildrenObject)
        return List<GetChildrenObject>.from(childLst.map((e) => GetChildrenObject.fromJson(e)));
        //^ Или вариант проще (одной строкой фактически):
        // return List<GetChildrenObject>.from(json
        //     .decode(utf8.decode(data$response.bodyBytes))['data']['children']
        //     .map((e) => GetChildrenObject.fromJson(e)));
      } else {
        // Если ответ от сервера не имеет статус 200 (успешный ответ),
        // выбрасываем исключение (Exception).
        // Позже, возможно, стоит заменить на собственное исключение.
        throw Exception();
      }
    } on SocketException catch (error, stackTrace) {
      // Если возникнет ошибка сокета (например, нет интернет-соединения),
      // то обработаем её здесь, выводим информацию об ошибке и пробрасываем дальше.
      Error.safeToString(error);
      stackTrace.toString();
      rethrow;
    } on Object catch (error, stackTrace) {
      // Если произойдет какая-либо другая ошибка, которую мы не предвидим,
      // то также обработаем её здесь, выводим информацию об ошибке и пробрасываем дальше.
      Error.safeToString(error);
      stackTrace.toString();
      rethrow;
    } finally {
      // Здесь можно добавить код, который выполнится независимо от того, произошла ли ошибка или нет.
      // Например, можно закрыть соединение, если оно было открыто ранее.
      // Конкретно тут нечего чистить, обрабатывать, и пр
    }
  }

  @override
  Future<GetPost> getPost() {
    throw UnimplementedError();
  }
}
