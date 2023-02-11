

import '../core/components/template.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());

  DateTime date = DateTime.now();

  bool isSwitched = false;

//! For Date Function
  void emitDate() {
    date;
    super.emit(DateTimeState());
  }

  //! For Date Time
  String dateDate(DateTime date) {
    dynamic monthData =
        '{ "1" : "январ", "2" : "ферврал", "3" : "март", "4" : "апрел", "5" : "май", "6" : "июн", "7" : "июл", "8" : "август", "9" : "сентябр", "10" : "октябр", "11" : "ноябр", "12" : "декабр" }';
    return date.day.toString() + " " + json.decode(monthData)['${date.month}'];
  }

  String dateFormatter(DateTime date) {
    dynamic dayData =
        '{ "1" : "Душанба", "2" : "Сешанба", "3" : "Чоршанба", "4" : "Пайшанба", "5" : "Жума", "6" : "Шанба", "7" : "Якшанба" }';

    dynamic monthData =
        '{ "1" : "январ", "2" : "ферврал", "3" : "март", "4" : "апрел", "5" : "май", "6" : "июн", "7" : "июл", "8" : "август", "9" : "сентябр", "10" : "октябр", "11" : "ноябр", "12" : "декабр" }';

    return json.decode(dayData)['${date.weekday}'];
  }

  
 
}
