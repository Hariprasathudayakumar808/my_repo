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
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_PROCESS_ORDER',
                            CHAR_VALUE:payload['MaterialMovementCC']['MaterialMovementCC']['PrOr'] as Number as String {format: "000000000000"},
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_MATERIAL',
                            CHAR_VALUE:payload['MaterialMovementCC']['MaterialMovementCC']['Material'] as Number as String {format: "000000000000000000"},
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_UNIT_OF_MEASURE',
                            CHAR_VALUE:payload['MaterialMovementCC']['MaterialMovementCC']['UoM'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_MATERIAL_CONSUMED',
                            CHAR_VALUE:payload['MaterialMovementCC']['MaterialMovementCC']['Quantity'] ,
                            DATA_TYPE:'NUM',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_EVENT_DATE',
                            CHAR_VALUE:payload['MaterialMovementCC']['MaterialMovementCC']['EventDate'] ,
                            DATA_TYPE:'DATE',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_EVENT_TIME',
                            CHAR_VALUE:payload['MaterialMovementCC']['MaterialMovementCC']['EventTime'] ,
                            DATA_TYPE:'TIME',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_BATCH',
                            CHAR_VALUE:payload['MaterialMovementCC']['MaterialMovementCC']['BatchNr'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_STORAGE_LOCATION',
                            CHAR_VALUE:payload['MaterialMovementCC']['MaterialMovementCC']['StorageLocation'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_OPERATION',
                            CHAR_VALUE:payload['MaterialMovementCC']['MaterialMovementCC']['Operation'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_PHASE',
                            CHAR_VALUE:payload['MaterialMovementCC']['MaterialMovementCC']['Phase'] ,
                            DATA_TYPE:'CHAR',
                        }
                },
                PROCMESSHEADER: {
                     row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            PLANT: payload['MaterialMovementCC']['MaterialMovementCC']['Plant'],
                            PROC_MESS_CATEGORY: 'ZI_CONS',
                            SENDER_NAME:'MULESOFT_TRAKSYS',
                        }
                }
        }
    }
}