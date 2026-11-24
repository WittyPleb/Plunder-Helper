local Traps = {}
local Tracking = require("resources/ui/tracking")

function Traps.Create(page, events)
    Tracking.Create(page, events, {
        prefix = "traps", stem = "Traps", title = "Spear Trap Highlighting",
        name = "Trap", noun = "trap", overlayTooltip = "Show traps overlay box",
        enabled = {
            { text = "Enable spear trap highlighting", key = "trapsEnabled", event = "SetTrapsEnabled" }
        }
    })
end

return Traps