import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
    this.mask,
    this.filter,
    this.padding = 14.0,
    this.initalValue,
    this.showPress,
    this.showIcon,
    this.showIconColor,
  }) : super(key: key);

  final String? topLabel;
  final String? formFieldLabel;
  final int? maxAlan;
  final TextInputType? inputType;
  final bool? isObsecure;
  final bool? isReadOnly;
  final String validateUyari;
  final TextEditingController? controller;
  final String? mask;
  final Map<String, RegExp>? filter;
  final double padding;
  final String? initalValue;
  final VoidCallback? showPress;
  final IconData? showIcon;
  final Color? showIconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
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
            initialValue: initalValue,
            inputFormatters: [
              MaskTextInputFormatter(
                  mask: mask, //'# (###) ###-##-##',
                  filter: filter, //{"#": RegExp(r'[0-9]')},
                  type: MaskAutoCompletionType.lazy),
            ],
            cursorColor: Colors.teal,
            textInputAction: TextInputAction.next,
            controller: controller,
            validator: (validator) => validator!.isEmpty ? validateUyari : null,
            readOnly: isReadOnly!,
            obscureText: isObsecure!,
            style: const TextStyle(color: Colors.white),
            maxLines: maxAlan,
            keyboardType: inputType,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: showPress,
                  icon: Icon(showIcon, color: showIconColor)),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.zero),
              hintText: formFieldLabel,
              hintStyle:
                  TextStyle(color: Colors.white.withOpacity(1), fontSize: 18),
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
