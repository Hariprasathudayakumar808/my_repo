%dw 2.0
output application/xml encoding = "UTF-8"
---
{
	ZBR_RFC_TRAKSYS_REVERSAL: {
		"import": {
			TRANSACTION_ID: {
				row: {
					SIGN: 'I',
					OPTION: 'EQ',
					LOW: payload['MaterialMovementReversal']['TransactionId'],
					HIGH: ''
				}
			},
			PROC_MESS_ID: {
				row: {
					SIGN: 'I',
					OPTION: 'EQ',
					LOW: payload['MaterialMovementReversal']['ProcessMessageNo'],
					HIGH: ''
				}
			},
			PLANT: {
				row: {
					SIGN: 'I',
					OPTION: 'EQ',
					LOW: upper(payload['MaterialMovementReversal']['Plant']),
					HIGH: ''	
				}
			},
			
			POSTING_DATE: {
				row: {
					SIGN: 'I',
					OPTION: 'EQ',
					LOW: payload['MaterialMovementReversal']['PostingDate'],
					HIGH: ''
				}
			}
		}
	}
}