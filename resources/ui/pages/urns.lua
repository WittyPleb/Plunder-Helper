local Urns = {}
local Tracking = require("resources/ui/tracking")

function Urns.Create(page, events)
    Tracking.Create(page, events, {
        prefix = "urns", stem = "Urns", title = "Urn Highlighting",
        name = "Urn", noun = "urn", overlayTooltip = "Show urn overlay box",
        enabled = {
            { text = "Enable urn highlighting", key = "urnsEnabled", event = "SetUrnsEnabled" }
        }
    })
end

return Urns