%dw 2.0
output application/xml encoding="UTF-8"

---
{
    InterfaceLog: {
        InterfaceLog: {
            MESKey:payload['ZXX_SAPERP_MF22A_PO_GI_IN_MU']['export'].E_RETURN_LOG.row.MES_KEY,
            InterfaceID:payload['ZXX_SAPERP_MF22A_PO_GI_IN_MU']['export'].E_RETURN_LOG.row.INTERFACE_ID,
            PrOrNumber: payload['ZXX_SAPERP_MF22A_PO_GI_IN_MU']['export'].E_RETURN_LOG.row.PROC_ORD_NO,
            MsgStatusCode: payload['ZXX_SAPERP_MF22A_PO_GI_IN_MU']['export'].E_RETURN_LOG.row.MSG_TYPE,
            MsgClass: payload['ZXX_SAPERP_MF22A_PO_GI_IN_MU']['export'].E_RETURN_LOG.row.MSG_ID,
            MsgNumber: payload['ZXX_SAPERP_MF22A_PO_GI_IN_MU']['export'].E_RETURN_LOG.row.MSG_NUMBER,
            MsgDescription: payload['ZXX_SAPERP_MF22A_PO_GI_IN_MU']['export'].E_RETURN_LOG.row.MSG_MESSAGE,
            ProcessMessagesNumbers:(
               ProcessMsgNumber: payload['ZXX_SAPERP_MF22A_PO_GI_IN_MU']['export'].E_RETURN_LOG.*row map(valor, index) -> (                    
                         valor.PROC_MESS_ID                    
                )
            )                         
        }
    }
}