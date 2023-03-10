
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp/presentation/bloc/phone_auth/phone_auth_cubit.dart';
import 'package:whatsapp/presentation/widgets/theme/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneVerificationPage extends StatefulWidget {
  final String phoneNumber;

  const PhoneVerificationPage({ Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _PhoneVerificationPageState createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {

  String get _phoneNumber => widget.phoneNumber;
  final TextEditingController _pinCodeController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              const Text(
                "Verify your phone number",
                style: TextStyle(
                    fontSize: 18,
                    color: greenColor,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "WhatsApp Clone will send and SMS message (carrier charges may apply) to verify your phone number. Enter your country code and phone number:",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              _pinCodeWidget(),
              const Text("Enter your 6 digit code"),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    color: greenColor,
                    onPressed: _submitSmsCode,
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _pinCodeWidget() {
    return PinCodeTextField(
      controller: _pinCodeController,
      length: 6,
      backgroundColor: Colors.transparent,
      autoDisposeControllers: false,
      onChanged: (pinCode){
        print(pinCode);
      },
      appContext: context,
    );
  }

  void _submitSmsCode(){
    if (_pinCodeController.text.isNotEmpty){
      BlocProvider.of<PhoneAuthCubit>(context)
          .submitSmsCode(smsCode: _pinCodeController.text);
    }
  }
}
