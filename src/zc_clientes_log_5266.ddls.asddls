@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_clientes_log_5266 as select from ztb_client_5266 as Clientes
    inner join   ztb_cln_lib_5266 as ClientesLib on Clientes.id_cliente = ClientesLib.id_cliente
{
  key ClientesLib.id_libro                                      as IdLibro,
  key Clientes.id_cliente                                       as IdCliente,
  key Clientes.tipo_acceso                                      as Acceso,
      Clientes.nombre                                           as Nombre,
      Clientes.apellidos                                        as Apellidos,
      Clientes.email                                            as Email,
      Clientes.url                                              as Imagen,
      concat_with_space(Clientes.nombre, Clientes.apellidos, 1) as NombreCompleto
}
