%dw 2.0
output application/xml encoding="UTF-8"

---
{
    ZXX_SAPERP_MF22C_CR_STS_IN_MU: {
        "import": {
             I_MESS_KEY: payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']['MESKey'],
             I_PROCESS_ORD: payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']['PrOrNumber'] as Number as String {format: '000000000000'},
             I_PLANT: payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']['Plant'],
             I_EVENT_DATE: payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']['ChangeDate'],
             I_EVENT_TIME: payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']['ChangeTime'],
             I_CONTROL_RECIPE: payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']['ControlRecipeNr'],
             I_CONTROL_RECIPE_STU: payload['ControlRecipeStatusChanges']['ControlRecipeStatusChange']['ControlRecipeStatus'],
             I_SENDER_NAME: 'MULESOFT_TRAKSYS'
        }
    }
}