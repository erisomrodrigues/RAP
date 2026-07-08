CLASS lhc_zi_booking_m_eri DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS earlynumbering_cba_Bookingsupp FOR NUMBERING
      IMPORTING entities FOR CREATE zi_booking_m_eri\_Bookingsuppl.

ENDCLASS.

CLASS lhc_zi_booking_m_eri IMPLEMENTATION.

  METHOD earlynumbering_cba_Bookingsupp.
    DATA: max_booking_suppl_id TYPE /dmo/booking_supplement_id.

    READ ENTITIES OF zi_travel_m_eri IN LOCAL MODE
    ENTITY zi_booking_m_eri BY \_bookingSuppl
    FROM CORRESPONDING #( entities )
    LINK DATA(booking_supplements).

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_BOOKING_GROUP>) GROUP BY <fs_booking_group>-%tky.

      max_booking_suppl_id = REDUCE #( INIT max = CONV /dmo/booking_supplement_id( '0' )
                                        FOR booksuppl IN booking_supplements USING KEY entity
                                      WHERE ( source-TravelId  = <fs_booking_group>-TravelId
                                        AND   source-BookingId = <fs_booking_group>-BookingId )
                                       NEXT max = COND /dmo/booking_supplement_id( WHEN booksuppl-target-BookingSupplementId > max
                                                                                   THEN booksuppl-target-BookingSupplementId
                                                                                   ELSE max ) ).

      max_booking_suppl_id = REDUCE #( INIT max = max_booking_suppl_id
                                        FOR entity  IN entities USING KEY entity
                                        WHERE ( TravelId = <fs_booking_group>-TravelId
                                        AND BookingId = <fs_booking_group>-BookingId )
                                        FOR target IN entity-%target
                                        NEXT max = COND /dmo/booking_supplement_id( WHEN target-BookingSupplementId > max
                                                                                    THEN target-BookingSupplementId
                                                                                    ELSE max ) ).


      LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_entities_mapp>) USING KEY entity WHERE TravelId = <fs_booking_group>-TravelId
                                                                                     AND BookingId = <fs_booking_group>-BookingId.

        LOOP AT <fs_booking_group>-%target ASSIGNING FIELD-SYMBOL(<fs_booking_WO_NUMBER>).

          APPEND CORRESPONDING #( <fs_booking_wo_number> ) TO mapped-zi_bookingsupp_m_eri ASSIGNING FIELD-SYMBOL(<fs_mapped_bookingsuppl>).
          IF  <fs_booking_wo_number>-BookingSupplementId  IS INITIAL.
            max_booking_suppl_id += 1.
          ENDIF.

        ENDLOOP.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
