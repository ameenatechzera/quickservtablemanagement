class FetchOrderDetailsParameter {
  final int? tokenId;
  final int? branchId;

  FetchOrderDetailsParameter({this.tokenId, this.branchId});

  Map<String, dynamic> toJson() {
    return {"tokenId": tokenId, "branchId": branchId};
  }
}
