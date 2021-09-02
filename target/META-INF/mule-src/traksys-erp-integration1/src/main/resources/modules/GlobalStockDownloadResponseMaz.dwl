%dw 2.0
output application/xml encoding="UTF-8"

var mesKey = vars.mesKey

var prOrNumber = vars.prOrNumber

---
{
    InterfaceLog: {
        InterfaceLog: {
        	InterfaceID: '',
            MESKey: payload['ControlRecipeStatusChanges']['MESKey'],
            PrOrNumber: payload['ControlRecipeStatusChanges']['PrOrNumber'],
            MsgStatusCode: payload['BAPI_PROCESS_MESSAGE_CREATEMLT']['TABLES']['RETURN']['item']['TYPE'],
            MsgClass: payload['BAPI_PROCESS_MESSAGE_CREATEMLT']['TABLES']['RETURN']['item']['ID'],
            MsgNumber: payload['BAPI_PROCESS_MESSAGE_CREATEMLT']['TABLES']['RETURN']['item']['NUMBER'],
            MsgDescription: payload['BAPI_PROCESS_MESSAGE_CREATEMLT']['TABLES']['RETURN']['item']['MESSAGE'],
            ProcessMessageNumber:  payload['BAPI_PROCESS_MESSAGE_CREATEMLT']['TABLES']['PROCMESSHEADERRETURN']['item']['PROC_MESS_ID_TMP'],     
        }
    }
}