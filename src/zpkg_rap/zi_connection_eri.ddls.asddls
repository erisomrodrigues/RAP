@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds para visualização das conexões dos voos'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_connection_eri
  as select from /dmo/connection
  association [1..*] to ZI_FLIGHT_ERI  as _flight  on  $projection.CarrierId    = _flight.CarrierId
                                                   and $projection.ConnectionId = _flight.ConnectionId
  association [1]    to ZI_CARRIER_ERI as _Carrier on  $projection.CarrierId = _Carrier.carrierid
{
  key carrier_id      as CarrierId,
  key connection_id   as ConnectionId,
      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,
      departure_time  as DepartureTime,
      arrival_time    as ArrivalTime,
      distance        as Distance,
      distance_unit   as DistanceUnit,

      //Association
      _flight,
      _Carrier
}
