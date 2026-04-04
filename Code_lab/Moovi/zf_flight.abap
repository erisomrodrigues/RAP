@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_FLIGHT_ERI
  as select from /dmo/flight
  association [1..1] to ZI_CARRIER_ERI as _Airline on $projection.CarrierId = _Airline.CarrierID
{
      @UI.facet: [{
      id: 'Flight',
      purpose: #STANDARD,
      position: 10,
      label: 'Voos',
      type: #IDENTIFICATION_REFERENCE}]
      
      @UI:{
      lineItem: [{position: 10}],
      identification: [{position: 10}]}
  key carrier_id     as CarrierId,
      @UI:{
      lineItem: [{position: 20}],
      identification: [{position: 20}]}
  key connection_id  as ConnectionId,
      @UI:{
      lineItem: [{position: 30}],
      identification: [{position: 30}]}
  key flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneTypeId,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied,

      //Associção
      _Airline
}
