---@class PlunderChestsPage
local Chests = {}
local Tracking = require("resources/ui/tracking")

---Build this category's settings controls.
---@param page prettyui.SimpleView
---@param events PlunderEvents
---@return nil
function Chests.Create(page, events)
    Tracking.Create(page, events, {
        prefix = "chests", stem = "Chests", title = "Chest Highlighting",
        name = "Chest", noun = "chest", overlayTooltip = "Show chest overlay box",
        enabled = {
            { text = "Enable golden chest highlighting", key = "chestsEnabled", event = "SetChestsEnabled" }
        }
    })
end

return Chests