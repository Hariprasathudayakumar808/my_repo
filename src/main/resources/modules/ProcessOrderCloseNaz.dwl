%dw 2.0
output application/xml encoding="UTF-8"

---
{
    BAPI_PROCESS_MESSAGE_CREATEMLT: {        
        "tables": {
            "PROCMESSCHARAC":{ 
                 "row":{
                     "NAME_CHAR": "PPPI_PROCESS_ORDER",
                     "CHAR_VALUE":payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']['PrOrNumber'] as Number as String {format: '000000000000'},
                     "DATA_TYPE": "CHAR"                 
                 },
                 "row":{
                     "NAME_CHAR": "PPPI_EVENT_DATE",
                     "CHAR_VALUE": payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']['ChangeDate'],
                     "DATA_TYPE": "DATE"                 
                 },
                 "row":{
                     "NAME_CHAR": "PPPI_EVENT_TIME",
                     "CHAR_VALUE": payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']['ChangeTime'],
                     "DATA_TYPE": "TIME"                 
                 },
                 "row":{
                     "NAME_CHAR": "PPPI_CONTROL_RECIPE",
                     "CHAR_VALUE": payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']['ControlRecipeNr'],
                     "DATA_TYPE": "CHAR"                 
                 },
                 "row":{
                     "NAME_CHAR": "PPPI_CONTROL_RECIPE_STATUS",
                     "CHAR_VALUE": payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']['ControlRecipeStatus'],
                     "DATA_TYPE": "CHAR"                 
                 }               
             },
             "PROCMESSHEADER":{
                 "row":{
                     "PLANT": payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']['Plant'],
                     "PROC_MESS_CATEGORY":"PI_CRST",
                     "SENDER_NAME": "MES"                 
                 },
             },
             "RETURN":{
                 "row":{
                     "ID":"MES",
                     "MESSAGE": payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']['MESKey']
                 }
             }    
        }
    }
}