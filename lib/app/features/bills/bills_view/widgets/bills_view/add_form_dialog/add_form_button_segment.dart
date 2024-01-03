import 'package:flutter/material.dart';
import '../../../../../../shared/extensions/string_extension.dart';

class AddFormButtonSegment<T> extends StatelessWidget {
  final List<T> values;
  final Set<T> selectedValue;
  final Function(Set<T>) onChange;

  const AddFormButtonSegment(
      {super.key,
      required this.selectedValue,
      required this.values,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SegmentedButton<T>(
        segments: values
            .map(
              (value) => ButtonSegment(
                  value: value,
                  label: Text(
                    value.toString().split(".")[1].capitalize(),
                    style: const TextStyle(fontSize: 13),
                  )),
            )
            .toList(),
        selected: selectedValue,
        onSelectionChanged: onChange,
      ),
    );
  }
}
