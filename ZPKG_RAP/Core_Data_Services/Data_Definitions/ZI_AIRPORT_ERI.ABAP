@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds para visualização de aeroportos'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_AIRPORT_ERI
  as select from /dmo/airport
{
  key airport_id as AirportId,

      @Semantics.text: true
      name       as Name,
      city       as City,
      country    as Country
}
