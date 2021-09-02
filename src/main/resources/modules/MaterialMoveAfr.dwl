%dw 2.0
output application/xml
---
{
    BAPI_PROCESS_MESSAGE_CREATEMLT: {
        tables: {
            PROCMESSHEADER: {
                row: {
                    PROC_MESS_ID_TMP: '000000000000000000',
                    PLANT: payload['MaterialMovements']['MaterialMovement']['Plant'],
                    PROC_MESS_CATEGORY: 'Z_MATMOV',
                    SENDER_NAME: 'MULESOFT_TRAKSYS' 
                } 
                },
                PROCMESSCHARAC:{
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_EVENT_DATE',
                        CHAR_VALUE: payload['MaterialMovements']['MaterialMovement']['EventDate'],
                        DATA_TYPE: 'DATE'
                    },
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_EVENT_TIME',
                        CHAR_VALUE: payload['MaterialMovements']['MaterialMovement']['EventTime'],
                        DATA_TYPE: 'TIME'
                    },
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'ZPPPI_MOVEMENT_TYPE',
                        CHAR_VALUE: payload['MaterialMovements']['MaterialMovement']['MovementType'],
                        DATA_TYPE: 'CHAR'
                    },   
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_SHORT_TEXT',
                        CHAR_VALUE: payload['MaterialMovements']['MaterialMovement']['Comment'],
                        DATA_TYPE: 'CHAR'
                    },  
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_MATERIAL_CONSUMED',
                        CHAR_VALUE: payload['MaterialMovements']['MaterialMovement']['Quantity'],
                        DATA_TYPE: 'NUM'
                    },    
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_UNIT_OF_MEASURE',
                        CHAR_VALUE: payload['MaterialMovements']['MaterialMovement']['UoM'],
                        DATA_TYPE: 'CHAR'
                    }, 
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_PLANT_OF_BATCH',
                        CHAR_VALUE: payload['MaterialMovements']['MaterialMovement']['SrcPlant'],
                        DATA_TYPE: 'CHAR'
                    },
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'ZPPPI_DEST_PLANT',
                        CHAR_VALUE: payload['MaterialMovements']['MaterialMovement']['TrgPlant'],
                        DATA_TYPE: 'CHAR'
                    },    
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_MATERIAL',
                        CHAR_VALUE: payload['MaterialMovements']['MaterialMovement']['SrcMaterial'],
                        DATA_TYPE: 'CHAR'
                    }, 
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'ZPPPI_RECEIVING_MATERIAL',
                        CHAR_VALUE: payload['MaterialMovements']['MaterialMovement']['TrgMaterial'],
                        DATA_TYPE: 'CHAR'
                    },
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_BATCH',
                        CHAR_VALUE: payload['MaterialMovements']['MaterialMovement']['SrcBatchNr'],
                        DATA_TYPE: 'CHAR'
                    },   
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'PPPI_STORAGE_LOCATION',
                        CHAR_VALUE: payload['MaterialMovements']['MaterialMovement']['SrcStorageLocation'],
                        DATA_TYPE: 'CHAR'
                    },  
                    row:{
                        PROC_MESS_ID_TMP: '000000000000000000',
                        NAME_CHAR: 'ZPPPI_DEST_SLOC',
                        CHAR_VALUE: payload['MaterialMovements']['MaterialMovement']['TrgStorageLocation'],
                        DATA_TYPE: 'CHAR'
                    },        
                    
                       
                    
                    
                    
            }
        }
    }
}
