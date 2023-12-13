import 'package:our_app/util/resources/importss.dart';

class UserData{
  final _myBox = Hive.box('myUserSettings');
  String name = '';
  String phone = '';
  String id = '';
  String dorms = '';
  String building = '';
  String floor = '';
  String appartment = '';
  List favorites = [];

  void loadData(){
    name = _myBox.get('name');
    phone = _myBox.get('phone');
    id = _myBox.get('id');
    dorms = _myBox.get('dorms');
    building = _myBox.get('building');
    floor = _myBox.get('floor');
    appartment = _myBox.get('appartment');
    if(_myBox.get('visitors') != null){
      favorites = _myBox.get('visitors');
    }
  }

  void updateData(){
    _myBox.putAll({'name': name, 'phone': phone, 'id': id, 'dorms': dorms, 'building': building, 'floor': floor, 'appartment': appartment});
  }

  void updateVisitors(){
    _myBox.put('visitors', favorites);
  }
}