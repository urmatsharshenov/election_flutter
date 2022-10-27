import 'package:election_flutter/dummy_data/constants.dart';
import 'package:election_flutter/dummy_data/dummy_data_part.dart';
import 'package:election_flutter/models/party.dart';
import 'package:election_flutter/party/party_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/party_bloc.dart';
import 'bloc/party_event.dart';
import 'bloc/party_state.dart';

class PartyList extends StatefulWidget {
  const PartyList({super.key});

  @override
  State<PartyList> createState() => _PartyListState();
}

class _PartyListState extends State<PartyList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartyBloc, PartyState>(
      builder: (context, state) {
        bool isSelected = state.selectedCandidateIndex != null;

        List party_list = state.party_list;

        return Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 150,
                child: ListView.builder(
                  itemCount: party_list.length,
                  itemBuilder: (context, index) {
                    Party party = state.party_list[index];

                    return BlocProvider.value(
                      value: BlocProvider.of<PartyBloc>(context),
                      child: PartyCard(party: party, index: index),
                    );
                  },
                ),
              ),
              if (isSelected != true)
                Container(
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 55,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: state.selectedPartyIndex == null
                                ? null
                                : () {
                                    print(state.selectedPartyIndex);
                                  },
                            child: const Text('Кийинки'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
