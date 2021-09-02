%dw 2.0
output application/xml

var receiving_partner = p(vars.targetErpServiceProperty default "" ++ ".receiving_partner" )
var receiving_port = p(vars.targetErpServiceProperty default "" ++ ".receiving_port" )

---
{
    ZCN_MULE_TO_SAP_GR: {
        "import": {
            PSTNG_DATE: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_HEAD_01.PSTNG_DATE as String,
            DOC_DATE: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_HEAD_01.DOC_DATE as String,
            HEADER_TXT: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_HEAD_01.HEADER_TXT,
            GM_CODE: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_CODE.GM_CODE as String            
        },
        tables: {
            ITEM:  
                row: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_ITEM_CREATE           
        }
    }
}