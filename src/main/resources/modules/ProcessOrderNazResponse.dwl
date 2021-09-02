%dw 2.0
output application/xml encoding="UTF-8"

var mesKey = vars.mesKey
---
{
	InterfaceLog: {
		InterfaceLog: {
			PrOrNumber: payload['ZCA_CREATE_PO_CHG_RES_MES_SAP']['export']['PRORNUMBER'],
			MESKey: payload['ZCA_CREATE_PO_CHG_RES_MES_SAP']['export']['MES_KEY'],
			MsgStatusCode: payload['ZCA_CREATE_PO_CHG_RES_MES_SAP']['export']['MSGSTATUSCODE'],
			MsgClass: payload['ZCA_CREATE_PO_CHG_RES_MES_SAP']['export']['MSGCLASS'],
			MsgNumber: payload['ZCA_CREATE_PO_CHG_RES_MES_SAP']['export']['MSGNUMBER'],
			MsgDescription: payload['ZCA_CREATE_PO_CHG_RES_MES_SAP']['export']['MSGDESCRIPTION'],
			InterfaceID:payload['ZCA_CREATE_PO_CHG_RES_MES_SAP']['export']['INTERFACEID']
		}
	}
}