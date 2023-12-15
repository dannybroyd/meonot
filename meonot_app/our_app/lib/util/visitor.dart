import 'package:our_app/util/resources/importss.dart';

part 'visitor.g.dart';

@HiveType(typeId: 1)
class Visitor implements Comparable<Visitor>{
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
  int compareTo(Visitor other) {
      return id.compareTo(other.id);
    }
  String getInitials() => name.isNotEmpty
    ? name.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join(): '';

  @override
  String toString() {
    return "id: $id, name: $name, phone: $phone";
  }
    
} 
