@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CARRIER_ERI
  as select from /dmo/carrier
{
  key carrier_id as CarrierID,
      @Semantics.text: true
      name       as Name

}
