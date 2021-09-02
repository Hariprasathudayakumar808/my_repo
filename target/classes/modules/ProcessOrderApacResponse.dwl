%dw 2.0
output application/xml encoding="UTF-8"

var mesKey = vars.mesKey

---
{
	InterfaceLog: {
		InterfaceLog: {
			PrOrNumber: payload['ZCN_CREATE_PO_MES']['export']['ORDER_NUMBER'],
			MESKey: mesKey,
			MsgStatusCode: payload['ZCN_CREATE_PO_MES']['export']['RETURN_TOTAL']['TYPE'],
			MsgClass: payload['ZCN_CREATE_PO_MES']['export']['RETURN_TOTAL']['ID'],
			MsgNumber: payload['ZCN_CREATE_PO_MES']['export']['RETURN_TOTAL']['NUMBER'],
			MsgDescription: payload['ZCN_CREATE_PO_MES']['export']['RETURN_TOTAL']['MESSAGE'],
			InterfaceID:"MF_90"
		}
	}
}