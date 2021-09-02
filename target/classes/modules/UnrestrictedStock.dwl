%dw 2.0
output application/xml
var source = payload['UsageDecision']['UsageDecision']
---
{
	ZXX_TRKSAP_GM_UD_RFC: {
		"import": {
			I_MESKEY: source['MESKey'],
			I_PROC_MSGNUM: source['ProcessMessageNumber'],
			I_PLANT: source['Plant'],
			I_PROC_ORDNUM:source['ProcessOrderNumber'] as Number as String{format:"000000000000"},
			I_BATCH:source['Batch'],
			I_EVENTDATE:source['EventDate'],
			I_EVENTTIME:source['EventTime'],
			I_USER:source['User'],
			I_COMMENT:source['Comment']
		}
	}
}