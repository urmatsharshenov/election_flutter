/* External Dependencies */
import 'dart:async';
import 'dart:convert';
import 'package:election_flutter/models/party.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:http/http.dart' as http;

/* Local Dependencies */
import './party_event.dart';
import './party_state.dart';

class PartyBloc extends Bloc<PartyEvent, PartyState> {
  PartyBloc() : super(PartyState()) {
    on<FetchPartyListEvent>(
      (event, emit) async {
        emit(state.cloneWith(
          loading: true,
        ));

        emit(await _fetchPartyList());
      },
      transformer: droppable(),
    );

    on<SelectPartyEvent>(
      (event, emit) async {
        emit(state.cloneWith(
          loading: true,
        ));

        emit(await selectParty(event.partyIndex, event.partyID));
      },
      transformer: droppable(),
    );

    on<SelectPartyNameEvent>(
      (event, emit) async {
        emit(state.cloneWith(
          loading: true,
        ));

        emit(await selectPartyName(event.name));
      },
      transformer: droppable(),
    );

    on<SendResultToServerEvent>(
      (event, emit) async {
        emit(state.cloneWith(
          loading: true,
        ));

        emit(await uploadData());
      },
      transformer: droppable(),
    );
  }

  Future<PartyState> _fetchPartyList() async {
    final response = await http.get(
      Uri.parse(
          'https://electionflutter-default-rtdb.asia-southeast1.firebasedatabase.app/party_list.json'),
    );

    final Map _party = json.decode(response.body);

    List<Party> _party_list = [];

    _party.forEach((key, value) {
      _party_list.add(Party(
        number: int.parse(value['number']),
        titleKyrgyz: value['partyName'],
        titleRussian: value['partyName'],
        count: value['count'],
        id: key,
        image: value['image'],
      ));
    });

    try {
      return state.cloneWith(
        party_list: _party_list,
        loading: false,
      );
    } catch (err) {
      print(err);

      return state.cloneWith(
        loading: false,
      );
    }
  }

  Future<PartyState> selectParty(int partyIndex, String partyID) async {
    try {
      return state.cloneWith(
        selectedPartyIndex: partyIndex,
        selectedPartyID: partyID,
        loading: false,
      );
    } catch (err) {
      print(err);
      return state.cloneWith(
        loading: false,
      );
    }
  }

  Future<PartyState> selectPartyName(String name) async {
    try {
      return state.cloneWith(
        partyName: name,
        loading: false,
      );
    } catch (err) {
      print(err);
      return state.cloneWith(
        loading: false,
      );
    }
  }

  Future<PartyState> uploadData() async {
    final partyyy = await http.get(
      Uri.parse(
          'https://electionflutter-default-rtdb.asia-southeast1.firebasedatabase.app/party_list/${state.selectedPartyID}.json'),
    );

    final party = json.decode(partyyy.body);
    String counter = (int.parse(party['count']) + 1).toString();

    await http.put(
        Uri.parse(
            'https://electionflutter-default-rtdb.asia-southeast1.firebasedatabase.app/party_list/${state.selectedPartyID}.json'),
        body: json.encode({
          'image': party['image'],
          'number': party['number'],
          'partyName': party['partyName'],
          'count': counter,
        }));

    try {
      return state.cloneWith(
        partyName: null,
        selectedPartyIndex: 200,
        loading: false,
      );
    } catch (err) {
      print(err);
      return state.cloneWith(
        loading: false,
      );
    }
  }
}
