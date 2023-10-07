@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ventas'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_clnts_lib_log_5266 as select from ztb_cln_lib_5266
{
  key id_libro                    as IdLibro,
      count( distinct id_cliente) as Ventas
}
group by
  id_libro;
