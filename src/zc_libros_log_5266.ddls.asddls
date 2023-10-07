@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_libros_log_5266 
    as select from ztb_libros_5266 as libros
    inner join      ztb_catego_5266     as Categoria on libros.bi_categ = Categoria.bi_categ
    left outer join ZC_clnts_lib_log_5266 as Ventas    on libros.id_libro = Ventas.IdLibro
  association [0..*] to ZC_clientes_log_5266 as _Clientes on $projection.IdLibros = _Clientes.IdLibro
{
  key libros.id_libro       as IdLibros,
      libros.titulo         as Titulo,
      libros.bi_categ       as Categoria,
      libros.autor          as Autor,
      libros.editorial      as Editorial,
      libros.idioma         as Idioma,
      libros.paginas        as Paginas,
      @Semantics.amount.currencyCode: 'Moneda'
      libros.precio         as Precio,
      case
         when Ventas.Ventas < 1 then 0
         when Ventas.Ventas = 1 then 1
         when Ventas.Ventas = 2 then 2
        else 3
      end                   as Ventas,
      case Ventas.Ventas
        when 0 then ''
        else ''
      end                   as Text,
      libros.moneda         as Moneda,
      libros.formato        as Formato,
      Categoria.descripcion as Descripcion,
      libros.url            as Imagen,
      _Clientes
}
