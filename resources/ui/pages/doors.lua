---@class PlunderDoorsPage
local Doors = {}
local Tracking = require("resources/ui/tracking")

---Build this category's settings controls.
---@param page prettyui.SimpleView
---@param events PlunderEvents
---@return nil
function Doors.Create(page, events)
    Tracking.Create(page, events, {
        prefix = "doors", stem = "Doors", title = "Door Highlighting",
        name = "Door", noun = "door", overlayTooltip = "Show door overlay box",
        enabled = {
            { text = "Enable door highlighting", key = "doorsEnabled", event = "SetDoorsEnabled" },
            { text = "Enable exit highlighting", key = "exitsEnabled", event = "SetExitsEnabled" }
        }
    })
end

return Doors