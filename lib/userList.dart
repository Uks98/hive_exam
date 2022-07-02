import 'package:hive/hive.dart';

part 'userList.g.dart';
@HiveType(typeId:1)
class InputForm extends HiveObject{
  InputForm ({
    required this.id,
    required this.name,
    required this.memo,
    required this.memoList,
  });
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String memo;
  @HiveField(3)
  final List<InputForm> memoList;

  @override
  String toString() {
    // TODO: implement toString
    print("id: $id name: $name memo : $memo");
    return super.toString();
  }
}