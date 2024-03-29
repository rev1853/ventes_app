// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ventes/constants/regular_color.dart';
import 'package:ventes/constants/regular_size.dart';
import 'package:ventes/app/states/controllers/history_state_controller.dart';
import 'package:ventes/core/view.dart';
import 'package:ventes/app/resources/widgets/icon_input.dart';
import 'package:ventes/app/resources/widgets/regular_button.dart';
import 'package:ventes/app/resources/widgets/regular_dialog.dart';
import 'package:ventes/app/resources/widgets/regular_select_pill.dart';
import 'package:ventes/app/resources/widgets/schedule_card.dart';
import 'package:ventes/app/resources/widgets/top_navigation.dart';

class HistoryView extends View<HistoryStateController> {
  static const String route = "/history";
  HistoryView() {
    state = controller;
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
        title: "History",
        appBarKey: state.appBarKey,
        actions: [
          GestureDetector(
            onTap: _showFilter,
            child: Container(
              padding: EdgeInsets.all(RegularSize.xs),
              child: SvgPicture.asset(
                "assets/svg/filter.svg",
                width: RegularSize.l,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ).build(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () {
              return Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  minHeight: state.minHeight,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(RegularSize.xl),
                    topRight: Radius.circular(RegularSize.xl),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: RegularSize.m,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: RegularSize.m),
                      child: IconInput(
                        icon: "assets/svg/search.svg",
                        hintText: "Search",
                      ),
                    ),
                    SizedBox(
                      height: RegularSize.m,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: RegularSize.m),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "History List",
                        style: TextStyle(
                          fontSize: 20,
                          color: RegularColor.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: RegularSize.m,
                    ),
                    ListView.builder(
                      itemCount: 10,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: RegularSize.m),
                              child: Text(
                                "May 22, 2022",
                                style: TextStyle(
                                  color: RegularColor.dark,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              height: 280,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  double mRight = 0;
                                  if (index == 9) {
                                    mRight = 16;
                                  }
                                  String media = index % 2 == 1 ? "By Phone" : "On Site";
                                  return ScheduleCard(
                                    image: AssetImage('assets/images/dummybg.jpg'),
                                    margin: EdgeInsets.only(
                                      left: 16,
                                      right: mRight,
                                      top: 24,
                                      bottom: 24,
                                    ),
                                    width: 220,
                                    title: "Nexus Inc",
                                    type: "Reality Factory",
                                    time: "16.00",
                                    media: media,
                                    department: "Welfare & Hapiness",
                                    contact: "Wanda Maximoff",
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showFilter() {
    RegularDialog(
      width: Get.width * 0.9,
      child: Column(
        children: [
          GestureDetector(
            onTap: state.changeTime,
            child: IconInput(
              label: "Visit Time",
              icon: "assets/svg/history.svg",
              hintText: "Visit Time",
              enabled: false,
              controller: state.filterTimeInputController,
            ),
          ),
          SizedBox(
            height: RegularSize.m,
          ),
          RegularSelectPill(
            label: "Visit Type",
            items: [
              RegularSelectPillItem(text: "On Site", value: "1"),
              RegularSelectPillItem(text: "By Phone", value: "2"),
            ],
            onSelected: (val) {
              print(val);
            },
          ),
          SizedBox(
            height: RegularSize.m,
          ),
          RegularSelectPill(
            label: "Group By",
            items: [
              RegularSelectPillItem(text: "Date", value: "1"),
              RegularSelectPillItem(text: "Customer", value: "2"),
            ],
            onSelected: (val) {
              print(val);
            },
          ),
          SizedBox(
            height: RegularSize.m,
          ),
          RegularButton(
            label: "Apply",
            primary: RegularColor.secondary,
            height: RegularSize.xxl,
          ),
        ],
      ),
    ).show();
  }
}
