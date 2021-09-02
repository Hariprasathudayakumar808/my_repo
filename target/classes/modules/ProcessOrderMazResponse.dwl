%dw 2.0
output application/xml encoding="UTF-8"
var response = payload['ZPAIMF_MES_CREATE_PO']['export']['ET_LOG']['row']
---
{
	InterfaceLog: {
		InterfaceLog: {
			InterfaceID: response['INTERFACEID'],
			PrOrNumber: response['PRORNUMBER'],
			MESKey: response['MESKEY'],
			MsgStatusCode: response['MSGSTATUSCODE'],
			MsgClass: response['MSGCLASS'],
			MsgNumber: response['MSGNUMBER'],
			MsgDescription: response['MSGDESCRIPTION']
		}
	}
}
