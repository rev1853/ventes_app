// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventes/constants/regular_color.dart';
import 'package:ventes/constants/regular_size.dart';

class RegularSelectBox<T> extends StatelessWidget {
  String? label;
  final _activeIndex = RxInt(-1);
  void Function(int)? onSelected;
  List<T> items;

  RegularSelectBox({
    this.label,
    this.onSelected,
    required this.items,
    int? activeIndex,
  }) {
    if (activeIndex != null) {
      _activeIndex.value = activeIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label ?? "",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: RegularColor.dark,
            ),
          ),
        SizedBox(
          height: RegularSize.s,
        ),
        Container(
          width: double.infinity,
          child: Wrap(
            spacing: RegularSize.s,
            runSpacing: RegularSize.s,
            children: items
                .asMap()
                .map(
                  (key, value) {
                    return MapEntry(
                      key,
                      Obx(() {
                        return _buildItem(
                          value.toString(),
                          _activeIndex.value == key,
                          () {
                            bool isSame = _activeIndex.value == key;
                            if (!isSame) {
                              _activeIndex.value = key;
                              onSelected?.call(key);
                            }
                          },
                        );
                      }),
                    );
                  },
                )
                .values
                .toList(),
          ),
        )
      ],
    );
  }

  Widget _buildItem(String text, bool isActive, void Function() onTap) {
    return Material(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(RegularSize.s),
        splashColor: isActive ? RegularColor.green.withOpacity(0.1) : null,
        child: Ink(
          padding: EdgeInsets.symmetric(
            horizontal: RegularSize.m,
            vertical: RegularSize.s,
          ),
          decoration: BoxDecoration(
            color: isActive ? RegularColor.green : Colors.white,
            border: Border.all(
              color: isActive ? RegularColor.green : RegularColor.disable,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(RegularSize.s),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.white : RegularColor.dark,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
