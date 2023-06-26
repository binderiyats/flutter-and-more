import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  final lastNameController = TextEditingController();
  GenderEnum gender = GenderEnum.male;
  bool isChecked = false;

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(lastNameController.text),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "required";
                  }
                  return null;
                },
                controller: lastNameController,
                decoration: InputDecoration(
                  label: Text("Lastname"),
                  hintText: "Adam",
                ),
              ),
              DropdownButtonFormField(
                items: List.generate(
                  5,
                  (index) => DropdownMenuItem(
                    value: index,
                    child: Text("A"),
                  ),
                ),
                onChanged: (value) {},
              ),
              Row(
                children: [
                  Radio(
                      value: GenderEnum.male,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value as GenderEnum;
                          // print(value);
                        });
                      }),
                  Text("Male"),
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: GenderEnum.female,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value as GenderEnum;
                          print(gender);
                        });
                      }),
                  Text("Female"),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: isChecked,
                      onChanged: (val) {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      }),
                  Text("Agreed the condition"),
                ],
              ),
              ElevatedButton(
                onPressed: onSubmit,
                child: Text("Submit"),
              )
            ],
          ),
        ),
      )),
    );
  }
}

enum GenderEnum {
  male,
  female,
  other;
}
