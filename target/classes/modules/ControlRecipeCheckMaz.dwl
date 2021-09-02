%dw 2.0
output application/xml encoding = "UTF-8"
var results = vars.aggregateResults
---
{
	ZPAIMF_DOWNLOAD_CR: {
		"import": {
			PRORNUMBER: results map{
				row: {
					AUFNR: $
				}
			}
		}
	}
}