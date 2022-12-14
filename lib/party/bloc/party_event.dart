class PartyEvent {}

class FetchPartyListEvent extends PartyEvent {}

class SelectPartyEvent extends PartyEvent {
  int partyIndex;
  String partyID;
  SelectPartyEvent({required this.partyIndex, required this.partyID});
}

class SelectPartyNameEvent extends PartyEvent {
  String name;
  SelectPartyNameEvent({required this.name});
}

class SendResultToServerEvent extends PartyEvent {}
