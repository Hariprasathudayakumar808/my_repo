%dw 2.0
import * from dw::core::Strings
output application/xml encoding="UTF-8"

---
{
    BAPI_PROCESS_MESSAGE_CREATEMLT: {
        "tables": {
            PROCMESSCHARAC: 
                {
                    row:
                        {
                            NAME_CHAR:'PPPI_PROCESS_ORDER',
                            CHAR_VALUE:payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['PrOrNumber'] as Number as String {format: "000000000000"},
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_PLANT_OF_RESOURCE',
                            CHAR_VALUE:payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['Plant'],
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_EVENT_DATE',
                            CHAR_VALUE:payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['ConfirmationDate'] ,
                            DATA_TYPE:'DATE',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_EVENT_TIME',
                            CHAR_VALUE:payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['ConfirmationTime'] ,
                            DATA_TYPE:'TIME',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_PHASE',
                            CHAR_VALUE:payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['Phase'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_STATUS_CONFIRMED',
                            CHAR_VALUE:payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['Status'] as Number as String {format: "00000"},
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_YIELD_TO_CONFIRM',
                            CHAR_VALUE:payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['Yield'] replace "," with ".",
                            DATA_TYPE:'NUM',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_CLEAR_RESERVATIONS',
                            CHAR_VALUE:payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['ClearReservations'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_UNIT_OF_MEASURE',
                            CHAR_VALUE:payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['UoM'] ,
                            DATA_TYPE:'CHAR',
                        }
                },
                PROCMESSHEADER: {
                     row:
                        {
                            PLANT: payload['ProductionOrderConfirmations']['ProductionOrderConfirmation']['Plant'],
                            PROC_MESS_CATEGORY: 'PI_PHCON',
                            SENDER_NAME:'MES',
                        }
                }
        }
    }
}