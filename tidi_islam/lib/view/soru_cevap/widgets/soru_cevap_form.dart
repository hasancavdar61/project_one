import 'package:flutter/material.dart';

class SoruCevapForm extends StatelessWidget {
  const SoruCevapForm({
    Key? key,
    this.topLabel,
    this.formFieldLabel,
    this.maxAlan,
    this.inputType,
  }) : super(key: key);

  final String? topLabel;
  final String? formFieldLabel;
  final int? maxAlan;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 12.0),
            alignment: Alignment.centerLeft,
            child: Text(
              topLabel!,
              style: const TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            maxLines: maxAlan,
            keyboardType: inputType,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.zero),
              hintText: formFieldLabel,
              hintStyle:
                  TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
