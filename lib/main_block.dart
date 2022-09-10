import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class MainBlock{

  final BehaviorSubject<int> _countSubject = BehaviorSubject.seeded(0);
  final SharedPreferences _sharedPreferences;


  Stream<int> get countStream => _countSubject.stream;


  MainBlock(
      this._sharedPreferences,
      ){
    _init();
  }

  _init(){
    _countSubject.add(_sharedPreferences.getInt("count") ?? 0);
  }

  void countPlus() async{
    ++_countSubject.value;
    await _sharedPreferences.setInt("count", _countSubject.value);
    _countSubject.add(_countSubject.value);
  }


  void dispose() {
    _countSubject.close();
  }
}