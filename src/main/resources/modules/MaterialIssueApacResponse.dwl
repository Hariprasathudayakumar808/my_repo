%dw 2.0
output application/xml encoding="UTF-8"

---
{
    InterfaceLog: {
        InterfaceLog: {
            MESKey: (payload.ZCN_BAPI_PROCESS_MSG_CREATEMLT.tables.RETURN.*row filter (value, index) -> (value.ID == 'MES_CN'))[0].MESSAGE default '',
            InterfaceID: 'MF_22A',
            PrOrNumber:  (payload.ZCN_BAPI_PROCESS_MSG_CREATEMLT.tables.PROCMESSCHARAC.*row filter(value, index) -> (value.NAME_CHAR == 'PPPI_PROCESS_ORDER' ))[0].CHAR_VALUE,
            MsgStatusCode:  (payload.ZCN_BAPI_PROCESS_MSG_CREATEMLT.tables.RETURN.*row filter (value, index) -> (value.ID != 'MES_CN'))[0].TYPE default '',
            MsgClass:  (payload.ZCN_BAPI_PROCESS_MSG_CREATEMLT.tables.RETURN.*row filter (value, index) -> (value.ID != 'MES_CN'))[0].ID default '',
            MsgNumber:  (payload.ZCN_BAPI_PROCESS_MSG_CREATEMLT.tables.RETURN.*row filter (value, index) -> (value.ID != 'MES_CN'))[0].NUMBER default '',
            MsgDescription:   (payload.ZCN_BAPI_PROCESS_MSG_CREATEMLT.tables.RETURN.*row filter (value, index) -> (value.ID != 'MES_CN'))[0].MESSAGE default '',
            ProcessMsgNumber:  '',         
        }
    }
}