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
      padding: const EdgeInsets.all(16.0),
      child: Form(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              topLabel!,
              style: Theme.of(context).textTheme.headline6,
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
              labelText: formFieldLabel,
              labelStyle:
                  TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          )
        ],
      )),
    );
  }
}
