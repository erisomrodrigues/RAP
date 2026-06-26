@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds para visualização das conexões dos voos'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@ObjectModel.usageType: {
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity zi_connection_eri
  as select from /dmo/connection
  association [1..*] to ZI_FLIGHT_ERI  as _flight      on  $projection.CarrierId    = _flight.CarrierId
                                                       and $projection.ConnectionId = _flight.ConnectionId
  association [1]    to ZI_CARRIER_ERI as _Carrier     on  $projection.CarrierId = _Carrier.carrierid
  association [1]    to ZI_AIRPORT_ERI as _Airport     on  $projection.AirportFromId = _Airport.AirportId
  association [1]    to ZI_AIRPORT_ERI as _AirportDest on  $projection.AirportToId = _AirportDest.AirportId
{
      //  Cria uma tela quando ocorrer duplo click na lista da tela principal. Semelhante ao hotsport
      @UI.facet: [{
          id: 'Connection',
          purpose: #STANDARD,
          position: 10,
          label: 'Connection',
          type: #IDENTIFICATION_REFERENCE },

      //  Cria uma subtela com lista de itens com base na tela de id CONNECTION
          {
          id: 'flight',
          purpose: #STANDARD,
          position: 20,
          label: 'Voos',
          type: #LINEITEM_REFERENCE,
          targetElement: '_flight'
          }]

      @UI.lineItem: [{position: 10, label: 'Companhia'}]
      @UI.identification: [{position: 10}]
      @ObjectModel.text.association: '_Carrier' -- Trás a descrição para o campo após adicionar annotation Semantics.text a ZI_CARRIE
      @UI.selectionField: [{position: 10}] --      Determina campos de filtros, semelhantes aos parameters no ABAP.
      @Search.defaultSearchElement: true --        Determinar buscar os valores informado
      @Search.fuzzinessThreshold: 0.7 --           Permite buscar busca imcompleta, indo de 0 a 1, nesse exemplo margem de erro está em 70%
  key carrier_id      as CarrierId,

      @UI.lineItem: [{position: 20, label: 'Conexão' }]
      @UI.identification: [{position: 20}]
  key connection_id   as ConnectionId,

      @UI.lineItem: [{position: 30, label: 'Aeroporto Orig.' }]
      @UI.identification: [{position: 30  }]
      @ObjectModel.text.association: '_Airport'
      @UI.selectionField: [{position: 30  }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      airport_from_id as AirportFromId,

      @UI.lineItem: [{position: 40, label: 'Aeroporto Dest.' }]
      @UI.identification: [{position: 40}]
      @ObjectModel.text.association: '_Airport'
      @UI.selectionField: [{position: 40}]
      @Consumption.valueHelpDefinition: [{--       Define um search Help ao Aeroporto Destino
         entity: {
           name: 'ZI_AIRPORT_ERI',
        element: 'AirportId' } }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      airport_to_id   as AirportToId,

      @UI.lineItem: [{position: 50}]
      @UI.identification: [{position: 50}]
      departure_time  as DepartureTime,

      @UI.lineItem: [{position: 60}]
      @UI.identification: [{position: 60}]
      arrival_time    as ArrivalTime,

      @UI.lineItem: [{position: 70}]
      @UI.identification: [{position: 70}]
      distance        as Distance,

      @UI.lineItem: [{position: 80}]
      @UI.identification: [{position: 80}]
      distance_unit   as DistanceUnit,

      //Association
      _flight,
      _Carrier,
      _Airport
}
