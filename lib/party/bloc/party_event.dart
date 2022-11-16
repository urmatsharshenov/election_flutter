class PartyEvent {}

class FetchPartyListEvent extends PartyEvent {}

class SelectPartyEvent extends PartyEvent {
  int partyIndex;
  SelectPartyEvent({required this.partyIndex});
}

class SelectPartyNameEvent extends PartyEvent {
  String name;
  SelectPartyNameEvent({required this.name});
}

class SelectCandidateEvent extends PartyEvent {
  int candidateIndex;
  SelectCandidateEvent({required this.candidateIndex});
}

class SelectCandidateNameEvent extends PartyEvent {
  String name;
  SelectCandidateNameEvent({required this.name});
}
