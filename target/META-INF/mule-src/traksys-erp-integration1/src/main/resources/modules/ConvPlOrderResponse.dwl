%dw 2.0
output application/xml encoding="UTF-8"

var mesKey = vars.mesKey

---
{
	InterfaceLog: {
		InterfaceLog: {
			PrOrNumber: payload['ZBR_RFC_TRAKSYS_CONVPLORD']['export']['RETURN_MESSAGES']['row']['PRORNUMBER'],
			MESKey: mesKey,
			MsgStatusCode: payload['ZBR_RFC_TRAKSYS_CONVPLORD']['export']['RETURN_MESSAGES']['row']['MSG_STATUS_CODE'],
			MsgClass: payload['ZBR_RFC_TRAKSYS_CONVPLORD']['export']['RETURN_MESSAGES']['row']['MSG_CLASS'],
			MsgNumber: payload['ZBR_RFC_TRAKSYS_CONVPLORD']['export']['RETURN_MESSAGES']['row']['MSG_NUMBER'],
			MsgDescription: payload['ZBR_RFC_TRAKSYS_CONVPLORD']['export']['RETURN_MESSAGES']['row']['MSG_DESCRIPTION'],
			InterfaceID:"MF_90"
		}
	}
}