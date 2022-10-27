import 'package:election_flutter/models/candidate.dart';
import 'package:election_flutter/dummy_data/dummy_data_candidate..dart';
import 'package:election_flutter/party/party_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'party/bloc/party_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PartyBloc>(
          create: (BuildContext context) => PartyBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PartyListPage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String choice = '';
  int? selectedIndex;
  Color color = Colors.white;
  void _handleRadioValueChanged(String? value) {
    setState(() {
      choice = value!;
      print(value);
      selectedIndex = int.parse(choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('aa'),
      ),
      body: ListView.builder(
          itemCount: alliance.length,
          itemBuilder: (context, index) {
            Candidate candidate = alliance[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: selectedIndex == index + 1 ? Colors.green : Colors.white,
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(unselectedWidgetColor: Colors.green),
                  child: Container(
                    height: 60,
                    child: SizedBox(
                      height: 50,
                      child: RadioListTile<String>(
                        groupValue: choice,
                        activeColor: Colors.red,
                        title: Text(candidate.lastname),
                        value: candidate.number.toString(),
                        onChanged: _handleRadioValueChanged,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
