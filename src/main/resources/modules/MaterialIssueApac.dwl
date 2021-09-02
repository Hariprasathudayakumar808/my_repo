%dw 2.0
import * from dw::core::Strings
output application/xml encoding="UTF-8"

---
{
    ZCN_BAPI_PROCESS_MSG_CREATEMLT: {
        "tables": {
            PROCMESSCHARAC: 
                {
                    row:
                        {
                            NAME_CHAR:'PPPI_PROCESS_ORDER',
                            CHAR_VALUE:payload['MaterialActualsGI']['MaterialActualGI']['PrOr'] as Number as String {format: "000000000000"},
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_MATERIAL',
                            CHAR_VALUE:payload['MaterialActualsGI']['MaterialActualGI']['Material'] as Number as String {format: "000000000000000000"},
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_UNIT_OF_MEASURE',
                            CHAR_VALUE:payload['MaterialActualsGI']['MaterialActualGI']['UoM'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_MATERIAL_CONSUMED',
                            CHAR_VALUE:payload['MaterialActualsGI']['MaterialActualGI']['Quantity'] ,
                            DATA_TYPE:'NUM',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_EVENT_DATE',
                            CHAR_VALUE:payload['MaterialActualsGI']['MaterialActualGI']['EventDate'] ,
                            DATA_TYPE:'DATE',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_EVENT_TIME',
                            CHAR_VALUE:payload['MaterialActualsGI']['MaterialActualGI']['EventTime'] ,
                            DATA_TYPE:'TIME',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_BATCH',
                            CHAR_VALUE:payload['MaterialActualsGI']['MaterialActualGI']['BatchNr'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            NAME_CHAR:'PPPI_STORAGE_LOCATION',
                            CHAR_VALUE:payload['MaterialActualsGI']['MaterialActualGI']['StorageLocation'] ,
                            DATA_TYPE:'CHAR',
                        }
                },
                PROCMESSHEADER: {
                     row:
                        {
                            PLANT: payload['MaterialActualsGI']['MaterialActualGI']['Plant'],
                            PROC_MESS_CATEGORY: 'PI_CONS',
                            SENDER_NAME:'MES',
                        }
                },
                RETURN: {
                     row:
                        {
                            ID: 'MES_CN',
                            MESSAGE: payload['MaterialActualsGI']['MaterialActualGI']['MESKey'],
                        }
                }
        }
    }
}