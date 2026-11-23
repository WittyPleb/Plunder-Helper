local GeneralPage = {}

local Settings = require("resources/settings")
local Tracking = require("resources/ui/tracking")

function GeneralPage.Create(page, events)
    page:AddTitle("Highlights")
    page:AddCheckboxButton({
        { text = "Enable highlights (global setting)", value = "enableTracking", selected = Settings:GetBool("enableTracking") == true }
    }, {
        onChange = function(_, _, _, selected) events.SetEnabled(selected) end
    })
    page:AddText("Enable highlights globally. Turning this setting off will ignore all settings and disable all highlighting.")

    Tracking.Create(page, events, {
        prefix = "guardian", stem = "Guardian", title = "Guardian mummy",
        name = "Guardian mummy", noun = "guardian mummy", overlayTooltip = "Show guardian mummy overlay box",
        enabled = {
            { text = "Highlight Guardian mummy", key = "guardianEnabled", event = "SetGuardianEnabled" }
        }
    })
end

return GeneralPage
