CLASS zcl_operations_eri DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_operations_eri IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    READ ENTITY zi_travel_m_eri
*    ALL FIELDS WITH VALUE #( ( %key-TravelId = '00000004'  ) )
     FROM VALUE #( (  %key-TravelId = '00000004'
                      %control      = VALUE #( AgencyId   = if_abap_behv=>mk-on
                                               CustomerId = if_abap_behv=>mk-on ) ) )

    RESULT DATA(lt_travel)
    FAILED DATA(lt_fail)
    REPORTED DATA(lt_report).

    out->write( data = lt_travel ).

    IF lt_fail IS NOT INITIAL AND lt_report IS NOT INITIAL.
      out->write( data = lt_fail ).
      out->write( data = lt_report ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
