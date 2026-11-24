---@class PlunderSarcophagusPage
local Sarcophagus = {}
local Tracking = require("resources/ui/tracking")

---Build this category's settings controls.
---@param page prettyui.SimpleView
---@param events PlunderEvents
---@return nil
function Sarcophagus.Create(page, events)
    Tracking.Create(page, events, {
        prefix = "sarco", stem = "Sarco", title = "Sarcophagus Highlighting",
        name = "Sarcophagus", noun = "sarcophagus", overlayTooltip = "Show sarcophagus overlay box",
        enabled = {
            { text = "Enable sarcophagus highlighting", key = "sarcoEnabled", event = "SetSarcoEnabled" },
            { text = "Enable engraved sarcophagus highlighting", key = "engravedEnabled", event = "SetEngravedEnabled" }
        }
    })
end

return Sarcophagus