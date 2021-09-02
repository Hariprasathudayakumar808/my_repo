%dw 2.0
output application/xml encoding="UTF-8"

var response = payload['ZXX_TRKSAP_GM_SLOC_TO_SLOC']['export']
---
{
    InterfaceLog: {
        InterfaceLog: {
            InterfaceID: "",
            MESKey: response['E_MESKEY'],
            MsgStatusCode: response['E_RET_MSG_TYP'],
            MsgClass: response['E_RET_MSG_ID'],
            MsgNumber: response['E_RET_MSG_NUM'],
            MsgDescription: response['E_RET_MSG_DESCR'],     
        }
    }
}
