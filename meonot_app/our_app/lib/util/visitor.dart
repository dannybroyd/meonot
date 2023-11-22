import 'package:our_app/util/resources/importss.dart';

part 'visitor.g.dart';

@HiveType(typeId: 1)
class Visitor {
    @HiveField(0)
    String id;

    @HiveField(1)
    String name;

    @HiveField(2)
    String phone;

  Visitor({
    required this.id,
    required this.name,
    required this.phone,
  });

  @override
  String toString() {
    return "id: $id, name: $name, phone: $phone";
  }
    
} 
