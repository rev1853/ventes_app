// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:ventes/app/models/schedule_model.dart';
import 'package:ventes/app/models/type_model.dart';
import 'package:ventes/app/network/presenters/schedule_presenter.dart';
import 'package:ventes/app/network/contracts/fetch_data_contract.dart';

class ScheduleDataSource {
  final SchedulePresenter _presenter = SchedulePresenter();
  set fetchDataContract(FetchDataContract value) => _presenter.fetchContract = value;

  final _types = <String, int>{}.obs;
  Map<String, int> get types => _types.value;
  set types(Map<String, int> value) => _types.value = value;

  void listToTypes(List types) {
    List<DBType> dbType = List<DBType>.from(types.map((e) => DBType.fromJson(e)).toList());
    this.types = dbType.asMap().map((i, e) => MapEntry(e.typename ?? "", e.typeid ?? 0));
  }

  final _appointments = <Schedule>[].obs;
  List<Schedule> get appointments => _appointments.value;
  set appointments(List<Schedule> value) => _appointments.value = value;

  void listToAppointments(List? value) {
    if (value != null) {
      appointments = List<Schedule>.from(value.map((item) => Schedule.fromJson(item)));
    }
  }

  void fetchSchedules([int? month]) {
    _presenter.fetchSchedules(month);
  }

  void fetchData([int? scheduleMonth]) {
    _presenter.fetchData(scheduleMonth);
  }
}
