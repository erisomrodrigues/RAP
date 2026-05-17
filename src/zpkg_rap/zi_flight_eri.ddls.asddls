@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds para visualização de voos'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_FLIGHT_ERI
  as select from /dmo/flight

  association [1..1] to ZI_CARRIER_ERI as _Airline on $projection.CarrierId = _Airline.carrierid

{
      @UI.lineItem: [{position: 10}]
      @UI.identification: [{position: 10}]
  key carrier_id     as CarrierId,

      @UI.lineItem: [{position: 20}]
      @UI.identification: [{position: 20}]
  key connection_id  as ConnectionId,

      @UI.lineItem: [{position: 30}]
      @UI.identification: [{position: 30}]
  key flight_date    as FlightDate,

      @UI.lineItem: [{position: 40}]
      @UI.identification: [{position: 40}]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,

      @UI.lineItem: [{position: 50}]
      @UI.identification: [{position: 50}]
      currency_code  as CurrencyCode,

      @UI.lineItem: [{position: 60}]
      @UI.identification: [{position: 60}]
      plane_type_id  as PlaneTypeId,

      @UI.lineItem: [{position: 70}]
      @UI.identification: [{position: 70}]
      seats_max      as SeatsMax,

      @UI.lineItem: [{position: 80}]
      @UI.identification: [{position: 80}]
      seats_occupied as SeatsOccupied,

      //Association
      _Airline

}
