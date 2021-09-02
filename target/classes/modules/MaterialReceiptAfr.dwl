%dw 2.0
import * from dw::core::Strings
output application/xml encoding="UTF-8"

var delivery = payload['MaterialActualsGR']['MaterialActualGR']['DeliveryComplete']

//delivery foi alterado para validar se tem alguma informação, caso contrário ele envia o valor mapeado
//foi solicitado pelo Gerrit na dada 24/08/2020
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
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['PrOr'] as Number as String {format: "000000000000"},
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_MATERIAL',
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['Material'] as Number as String {format: "000000000000000000"},
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_UNIT_OF_MEASURE',
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['UoM'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_MATERIAL_PRODUCED',
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['Quantity'] ,
                            DATA_TYPE:'NUM',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_EVENT_DATE',
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['EventDate'] ,
                            DATA_TYPE:'DATE',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_EVENT_TIME',
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['EventTime'] ,
                            DATA_TYPE:'TIME',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_BATCH',
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['BatchNr'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_STORAGE_LOCATION',
                            CHAR_VALUE:payload['MaterialActualsGR']['MaterialActualGR']['StorageLocation'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_DELIVERY_COMPLETE',
                            CHAR_VALUE:if(isBlank(delivery))("X") else (delivery),
                            DATA_TYPE:'CHAR',
                        }
                },
                PROCMESSHEADER: {
                     row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            PLANT: upper(vars.plantCode),
                            PROC_MESS_CATEGORY: 'PI_PROD',
                            SENDER_NAME:'MULESOFT_TRAKSYS',
                        }
                }
        }
    }
}