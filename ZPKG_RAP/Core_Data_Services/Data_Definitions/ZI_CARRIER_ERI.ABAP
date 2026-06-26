@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds para visualização das companhias'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CARRIER_ERI
  as select from /dmo/carrier
{
  key carrier_id as carrierid,

      @Semantics.text: true --Determina a utilização para descrição
      name       as carrier_name

}
