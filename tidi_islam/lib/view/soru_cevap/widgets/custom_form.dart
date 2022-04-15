import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    Key? key,
    this.topLabel,
    this.formFieldLabel,
    this.maxAlan,
    this.inputType,
    this.isObsecure = false,
    this.isReadOnly = false,
    this.validateUyari = 'Bu alan boş bırakılamaz',
    this.controller,
  }) : super(key: key);

  final String? topLabel;
  final String? formFieldLabel;
  final int? maxAlan;
  final TextInputType? inputType;
  final bool? isObsecure;
  final bool? isReadOnly;
  final String validateUyari;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
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
            textInputAction: TextInputAction.next,
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (validator) => validator!.isEmpty ? validateUyari : null,
            readOnly: isReadOnly!,
            obscureText: isObsecure!,
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
