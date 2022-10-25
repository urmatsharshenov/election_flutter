import 'package:election_flutter/party/party_list.dart';
import 'package:flutter/material.dart';

class PartyListPage extends StatefulWidget {
  const PartyListPage({super.key});

  @override
  State<PartyListPage> createState() => _PartyListPageState();
}

class _PartyListPageState extends State<PartyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Партиялар тизмеги'),
      ),
      body: PartyList(),
    );
  }
}
