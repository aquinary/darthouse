import 'package:http/http.dart' as http;

class DartHouse {
  String url;
  int port;
  String database;
  String login;
  String password;

  /// Задаёт параметры соединения для подключения к БД ClickHouse. Если в [url]
  /// указывается протокол соединения, то использует его. В ином случае использует
  /// `http` протокол.
  DartHouse(
      {this.url = 'localhost',
      this.port = 8123,
      this.database = 'default',
      this.login = '',
      this.password = ''});

  /// Отправляет запрос [query] на сервер. Если запрос выполнен успешно, то возвращает тело запроса.
  Future<String> query(String query) async {
    bool httpsProtocol = url.contains('https://');

    String protocol = 'http';

    if (httpsProtocol) {
      protocol = 'https';
    }

    Uri parseUrl = Uri.parse(
        '$protocol://$login:$password@$url:$port/?database=$database');

    http.Response response = await http.post(parseUrl, body: query);

    if (response.statusCode != 200) {
      print(response.body);
    }

    return response.body;
  }
}
