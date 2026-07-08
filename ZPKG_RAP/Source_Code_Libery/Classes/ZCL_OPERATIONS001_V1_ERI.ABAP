CLASS zcl_operations001_eri DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_operations001_eri IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    MODIFY ENTITY zi_travel_m_eri
    MODIFY ENTITIES OF Zi_travel_m_eri
     ENTITY zi_travel_m_eri
     CREATE FROM VALUE #( ( %cid = 'CID'
                            %data-BeginDate = '20260706'
                            %control-BeginDate = if_abap_behv=>mk-on ) )
     CREATE BY \_booking
     FROM VALUE #( ( %cid_ref = 'CID'
                     %target = VALUE #( ( %cid                 = 'CID'
                                          %data-BookingDate    = '20260708'
                                          %control-BookingDate = if_abap_behv=>mk-on ) ) ) )
         FAILED DATA(lt_fail)
         REPORTED DATA(lt_report)
         MAPPED DATA(lt_mapp).

    IF lt_fail IS INITIAL AND lt_report IS INITIAL.
      out->write( data = lt_fail ).
      out->write( data = lt_report ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
