import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:x_challenge/constants/gaps.dart';
import 'package:x_challenge/constants/sizes.dart';
import 'package:x_challenge/features/widget/pincodestate.dart';

class PinCodeFieldWidget extends StatefulWidget {
  final int length;
  final void Function(String)? onCompleted;

  const PinCodeFieldWidget({
    super.key,
    required this.length,
    this.onCompleted,
  });

  @override
  _PinCodeFieldWidgetState createState() => _PinCodeFieldWidgetState();
}

class _PinCodeFieldWidgetState extends State<PinCodeFieldWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final value = _controller.text;
      Provider.of<PinCodeState>(context, listen: false)
          .setCompleted(value.length == widget.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isCompleted = Provider.of<PinCodeState>(context).isCompleted;
    print("이거 맞냐?? $isCompleted");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PinCodeTextField(
          appContext: context,
          length: widget.length,
          onChanged: (value) {},
          onCompleted: widget.onCompleted,
          keyboardType: TextInputType.number,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
            selectedFillColor: Colors.white,
            inactiveFillColor: Colors.white,
          ),
          controller: _controller,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
        ),
        Gaps.v36,
        Icon(
          Icons.check_circle,
          color: isCompleted ? Colors.green : Colors.white,
          size: Sizes.size36,
        )
      ],
    );
  }
}
