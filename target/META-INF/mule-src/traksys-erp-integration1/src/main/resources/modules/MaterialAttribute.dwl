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
                            CHAR_VALUE:payload['BatchCharacteristics']['BatchCharacteristic']['PrOrNumber'] as Number as String {format: "000000000000"},
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_MATERIAL',
                            CHAR_VALUE:payload['BatchCharacteristics']['BatchCharacteristic']['Material'] as Number as String {format: "000000000000000000"},
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_BATCH_CHARAC_NAME',
                            CHAR_VALUE:payload['BatchCharacteristics']['BatchCharacteristic']['BatchCharacteristicName'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_EVENT_DATE',
                            CHAR_VALUE:payload['BatchCharacteristics']['BatchCharacteristic']['EventDate'] ,
                            DATA_TYPE:'DATE',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_EVENT_TIME',
                            CHAR_VALUE:payload['BatchCharacteristics']['BatchCharacteristic']['EventTime'] ,
                            DATA_TYPE:'TIME',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_BATCH',
                            CHAR_VALUE:payload['BatchCharacteristics']['BatchCharacteristic']['BatchNr'] ,
                            DATA_TYPE:'CHAR',
                        },
                    row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_BATCH_CHARAC_VALUE',
                            CHAR_VALUE:round(payload['BatchCharacteristics']['BatchCharacteristic']['BatchCharacteristicValue']*1000)/1000 ,
                            DATA_TYPE:'CHAR',
                        }
                },
                PROCMESSHEADER: {
                     row:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            PLANT: payload['BatchCharacteristics']['BatchCharacteristic']['Plant'],
                            PROC_MESS_CATEGORY: 'PI_BT_CL',
                            SENDER_NAME:'MULESOFT_TRAKSYS',
                        }
                }
        }
    }
}