@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection'
@Metadata.ignorePropagatedAnnotations: true
//@Search.searchable: true
define view entity zi_connection_eri
  as select from /dmo/connection
  association [1..*] to ZI_FLIGHT_ERI  as _flight  on  $projection.CarrierId    = _flight.CarrierId
                                                   and $projection.ConnectionId = _flight.ConnectionId
  association [1]    to ZI_CARRIER_ERI as _carrier on  $projection.CarrierId = _carrier.CarrierID
  association [1]    to ZI_AIRPORT_ERI as _airport on  $projection.AirportFromId = _airport.AirportId
{
      @UI.facet: [{
      id: 'Connection',
      purpose: #STANDARD,
      position: 10,
      label: 'Conexão',
      type: #IDENTIFICATION_REFERENCE},
      {
      id: 'Flight',
      purpose: #STANDARD,
      position: 20,
      label: 'Voos',
      type: #LINEITEM_REFERENCE,
      targetElement: '_flight'}]

      @UI.lineItem: [{position: 10, label: 'Companhia'}]
      @UI.identification: [{position: 10, label: 'Companhia'}]
      @ObjectModel.text.association: '_carrier'
      @UI.selectionField: [{position: 10}]
      @Consumption.valueHelpDefinition: [{entity: { name: 'ZI_CARRIER_ERI', element: 'CarrierID' } }]
  key carrier_id      as CarrierId,

      @UI.lineItem: [{position: 20, label: 'Conexão'}]
      @UI.identification: [{position: 20, label: 'Conexão'}]
      @UI.selectionField: [{position: 20}]
  key connection_id   as ConnectionId,

      @UI.lineItem: [{position: 30, label: 'Aeroporto Orig.'}]
      @UI.identification: [{position: 30, label: 'Aeroporto Orig.'}]
      @ObjectModel.text.association: '_airport'
      @UI.selectionField: [{position: 30}]
      @Consumption.valueHelpDefinition: [{entity: { name: 'ZI_AIRPORT_ERI', element: 'AirportId' } }]
      airport_from_id as AirportFromId,

      @UI.lineItem: [{position: 40, label: 'Aeroporto Dest.'}]
      @UI.identification: [{position: 10, label: 'Aeroporto Dest.'}]
      @ObjectModel.text.association: '_airport'
      @UI.selectionField: [{position: 40}]
      @Consumption.valueHelpDefinition: [{entity: { name: 'ZI_AIRPORT_ERI', element: 'AirportId' } }]
      airport_to_id   as AirportToId,
      departure_time  as DepartureTime,
      arrival_time    as ArrivalTime,
      distance        as Distance,
      distance_unit   as DistanceUnit,

      //Associações
      _flight,
      _carrier,
      _airport

}
