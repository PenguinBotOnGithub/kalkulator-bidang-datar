import 'package:flutter/material.dart';

Widget textField(TextEditingController controller, TextInputType type,
    String label, FocusNode focusNode) {
  return TextField(
    focusNode: focusNode,
    onTap: () => focusNode.requestFocus(),
    onTapOutside: (event) => focusNode.unfocus(),
    controller: controller,
    keyboardType: type,
    decoration:
        InputDecoration(border: const OutlineInputBorder(), labelText: label),
  );
}

Widget calculationButtons(
    void Function() calculateFn, void Function() resetFn) {
  return Row(
    children: [
      Expanded(
        child: OutlinedButton(
            onPressed: calculateFn, child: const Text("Calculate")),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: OutlinedButton(onPressed: resetFn, child: const Text("Reset")),
      ),
    ],
  );
}

Widget dropDown<T>(FocusNode focus, T value, Map<String, T> mapData,
    void Function(T?) onChangedFn) {
  return TapRegion(
    onTapInside: (event) => focus.requestFocus(),
    onTapOutside: (e) => focus.unfocus(),
    child: DropdownButtonFormField(
        value: value,
        isExpanded: true,
        decoration: const InputDecoration(border: OutlineInputBorder()),
        focusNode: focus,
        items: mapData.entries
            .map((e) => DropdownMenuItem(
                  value: e.value,
                  child: Text(e.key),
                ))
            .toList(),
        onChanged: onChangedFn),
  );
}
