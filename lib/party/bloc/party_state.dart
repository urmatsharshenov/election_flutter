/* External Dependencies */
import 'package:election_flutter/models/party.dart';

class PartyState {
  List party_list = [];
  int? selectedPartyIndex;
  int? selectedCandidateIndex;
  bool? loading;

  PartyState({
    this.party_list = const [],
    this.selectedPartyIndex,
    this.selectedCandidateIndex,
    this.loading = false,
  });

  PartyState cloneWith({
    List<Party>? party_list,
    int? selectedPartyIndex,
    int? selectedCandidateIndex,
    bool? loading,
  }) =>
      PartyState(
        selectedPartyIndex: selectedPartyIndex ?? this.selectedPartyIndex,
        selectedCandidateIndex:
            selectedCandidateIndex ?? this.selectedCandidateIndex,
        party_list: party_list ?? this.party_list,
        loading: loading ?? this.loading,
      );
}
