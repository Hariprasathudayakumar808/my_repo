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
                            CHAR_VALUE:payload['MaterialMovementReversal']['PrOr'] as Number as String {format: "000000000000"},
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_MATERIAL',
                            CHAR_VALUE:payload['MaterialMovementReversal']['Material'] as Number as String {format: "000000000000000000"},
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_UNIT_OF_MEASURE',
                            CHAR_VALUE:payload['MaterialMovementReversal']['UoM'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR: 'PPPI_MATERIAL_CONSUMED',
                            CHAR_VALUE:payload['MaterialMovementReversal']['Quantity'] ,
                            DATA_TYPE:'NUM',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_EVENT_DATE',
                            CHAR_VALUE:payload['MaterialMovementReversal']['EventDate'] ,
                            DATA_TYPE:'DATE',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_EVENT_TIME',
                            CHAR_VALUE:payload['MaterialMovementReversal']['EventTime'] ,
                            DATA_TYPE:'TIME',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_BATCH',
                            CHAR_VALUE:payload['MaterialMovementReversal']['BatchNr'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_STORAGE_LOCATION',
                            CHAR_VALUE:payload['MaterialMovementReversal']['StorageLocation'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'ZPPPI_MOVEMENT_TYPE',
                            CHAR_VALUE: if (payload['MaterialMovementReversal']['MessageDefinitionID'] == '1')('102') 
                            else ('262'),
                            DATA_TYPE:'CHAR',
                        },
                     
                        (row:
                            {
                                PROC_MESS_ID_TMP: '000000000000000000',
                                NAME_CHAR:'PPPI_PLANT_OF_RESOURCE',
                                CHAR_VALUE:payload['MaterialMovementReversal']['Plant'] ,
                                DATA_TYPE:'CHAR',
                            })if (payload['MaterialMovementReversal']['MessageDefinitionID'] == '3'),
                     
                     row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'ZPPPI_REASON_FOR_MOVEMENT',
                            CHAR_VALUE:payload['MaterialMovementReversal']['Reason'] ,
                            DATA_TYPE:'CHAR',
                        }
                },
                PROCMESSHEADER: {
                     row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            PLANT: upper(vars.plantCode),
                            PROC_MESS_CATEGORY: if (payload['MaterialMovementReversal']['MessageDefinitionID'] == '1') ('ZI_CONR') else ('Z_MATREV'),
                            SENDER_NAME:'MULESOFT_TRAKSYS',
                        }
                }
        }
    }
}