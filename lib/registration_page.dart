import 'package:election_flutter/party/party_list_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                  data: new ThemeData(
                    primaryColor: Colors.red,
                    primaryColorDark: Colors.black,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Введите ID",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 8) {
                        return 'Введите ID правильно';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => PartyListPage()));
                  }
                },
                child: const Text('Подтвердить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
