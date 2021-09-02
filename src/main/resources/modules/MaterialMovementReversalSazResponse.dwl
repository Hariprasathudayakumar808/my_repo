%dw 2.0
output application/xml encoding="UTF-8"

---
{
    InterfaceLog: {
        InterfaceLog: {
            //InterfaceID:payload['ZBR_RFC_TRAKSYS_REVERSAL']['export']['RETURN_MESSAGES']['row']['INTERFACE_ID'],
           	TransactionId: payload['ZBR_RFC_TRAKSYS_REVERSAL']['export']['RETURN_MESSAGES']['row']['TRANSACTION_ID'],
            ProcessMessageNo: payload['ZBR_RFC_TRAKSYS_REVERSAL']['export']['RETURN_MESSAGES']['row']['PROC_MESS_ID'],
            MsgStatusCode: payload['ZBR_RFC_TRAKSYS_REVERSAL']['export']['RETURN_MESSAGES']['row']['MSG_STATUS_CODE'],
            MsgClass: payload['ZBR_RFC_TRAKSYS_REVERSAL']['export']['RETURN_MESSAGES']['row']['MSG_CLASS'],
            MsgNumber: payload['ZBR_RFC_TRAKSYS_REVERSAL']['export']['RETURN_MESSAGES']['row']['MSG_NUMBER'],
            MsgDescription: payload['ZBR_RFC_TRAKSYS_REVERSAL']['export']['RETURN_MESSAGES']['row']['MSG_DESCRIPTION'],
        }
    }
}