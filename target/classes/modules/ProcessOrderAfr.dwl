%dw 2.0
output application/xml
---
{
    BAPI_PROCESS_MESSAGE_CREATEMLT: {
        tables: {
            PROCMESSHEADER: {
                row: {
                    PROC_MESS_ID_TMP: '000000000000000000',
                    PLANT: payload['ProductionOrderRequests']['ProductionOrderRequest']['Plant'],
                    PROC_MESS_CATEGORY: 'Z_PCRT',
                    SENDER_NAME: 'MULESOFT_TRAKSYS' 
                } 
                },
                PROCMESSCHARAC:{
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'ZPPPI_PL_ORD',
                        CHAR_VALUE: 'U' ++ payload['ProductionOrderRequests']['ProductionOrderRequest']['MESKey'],
                        DATA_TYPE: 'CHAR'
                    },
                    row: {
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'ZPPPI_EQMS_LOT',
                        CHAR_VALUE: payload['ProductionOrderRequests']['ProductionOrderRequest']['MESKey'],
                        DATA_TYPE: 'CHAR' 
                    },
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_MATERIAL',
                        CHAR_VALUE: payload['ProductionOrderRequests']['ProductionOrderRequest']['Material'],
                        DATA_TYPE: 'CHAR' 
                    },
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_RESOURCE',
                        CHAR_VALUE: payload['ProductionOrderRequests']['ProductionOrderRequest']['Resource'],
                        DATA_TYPE: 'CHAR'
                    
                    },
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_PLANT_OF_RESOURCE',
                        CHAR_VALUE: payload['ProductionOrderRequests']['ProductionOrderRequest']['Plant'],
                        DATA_TYPE: 'CHAR'
                    
                    },
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'ZPPPI_ORDERTYPE',
                        CHAR_VALUE: payload['ProductionOrderRequests']['ProductionOrderRequest']['OrderType'],
                        DATA_TYPE: 'CHAR'
                    
                    },
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_START_DATE',
                        CHAR_VALUE: payload['ProductionOrderRequests']['ProductionOrderRequest']['StartDate'],
                        DATA_TYPE: 'DATE'
                    
                    },
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_END_DATE',
                        CHAR_VALUE: payload['ProductionOrderRequests']['ProductionOrderRequest']['EndDate'],
                        DATA_TYPE: 'DATE'
                    
                    },
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_ORDER_QUANTITY',
                        CHAR_VALUE: payload['ProductionOrderRequests']['ProductionOrderRequest']['TotalOrderQty'],
                        DATA_TYPE: 'NUM'
                    
                    },
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_UNIT_OF_MEASURE',
                        CHAR_VALUE: payload['ProductionOrderRequests']['ProductionOrderRequest']['UoM'],
                        DATA_TYPE: 'CHAR'                    
                }            
            }
        }
    }
}
