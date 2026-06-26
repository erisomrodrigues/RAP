@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Travel Entity'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@UI.headerInfo: { typeName: 'Travel', typeNamePlural: 'Travels', title: {type: #STANDARD, value: 'TravelID' }}

define root view entity ZC_TRAVEL_M_ERI
    provider contract transactional_query
  as projection on ZI_TRAVEL_M_ERI
{
      @Search.defaultSearchElement: true
      @UI.facet: [{id: 'Travel',  purpose: #STANDARD, type: #IDENTIFICATION_REFERENCE, label: 'Travel',  position: 10  },
                  {id: 'Booking', purpose: #STANDARD, type: #LINEITEM_REFERENCE,       label: 'Booking', position: 20, targetElement: '_booking'}]
      @UI.identification: [ { position: 10, label: 'Travel ID'  } ]
      @UI.lineItem: [{position: 10, importance: #HIGH  },
                     {type: #FOR_ACTION, dataAction: 'copyTravel', label: 'Copy Travel'}]
  key TravelId,

      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Agency',element: 'AgencyID' }}]
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Search.defaultSearchElement: true
      @UI.identification: [{position: 20 }]
      @UI.lineItem: [{position: 20, importance: #HIGH }]
      @UI.selectionField: [{position: 20 }]
      AgencyId,
      _Agency.Name              as AgencyName,

      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Customer', element: 'CustomerID' }}]
      @ObjectModel.text.element: [ 'CustomerName' ]
      @Search.defaultSearchElement: true
      @UI.identification: [{position: 30 }]
      @UI.lineItem:       [{position: 30, importance: #HIGH }]
      @UI.selectionField: [{position: 30 }]
      CustomerId,
      _Customer.LastName        as CustomerName,

      @UI.identification: [{position: 40 }]
      @UI.lineItem: [{position: 40, importance: #MEDIUM  }]
      BeginDate,
      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      @UI.identification: [{position: 42 }]
      BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      @UI.identification: [{position: 43 }]
      @UI.lineItem: [{position: 43, label: 'Total Price', importance: #MEDIUM }]
      TotalPrice,

      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      CurrencyCode,

      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Overall_Status_VH', element: 'OverllStatus' }}]
      @ObjectModel.text.element: [ 'OverallStatus' ]
      @UI.identification: [{position: 45, label: 'Status' }]
      @UI.lineItem: [{position: 50, importance: #HIGH }]
      @UI.selectionField: [{position: 40 }]
      @UI.textArrangement: #TEXT_ONLY //Ver para quer serve essa annotation 07:06
      OverallStatus,

      @UI.hidden: true
      _OverallStatus._Text.Text as OveralStatusText : localized,

      @UI.identification: [{position: 46 }]
      Description,

      @UI.hidden: true
      LastChangedAt,
      CreatedBy,
      CreatedAt,
      LastChangedBy,

      /* Associations */
      _booking : redirected to composition child ZC_BOOKING_M_ERI,

      _Agency,
      _Currency,
      _Customer,
      _OverallStatus
}
