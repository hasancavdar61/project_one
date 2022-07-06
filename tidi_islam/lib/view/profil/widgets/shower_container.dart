import 'package:flutter/material.dart';

class ShowerContainer extends StatelessWidget {
  const ShowerContainer({
    Key? key,
    this.topLabel,
    this.formFieldLabel,
    this.icColor,
  }) : super(key: key);

  final String? topLabel;
  final String? formFieldLabel;
  final Color? icColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0, left: 2.0),
          child: Text(
            topLabel!,
            style: const TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 14.0),
          padding: const EdgeInsets.only(top: 16.0, bottom: 20.0, left: 10.0),
          width: double.maxFinite,
          child: Row(
            children: [
              Text(
                formFieldLabel!,
                style: Theme.of(context).textTheme.headline6,
              ),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: icColor,
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
