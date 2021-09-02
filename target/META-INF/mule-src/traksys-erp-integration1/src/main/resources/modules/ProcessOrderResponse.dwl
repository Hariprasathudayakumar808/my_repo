%dw 2.0
output application/xml encoding="UTF-8"

var mesKey = vars.mesKey
---
{
	InterfaceLog: {
		InterfaceLog: {
			PrOrNumber: payload['ZXX_CREATE_PO_CHG_RES_MES_SAP']['export']['ORDER_NUMBER'],
			MESKey: mesKey,
			MsgStatusCode: payload['ZXX_CREATE_PO_CHG_RES_MES_SAP']['export']['RETURN_TOTAL']['TYPE'],
			MsgClass: payload['ZXX_CREATE_PO_CHG_RES_MES_SAP']['export']['RETURN_TOTAL']['ID'],
			MsgNumber: payload['ZXX_CREATE_PO_CHG_RES_MES_SAP']['export']['RETURN_TOTAL']['NUMBER'],
			MsgDescription: payload['ZXX_CREATE_PO_CHG_RES_MES_SAP']['export']['RETURN_TOTAL']['MESSAGE'],
			InterfaceID:"MF_90"
		}
	}
}