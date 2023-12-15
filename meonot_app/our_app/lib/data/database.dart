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
  String side = '';
  List favorites = [];

  void loadData(){
    name = _myBox.get('name');
    phone = _myBox.get('phone');
    id = _myBox.get('id');
    dorms = _myBox.get('dorms');
    building = _myBox.get('building');
    floor = _myBox.get('floor');
    appartment = _myBox.get('appartment');
    side = _myBox.get('side');
    if(_myBox.get('favorites') != null){
      favorites = _myBox.get('favorites');
    }
  }

  void updateData(){
    _myBox.putAll({'name': name, 'phone': phone, 'id': id, 'dorms': dorms, 'building': building, 'floor': floor, 'appartment': appartment, 'side': side});
  }

  void updateFavorites(){
    _myBox.put('favorites', favorites);
  }
}