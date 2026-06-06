@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Booking Entity'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@UI.headerInfo: { typeName: 'Booking',
                  typeNamePlural: 'Bookings',
                  title: { type: #STANDARD, value: 'BookingId' }}

define view entity ZC_BOOKING_M_ERI
  as projection on ZI_BOOKING_M_ERI
{
      @Search.defaultSearchElement: true
      @UI.facet: [{id: 'Booking',           purpose: #STANDARD, type: #IDENTIFICATION_REFERENCE, label: 'Booking', position: 10 },
                  {id: 'BookingSupplement', purpose: #STANDARD, type: #IDENTIFICATION_REFERENCE, label: 'Booking Supplement', position: 20, targetElement: '_bookingSuppl' }]
  key TravelId,

      @Search.defaultSearchElement: true
      @UI.identification: [{position: 20 }]
      @UI.lineItem: [{position: 20, importance: #HIGH  }]
  key BookingId,

      @UI.identification: [{position: 30 }]
      @UI.lineItem: [{position: 30, importance: #HIGH  }]
      BookingDate,
      CustomerId,
      CarrierId,

      @Consumption.valueHelpDefinition: [{entity: { name: '/DMO/I_Customer',  element: 'CustomerID' }}]
      @ObjectModel.text.element: [ 'CustomerName' ]
      @Search.defaultSearchElement: true
      @UI: { identification: [{position: 40 }],
             lineItem:       [{position: 40, importance: #HIGH  }]}
      ConnectionId,
      _Customer.LastName        as CustomerName,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight', element: 'FlightDate' },
                                           additionalBinding: [ { localElement: 'ConnectionId', element: 'Connection' },
                                                                { localElement: 'CarrierId',    element: 'AirlineId' },
                                                                { localElement: 'FlightPrice',  element: 'Price' },
                                                                { localElement: 'CurrencyCode', element: 'CurrencyCode' } ]}]
      @UI: { identification: [{position: 70 }],
             lineItem: [{position: 70, importance: #HIGH  }]}
      FlightDate,

      @UI: { identification: [{ position: 80 }],
             lineItem: [{position: 80, importance: #HIGH }]}
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,

      @Consumption.valueHelpDefinition: [{entity: { name: 'I_Currency', element: 'Currency' }}]
      CurrencyCode,

      @UI: { identification:  [{position: 90, label: 'Status' }],
             lineItem:        [{position: 90, importance: #HIGH, label: 'Status' }],
             textArrangement: #TEXT_ONLY }
      @Consumption.valueHelpDefinition: [{entity: { name: '/DMO/I_Booking_Status_VH', element: 'BookingStatus' }}]
      @ObjectModel.text.element: [ 'BookingStatusText' ]
      BookingStatus,

      _BookingStatus._Text.Text as BookingStatusText : localized,

      @UI.hidden: true
      LastChangedAt,


      /* Associations */
      _Travel       : redirected to parent ZC_TRAVEL_M_ERI,
      _bookingSuppl : redirected to composition child ZC_BOOKINGSUPP_M_ERI,

      _Carrier,
      _Connection,
      _Customer

}
