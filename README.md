A simple package for connecting and sending queries to the ClickHouse database.

### Install
Add to pubspec.yaml:
```yaml
dependencies:
  darthouse:
    git:
      url: https://github.com/aquinary/darthouse.git
      ref: main
```
### Example

```dart
import 'package:darthouse/darthouse.dart';

void main() async {
  DartHouse db = DartHouse(login: 'am', password: '0000');

  String query = '''
     SELECT 1
  ''';
  final result = await db.query(query);
  if (result) {
    print(result);
  } else {
    print('Error!');
  }
}
```

### API
```dart
  final db = DartHouse(url = 'localhost', port = 8123, database = 'default', login = '', password = '');
  final result = db.query('query');
```
