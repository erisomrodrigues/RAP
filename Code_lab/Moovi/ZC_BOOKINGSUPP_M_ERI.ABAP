@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Booking Supplement Entit'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@UI.headerInfo: { typeName: 'Booking Supplement',
                  typeNamePlural: 'Booking Supplements',
                  title: { type: #STANDARD, label: 'Bookinh Supplement', value: 'BookingSupplementId' } }

define view entity ZC_BOOKINGSUPP_M_ERI
  as projection on ZI_BOOKINGSUPP_M_ERI
{

      @UI.facet: [{ id:       'BookingSupplement',
                    purpose:  #STANDARD,
                    type:     #IDENTIFICATION_REFERENCE,
                    position: 10,
                    label:    'Booking Supplement'  }]
      @Search.defaultSearchElement: true
  key TravelId,

      @Search.defaultSearchElement: true
  key BookingId,

      @UI:{ identification: [{ position: 10 }],
            lineItem:       [{ position: 10, importance: #HIGH }]}
  key BookingSupplementId,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Supplement', element: 'SupplementID' },
                                                     additionalBinding: [{ localElement: 'Price', element: 'Price' },
                                                                         { localElement: 'CurrencyCode', element: 'CurrencyCode' } ]}]
      @ObjectModel.text.element: [ 'SupplementDescription' ]
      @UI: { identification: [{ position: 20 }],
             lineItem: [{ position: 20, importance: #HIGH }]}
      SupplementId,
      _SupplementText.description as SupplementDescription : localized,

      @UI: { identification: [{ position: 30 }],
             lineItem:       [{ position: 30, importance: #HIGH }]}
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Curency' }}]
      CurrencyCode,

      @UI.hidden: true
      LastChangedAt,


      /* Associations */
      _travel  : redirected to ZC_TRAVEL_M_ERI,
      _booking : redirected to parent ZC_BOOKING_M_ERI,
      _SupplementText
}
