import 'package:darthouse/darthouse.dart';

void main() async {
  DartHouse db = DartHouse(login: 'am', password: '0000');

  String query = '''
     SELECT 1
  ''';
  final bool result = await db.query(query);
  if (result) {
    print('Ok!');
  } else {
    print('Error!');
  }
}
