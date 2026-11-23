local Cat = {}
local Tracking = require("resources/ui/tracking")

function Cat.Create(page, events)
    Tracking.Create(page, events, {
        prefix = "cat", stem = "Cat", title = "Cat Highlighting",
        name = "Cat", noun = "cat", overlayTooltip = "Show cat overlay box",
        enabled = {
            { text = "Enable cat tracking", key = "catEnabled", event = "SetCatEnabled" },
            { text = "Enable notification", key = "catNotificationEnabled", event = "SetCatNotificationEnabled" }
        }
    })
end

return Cat
