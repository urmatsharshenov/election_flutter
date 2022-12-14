import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/party_bloc.dart';
import 'bloc/party_state.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Result'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 10,
        child: BlocBuilder<PartyBloc, PartyState>(
          builder: (context, state) {
            List partyList = state.party_list;
            return ListView.builder(
              itemCount: partyList.length,
              itemBuilder: ((context, index) {
                final party = partyList[index];
                return ListTile(
                  title: Text(party.titleRussian),
                  trailing: Text(party.count),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
