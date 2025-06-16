import 'package:flutter/material.dart';
height(double value) => SizedBox(height: value);

void extractId<T>({
  required List<T> list,
  required String selectedValue,
  required String Function(T) getDescription,
  required String Function(T) getId,
  required void Function(String) setId,
}) {
  final T? selectedItem = list.cast<T?>().firstWhere(
        (item) => item != null && getDescription(item) == selectedValue,
        orElse: () => null,
      );

  setId(selectedItem != null ? getId(selectedItem) : "");
}
