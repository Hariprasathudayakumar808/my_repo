%dw 2.0
output application/xml encoding="UTF-8"

---
{
    InterfaceLog: {
        InterfaceLog: {
            PrOrNumber: payload['ZBR_RFC_TRAKSYS_ORDER_CONFIRM']['export']['RETURN_MESSAGES']['row']['PRORNUMBER'],
            MESKey: payload['ZBR_RFC_TRAKSYS_ORDER_CONFIRM']['export']['RETURN_MESSAGES']['row']['MES_KEY'],
            ProcessMsgNumber: payload['ZBR_RFC_TRAKSYS_ORDER_CONFIRM']['export']['RETURN_MESSAGES']['row']['PROCESS_MESSAGE_NUMBER'],
            MsgStatusCode: payload['ZBR_RFC_TRAKSYS_ORDER_CONFIRM']['export']['RETURN_MESSAGES']['row']['MSG_STATUS_CODE'],
            MsgClass: payload['ZBR_RFC_TRAKSYS_ORDER_CONFIRM']['export']['RETURN_MESSAGES']['row']['MSG_CLASS'],
            MsgNumber: payload['ZBR_RFC_TRAKSYS_ORDER_CONFIRM']['export']['RETURN_MESSAGES']['row']['MSG_NUMBER'],
            MsgDescription: payload['ZBR_RFC_TRAKSYS_ORDER_CONFIRM']['export']['RETURN_MESSAGES']['row']['MSG_DESCRIPTION'],
            InterfaceID:payload['ZBR_RFC_TRAKSYS_ORDER_CONFIRM']['export']['RETURN_MESSAGES']['row']['INTERFACE_ID'],
        }
    }
}