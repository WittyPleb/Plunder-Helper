---@class PlunderUrnsPage
local Urns = {}
local Tracking = require("resources/ui/tracking")

---Build this category's settings controls.
---@param page prettyui.SimpleView
---@param events PlunderEvents
---@return nil
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