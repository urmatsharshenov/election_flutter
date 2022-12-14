/* External Dependencies */
import 'package:election_flutter/models/party.dart';

class PartyState {
  List party_list = [];
  int? selectedPartyIndex;
  bool? loading;
  String? selectedPartyID;
  String? partyName;

  PartyState({
    this.party_list = const [],
    this.selectedPartyIndex,
    this.loading = false,
    this.partyName,
    this.selectedPartyID,
  });

  PartyState cloneWith({
    List<Party>? party_list,
    int? selectedPartyIndex,
    String? partyName,
    String? selectedPartyID,
    bool? loading,
  }) =>
      PartyState(
        selectedPartyIndex: selectedPartyIndex ?? this.selectedPartyIndex,
        party_list: party_list ?? this.party_list,
        loading: loading ?? this.loading,
        partyName: partyName ?? this.partyName,
        selectedPartyID: selectedPartyID ?? this.selectedPartyID,
      );
}
