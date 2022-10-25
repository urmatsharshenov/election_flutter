import 'package:election_flutter/dummy_data/dummy_data_part.dart';
import 'package:election_flutter/models/party.dart';
import 'package:flutter/material.dart';

class PartyList extends StatefulWidget {
  const PartyList({super.key});

  @override
  State<PartyList> createState() => _PartyListState();
}

class _PartyListState extends State<PartyList> {
  @override
  Widget build(BuildContext context) {
    final List<Party> party_list = partyList;

    return ListView.builder(
      itemCount: party_list.length,
      itemBuilder: (context, index) {
        Party party = party_list[index];

        return Card(
          child: Container(
            height: 120,
            // color: Colors.yellow,
            child: Row(
              children: [
                SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width * 0.4 - 16,
                  child: Image.network(party.image!, fit: BoxFit.cover),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(party.titleKyrgyz, textAlign: TextAlign.left),
                      Text(party.titleRussian, textAlign: TextAlign.left),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
