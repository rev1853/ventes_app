// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:ventes/app/models/schedule_model.dart';
import 'package:ventes/app/resources/views/regular_view.dart';
import 'package:ventes/app/resources/widgets/regular_appointment_card.dart';
import 'package:ventes/app/resources/widgets/top_navigation.dart';
import 'package:ventes/constants/regular_color.dart';
import 'package:ventes/constants/regular_size.dart';
import 'package:ventes/helpers/function_helpers.dart';
import 'package:ventes/network/contracts/fetch_data_contract.dart';
import 'package:ventes/state_controllers/daily_schedule_state_controller.dart';

part 'package:ventes/app/resources/views/daily_schedule/components/_calendar.dart';

class DailyScheduleView extends RegularView<DailyScheduleStateController> implements FetchDataContract {
  static const String route = "/schedule/daily";
  DailyScheduleView({
    required DateTime date,
  }) {
    $ = controller;
    $.dataSource.fetchContract = this;
    $.date = date;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: RegularColor.primary,
    ));
    return Scaffold(
      backgroundColor: RegularColor.primary,
      extendBodyBehindAppBar: true,
      appBar: TopNavigation(
        title: "Schedule",
        height: 85,
        appBarKey: $.appBarKey,
        leading: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(RegularSize.xs),
            child: SvgPicture.asset(
              "assets/svg/arrow-left.svg",
              width: RegularSize.xl,
              color: Colors.white,
            ),
          ),
          onTap: $.listener.onArrowBackClick,
        ),
        below: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              formatDate($.date),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ).build(context),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: RegularSize.m,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(RegularSize.xl),
              topRight: Radius.circular(RegularSize.xl),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: RegularSize.xl,
              ),
              Expanded(
                child: Obx(() {
                  return _Calendar(
                    date: $.date,
                    dataSource: RegularCalendarDataSource(
                      $.dataSource.appointments,
                      date: $.date,
                      type: CalendarDataSourceType.daily,
                    ),
                    appointmentBuilder: (_, detail) {
                      return RegularAppointmentCard(
                        schedule: detail.appointments.first,
                      );
                    },
                  );
                }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: $.listener.onAddButtonClick,
        backgroundColor: RegularColor.primary,
        child: SvgPicture.asset(
          'assets/svg/plus.svg',
          color: Colors.white,
          width: RegularSize.l,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  @override
  onLoadFailed(String message) {}

  @override
  onLoadSuccess(Map data) {
    List<Schedule> appointments = [];
    data["schedules"].forEach((value) {
      appointments.add(Schedule.fromJson(value));
    });
    $.dataSource.appointments = appointments;
  }
}