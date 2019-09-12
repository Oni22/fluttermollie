
/// Not final


abstract class MollieResponse {

  dynamic toMap();

}

abstract class MollieRequest {

  MollieRequest.build(dynamic data);
  dynamic toJson();

}