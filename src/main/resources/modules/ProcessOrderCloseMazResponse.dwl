%dw 2.0
output application/xml encoding = "UTF-8"
var response = payload['ZPAIMF_CLOSE_PRO']['export']['ET_LOG']['row']

---
{
	InterfaceLog: {
		log: {
			InterfaceID: response['INTERFACEID'],
			PrOrNumber: response['PRORNUMBER'],
			MESKEY: response['MESKEY'],
			MsgStatusCode: response['MSGSTATUSCODE'],
			MsgClass: response['MSGCLASS'],
			MsgNumber: response['MSGNUMBER'],
			MsgDescription: response['MSGDESCRIPTION']
		}
	}
}
