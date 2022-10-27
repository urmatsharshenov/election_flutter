class PartyEvent {}

class FetchPartyListEvent extends PartyEvent {}

class SelectPartyEvent extends PartyEvent {
  int partyIndex;
  SelectPartyEvent({required this.partyIndex});
}

class FetchCandidatesListOfPartyEvent extends PartyEvent {
  int partyIndex;
  FetchCandidatesListOfPartyEvent({required this.partyIndex});
}

class EditSaleProductPriceAndQuantityEvent extends PartyEvent {
  Map product;
  EditSaleProductPriceAndQuantityEvent({required this.product});
}

class RemoveProductFromCurrentSalesdProductsListEvent extends PartyEvent {
  String barcode;
  RemoveProductFromCurrentSalesdProductsListEvent({required this.barcode});
}

class EditSaleOnLocalEvent extends PartyEvent {}

class CancelLastSaleInFixTimeEvent extends PartyEvent {}

class CancelAddingProductsEvent extends PartyEvent {}

class CancelSalePermanentlyEvent extends PartyEvent {}

// Changing scanned product's quantity and price
class ChangeProductQuantityEvent extends PartyEvent {
  Map product;
  ChangeProductQuantityEvent({required this.product});
}

class ChangeProductPriceEvent extends PartyEvent {
  Map product;
  ChangeProductPriceEvent({required this.product});
}

class RemoveProductFromScannedProductsListEvent extends PartyEvent {
  String barcode;
  RemoveProductFromScannedProductsListEvent({required this.barcode});
}

class SellProductsEvent extends PartyEvent {}

class SetCurrentSaleIdEvent extends PartyEvent {
  String saleId;
  SetCurrentSaleIdEvent({required this.saleId});
}

class SalesListFetchEvent extends PartyEvent {}

class SalesListFetchMoreEvent extends PartyEvent {}

class ClearScannedProductsListEvent extends PartyEvent {}

class AddProductsToUsersWarehouseEvent extends PartyEvent {}

class SaleSearchEvent extends PartyEvent {
  final String? query;

  SaleSearchEvent({this.query});
}

// Pasue / resume camera
class PauseScannerEvent extends PartyEvent {}

class ResumeScannerEvent extends PartyEvent {}

// Controlling panels
class OpenSalesPanelEvent extends PartyEvent {}

class CloseSalesPanelEvent extends PartyEvent {}

class OpenPricePanelEvent extends PartyEvent {
  OpenPricePanelEvent();
}

class ClosePricePanelEvent extends PartyEvent {
  ClosePricePanelEvent();
}
