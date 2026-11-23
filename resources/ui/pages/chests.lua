local Chests = {}
local Tracking = require("resources/ui/tracking")

function Chests.Create(page, events)
    Tracking.Create(page, events, {
        prefix = "chests", stem = "Chests", title = "Chest Highlighting",
        name = "Chest", noun = "chest", overlayTooltip = "Show chest overlay box",
        enabled = {
            { text = "Enable tracking", key = "chestsEnabled", event = "SetChestsEnabled" }
        }
    })
end

return Chests