import 'package:app/components/RegisterPage/make_account_button.dart';
import 'package:app/components/custom_text_form_field.dart';
import 'package:app/components/logo.dart';
import 'package:app/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(children: const [
              SizedBox(height: xlarge_gap),
              Logo("Register"),
              CustomTextFormField(title: "성명", hintText: "홍길동"),
              SizedBox(height: medium_gap),
              CustomTextFormField(title: "ID", hintText: "Enter ID"),
              SizedBox(height: medium_gap),
              CustomTextFormField(
                  title: "Password", hintText: "Enter Password"
              ),
              SizedBox(height:large_gap),
              MakeAccountButton(),
            ])));
  }
}
