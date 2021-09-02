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
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['PrOr'] as Number as String {format: "000000000000"},
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_MATERIAL',
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['Material'] as Number as String {format: "000000000000000000"},
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_UNIT_OF_MEASURE',
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['UoM'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_MATERIAL_CONSUMED',
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['Quantity'] ,
                            DATA_TYPE:'NUM',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_EVENT_DATE',
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['EventDate'] ,
                            DATA_TYPE:'DATE',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_EVENT_TIME',
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['EventTime'] ,
                            DATA_TYPE:'TIME',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_BATCH',
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['BatchNr'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_STORAGE_LOCATION',
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['StorageLocation'] ,
                            DATA_TYPE:'CHAR',
                        }
                },
                PROCMESSHEADER: {
                     row:
                        {
                            PLANT: upper(vars.plantCode),
                            PROC_MESS_CATEGORY: 'PI_PROD',
                            SENDER_NAME:'MES',
                        }
                }
        }
    }
}