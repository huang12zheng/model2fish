import './action.dart';
import './actions.dart';

class Reducers extends Actions{
  List<Action> datas;
  Reducers(datas):datas=datas.where(isReducer).toList(),super(datas);

/// 'ToDoEditAction.onChangeTheme: _onChangeTheme,'
/// ${DOMAINNAME}ACTION.type: _type
  @override
  String toDefindStr() {
    return datas.map((action)=>action.type).map(
      (type)=> "\n      #{DOMAINNAME}Action.$type: _$type"
    ).join(',');
  }
}
bool isReducer(e)=>!e.type.startsWith('on');