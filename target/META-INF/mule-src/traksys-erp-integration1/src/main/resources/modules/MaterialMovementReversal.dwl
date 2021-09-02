%dw 2.0
output application/xml encoding="UTF-8"

---
{
    ZXX_SAPERP_PO_GM_CONF_REV_RFC: {
        "import": {
            I_TRANSACTION_ID: payload['MaterialMovementReversal']['TransactionId'],
            I_PROC_MESS_ID: payload['MaterialMovementReversal']['ProcessMessageNo'],
            I_PLANT: payload['MaterialMovementReversal']['Plant'],
            I_POSTING_DATE: payload['MaterialMovementReversal']['PostingDate'] as Date {format: 'yyyy-MM-dd'} as String {format: 'yyyyMMdd'}   
        }
    }
}