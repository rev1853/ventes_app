part of 'package:ventes/views/schedule_form/create/schedule_fc.dart';

class _SharelinkCheckbox extends StatelessWidget {
  _SharelinkCheckbox({
    required this.onChecked,
    required this.value,
    required this.enabled,
  });
  void Function(bool value) onChecked;
  bool enabled;
  bool value;

  @override
  Widget build(BuildContext context) {
    return RegularCheckbox(
      label: "Share Link",
      onChecked: onChecked,
      enabled: enabled,
      value: value,
    );
  }
}