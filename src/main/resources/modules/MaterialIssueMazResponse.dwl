output application/xml encoding="UTF-8"

var response = payload['ZPAIMF_GOOD_ISSUE_PRO']['export']['ET_LOG']['row']
---
{
	InterfaceLog: {
		Log: {
			InterfaceID: response['INTERFACEID'],
			PrOrNumber: response['PRORNUMBER'],
			MESKey: response['MESKEY'],
			MsgStatusCode: response['MSGSTATUSCODE'],
			MsgClass:response['MSGCLASS'],
			MsgNumber:response['MSGNUMBER'],
			MsgDescription: response['MSGDESCRIPTION']
		}
	}
}
