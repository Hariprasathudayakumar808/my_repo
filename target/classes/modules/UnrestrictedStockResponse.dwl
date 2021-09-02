%dw 2.0
output application/xml

var response = payload['ZXX_TRKSAP_GM_UD_RFC']['export']
---
{
	InterfaceLog: {
		InterfaceLog: {
			MESKEY: response['E_MESKEY'],
			ProcessMessageNumber: response['E_PROC_MSGNUM'],
			MsgStatusCode: response['E_RET_MSG_TYP'],
			MsgClass: response['E_RET_MSG_ID'],
			MsgNumber:response['E_RET_MSG_NUM'],
			MsgDescription:response['E_RET_MSG_DESCR']
		}
	}
}
