%dw 2.0
import * from dw::core::Strings
output application/xml encoding="UTF-8"

---
{
    BAPI_PROCESS_MESSAGE_CREATEMLT: {
        "tables": {
            PROCMESSCHARAC: 
                {
                    item1:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_PROCESS_ORDER',
                            CHAR_VALUE:payload['ControlRecipeStatusChange']['PrOrNumber'] as Number as String {format: "000120086820"},
                            DATA_TYPE:'CHAR',
                        },
                    item2:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_EVENT_DATE',
                            CHAR_VALUE:payload['ControlRecipeStatusChange']['ChangeDate'],
                            DATA_TYPE:'DATE',
                        },
                    item3:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_EVENT_TIME',
                            CHAR_VALUE:payload['ControlRecipeStatusChange']['ChangeTime'],
                            DATA_TYPE:'TIME',
                        },
                    item4:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_CONTROL_RECIPE',
                            CHAR_VALUE:payload['ControlRecipeStatusChange']['ControlRecipeNr'],
                            DATA_TYPE:'CHAR',
                        },
                    item5:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            NAME_CHAR:'PPPI_CONTROL_RECIPE_STATUS',
                            CHAR_VALUE:payload['ControlRecipeStatusChange']['ControlRecipeStatus'],
                            DATA_TYPE:'CHAR',
                        },
                  },
                                  
                PROCMESSHEADER: {
                     item:
                        {
                            PROC_MESS_ID_TMP: '000000000000000000',
                            PLANT: payload['ControlRecipeStatusChange']['Plant'],
                            PROC_MESS_CATEGORY: 'PI_CRST',
                            TEST_FLAG: "",                           
                            SENDER_NAME:'MULESOFT_TRAKSYS',
                        }
                }
        
		}
	}
}