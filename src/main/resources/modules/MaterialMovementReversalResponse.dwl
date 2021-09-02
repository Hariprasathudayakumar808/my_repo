%dw 2.0
output application/xml encoding="UTF-8"

---
{
	MMRResponse: {
		MaterialMovementReversal: {
			TransactionId: payload['ZXX_SAPERP_PO_GM_CONF_REV_RFC']['export']['E_RETURN']['row']['TRANSACTION_ID'],
			ProcessMessageNo: payload['ZXX_SAPERP_PO_GM_CONF_REV_RFC']['export']['E_RETURN']['row']['PROC_MESS_ID'],
		},
		message: {
		    MsgStatusCode: payload['ZXX_SAPERP_PO_GM_CONF_REV_RFC']['export']['E_RETURN']['row']['MSG_TYPE'],
            MsgClass: payload['ZXX_SAPERP_PO_GM_CONF_REV_RFC']['export']['E_RETURN']['row']['MSG_ID'],
            MsgNumber: payload['ZXX_SAPERP_PO_GM_CONF_REV_RFC']['export']['E_RETURN']['row']['MSG_NUMBER'],
            MsgDescription: payload['ZXX_SAPERP_PO_GM_CONF_REV_RFC']['export']['E_RETURN']['row']['MSG_MESSAGE'],
		}
	}
}