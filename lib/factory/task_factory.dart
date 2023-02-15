import 'dart:math';
import '../models/task.dart';

class TaskFactory {
  Random random = Random(DateTime.now().microsecondsSinceEpoch);

  List<Task> generateListTask({int items = 5}) {
    List<Task> list = [];
    for (int i = 0; i < items; i++) {
      list.add(
        Task(generateName(), generateDate(), generateDate(), generateBool())
      );
    }
    return list;
  }

  String generateName() {
    const characters = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnÑñOoPpQqRrSsTtUuVvWwXxYyZz';
    return String.fromCharCodes(Iterable.generate(
            7, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }

  String generateDate() {
    return DateTime.fromMicrosecondsSinceEpoch(random.nextInt(200)).toString();
  }

  bool generateBool() {
    return random.nextBool();
  }
}
