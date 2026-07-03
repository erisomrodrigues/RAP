@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZTBL_TRAVEL_ERI'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TRAVEL_ERI
  as select from ztbl_travel_eri as Travel
  association [0..1] to /DMO/I_Agency            as _agency        on $projection.AgencyID = _agency.AgencyID
  association [0..1] to /DMO/I_Customer          as _customer      on $projection.CustomerID = _customer.CustomerID
  association [1..1] to /DMO/I_Overall_Status_VH as _overallstatus on $projection.OverallStatus = _overallstatus.OverallStatus
  association [0..1] to I_Currency               as _currency      on $projection.CurrencyCode = _currency.Currency

{
  key travel_id             as TravelID,
      agency_id             as AgencyID,
      customer_id           as CustomerID,
      begin_date            as BeginDate,
      end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      @Consumption.valueHelpDefinition: [ {
        entity.name: 'I_CurrencyStdVH',
        entity.element: 'Currency',
        useForValidation: true
      } ]
      currency_code         as CurrencyCode,
      description           as Description,
      overall_status        as OverallStatus,
      @Semantics.largeObject: { mimeType: 'MimeType',
                                fileName: 'FileName',
                                acceptableMimeTypes: ['imagem/png','image/png'],
                                contentDispositionPreference: #ATTACHMENT }
      attachment            as Attachment,
      @Semantics.mimeType: true
      mime_type             as MimeType,
      file_name             as FileName,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      //Public Association
      _agency,
      _customer,
      _overallstatus,
      _currency
}
