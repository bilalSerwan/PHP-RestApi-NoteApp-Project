import 'package:flutter/material.dart';

class CostoumeTextForm extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?) valid;
  const CostoumeTextForm(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.valid});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: TextFormField(
        minLines: 1,
        maxLines: 4,
        validator: valid,
        controller: controller,
        keyboardType: TextInputType.text,
        scrollPadding: const EdgeInsets.all(5),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            )),
      ),
    );
  }
}
