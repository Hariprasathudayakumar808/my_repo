%dw 2.0
output application/xml encoding="UTF-8"

---
{
    InterfaceLog: {
        InterfaceLog: {
            MESKey: '',
            InterfaceID:'ZCN_MULE_TO_SAP_GR',
            PrOrNumber: '',
            MsgStatusCode: payload['ZCN_MULE_TO_SAP_GR']['tables']['RETURN']['row']['TYPE'],
            MsgClass: payload['ZCN_MULE_TO_SAP_GR']['tables']['RETURN']['row']['ID'],
            MsgNumber: payload['ZCN_MULE_TO_SAP_GR']['tables']['RETURN']['row']['NUMBER'],
            MsgDescription: payload['ZCN_MULE_TO_SAP_GR']['tables']['RETURN']['row']['MESSAGE'],
            ProcessMsgNumber: ''
        }
    }
}