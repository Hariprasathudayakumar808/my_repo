%dw 2.0

output application/xml encoding="UTF-8"

var meskey =  (payload.BAPI_PROCESS_MESSAGE_CREATEMLT.tables.RETURN.*row filter(value, index) -> index == 0)
var return =  (payload.BAPI_PROCESS_MESSAGE_CREATEMLT.tables.RETURN.*row filter(value, index) -> index == 1)

---

{
    InterfaceLog: {
        log: {
            MESKey: meskey.MESSAGE,
            InterfaceID: 'PO-Close',
            PrOrNumber: (payload.BAPI_PROCESS_MESSAGE_CREATEMLT.tables.PROCMESSCHARAC.*row filter(value) -> value.NAME_CHAR == 'PPPI_PROCESS_ORDER').CHAR_VALUE,
            MsgStatusCode: if (return.TYPE != null) return.TYPE else meskey.TYPE,
            MsgClass: if (return.ID != null) return.ID else meskey.ID,
            MsgNumber: if (return.NUMBER != null) return.NUMBER else meskey.NUMBER,
            MsgDescription: if (return.MESSAGE != null) return.MESSAGE else meskey.MESSAGE,
            ProcessMsgNumber: payload.BAPI_PROCESS_MESSAGE_CREATEMLT.tables.PROCESSMESSAGENEW.row.PROC_MESS_ID   
        } 
    }

}
