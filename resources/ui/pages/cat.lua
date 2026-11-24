---@class PlunderCatPage
local Cat = {}
local Tracking = require("resources/ui/tracking")

---Build this category's settings controls.
---@param page prettyui.SimpleView
---@param events PlunderEvents
---@return nil
function Cat.Create(page, events)
    Tracking.Create(page, events, {
        prefix = "cat", stem = "Cat", title = "Cat Highlighting",
        name = "Cat", noun = "cat", overlayTooltip = "Show cat overlay box",
        enabled = {
            { text = "Enable cat highlighting", key = "catEnabled", event = "SetCatEnabled" },
            { text = "Enable notification", key = "catNotificationEnabled", event = "SetCatNotificationEnabled" }
        }
    })
end

return Cat
