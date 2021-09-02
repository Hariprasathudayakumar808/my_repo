%dw 2.0
output application/xml

var receiving_partner = p(vars.targetErpServiceProperty default "" ++ ".receiving_partner" )
var receiving_port = p(vars.targetErpServiceProperty default "" ++ ".receiving_port" )

---
{
    ZMBGMCR03: {
        IDOC: {
            EDI_DC40: {
                DIRECT: "2",
                IDOCTYP: "ZMBGMCR03",
                MESTYP: "ZTRANSPOST",
                SNDPOR: "TRAK_MULE",
                SNDPRT: "LS",
                SNDPRN: "TRAKSYS",
                RCVPOR: receiving_port,
                RCVPRT: "LS",
                RCVPRN: receiving_partner
            },
            E1MBGMCR @(SEGMENT: payload.ZMBGMCR03.IDOC.E1MBGMCR.@SEGMENT as String): {
                E1BP2017_GM_HEAD_01 @(SEGMENT: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_HEAD_01.@SEGMENT as String): {
                    PSTNG_DATE: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_HEAD_01.PSTNG_DATE as String,
                    DOC_DATE: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_HEAD_01.DOC_DATE as String,
                    PR_UNAME: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_HEAD_01.PR_UNAME,
                    HEADER_TXT: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_HEAD_01.HEADER_TXT,
                    REF_DOC_NO:  payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_HEAD_01.REF_DOC_NO,
                    BILL_OF_LADING: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_ITEM_CREATE.ADDITIONAL_NOTES
                },
                E1BP2017_GM_CODE @(SEGMENT: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_CODE.@SEGMENT as String): {
                    GM_CODE: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_CODE.GM_CODE as String
                },
                E1BP2017_GM_ITEM_CREATE @(SEGMENT: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_ITEM_CREATE.@SEGMENT as String): {
                    MATERIAL: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_ITEM_CREATE.MATERIAL,
                    PLANT: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_ITEM_CREATE.PLANT,
                    BATCH: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_ITEM_CREATE.BATCH,
                    STGE_LOC: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_ITEM_CREATE.STGE_LOC,
                    MOVE_TYPE: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_ITEM_CREATE.MOVE_TYPE,
                    ENTRY_QNT: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_ITEM_CREATE.ENTRY_QNT,
                    ENTRY_UOM_ISO: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_ITEM_CREATE.ENTRY_UOM_ISO,
                    PO_NUMBER: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_ITEM_CREATE.PO_NUMBER,
                    PO_ITEM: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_ITEM_CREATE.PO_ITEM,
                    MVT_IND: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_ITEM_CREATE.MVT_IND,
                    VENDRBATCH: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_ITEM_CREATE.VENDRBATCH,
                    PROD_DATE: payload.ZMBGMCR03.IDOC.E1MBGMCR.E1BP2017_GM_ITEM_CREATE.PROD_DATE as String,
                },                
                Z1REFERENCE: payload.ZMBGMCR03.IDOC.E1MBGMCR.Z1REFERENCE
            }
        }
    }
}