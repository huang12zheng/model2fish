import './action.dart';
import './actions.dart';

class Effects extends Actions{
  List<Action> datas;
  Effects(datas):datas=datas.where(isEffect).toList(),super(datas);

/// 'ToDoEditAction.onChangeTheme: _onChangeTheme,'
/// ${DOMAINNAME}ACTION.type: _type
  @override
  String toDefindStr() {
    return datas.map((action)=>action.type).map(
      (type)=> "\n    #{DOMAINNAME}Action.$type: _$type"
    ).join(',');
  }
}
bool isEffect(e)=>e.type.startsWith('on');