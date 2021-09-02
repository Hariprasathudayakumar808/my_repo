%dw 2.0
output application/xml encoding="UTF-8"

var mesKey = vars.mesKey

var prOrNumber = vars.prOrNumber

---
{
    InterfaceLog: {
        InterfaceLog: {
            MESKey: mesKey,
            InterfaceID: '',
            PrOrNumber:  prOrNumber,
            MsgStatusCode: payload['BAPI_PROCESS_MESSAGE_CREATEMLT']['tables']['RETURN']['row']['TYPE'],
            MsgClass: payload['BAPI_PROCESS_MESSAGE_CREATEMLT']['tables']['RETURN']['row']['ID'],
            MsgNumber: payload['BAPI_PROCESS_MESSAGE_CREATEMLT']['tables']['RETURN']['row']['NUMBER'],
            MsgDescription: payload['BAPI_PROCESS_MESSAGE_CREATEMLT']['tables']['RETURN']['row']['MESSAGE'],
            ProcessMessageNumber:  payload['BAPI_PROCESS_MESSAGE_CREATEMLT']['tables']['PROCESSMESSAGENEW']['row']['PROC_MESS_ID'],     
        }
    }
}