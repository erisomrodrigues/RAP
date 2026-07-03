@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText: { label: '###GENERATED Core Data Service Entity' }
//@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@ObjectModel: { sapObjectNodeType.name: 'ZTBL_TRAVEL_ERI' }

define root view entity ZC_TRAVEL_ERI
  provider contract transactional_query
  as projection on ZR_TRAVEL_ERI
  //  association [1..1] to ZR_TRAVEL_ERI as _BaseEntity on $projection.TravelID = _BaseEntity.TravelID
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
  key TravelID,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency_StdVH', element: 'AgencyID' }, useForValidation: true }]
      AgencyID,
      _agency.Name              as AgencyName,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer_StdVH', element: 'CustomerID' }, useForValidation: true }]
      CustomerID,
      _customer.LastName        as CustomerName,
      BeginDate,
      EndDate,

      @Semantics: { amount.currencyCode: 'CurrencyCode' }
      BookingFee,

      @Semantics: { amount.currencyCode: 'CurrencyCode' }
      TotalPrice,

      @Consumption: { valueHelpDefinition: [ { entity.element: 'Currency', entity.name: 'I_CurrencyStdVH', useForValidation: true } ] }
      CurrencyCode,
      Description,

      @ObjectModel.text.element: [ 'OverallStatusText' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Overall_Status_VH', element: 'OverallStatus' }, useForValidation: true }]
      OverallStatus,
      _overallstatus._Text.Text as OverallStatusText : localized, //Usado para exibir elementos de texto no idioma atual do sistema
      Attachment,
      MimeType,
      FileName,
      @Semantics: {
        user.createdBy: true
      }
      CreatedBy,
      @Semantics: {
        systemDateTime.createdAt: true
      }
      CreatedAt,
      @Semantics: {
        user.localInstanceLastChangedBy: true
      }
      LocalLastChangedBy,
      @Semantics: {
        systemDateTime.localInstanceLastChangedAt: true
      }
      LocalLastChangedAt,
      @Semantics: {
        systemDateTime.lastChangedAt: true
      }
      LastChangedAt
      //      _BaseEntity
}
