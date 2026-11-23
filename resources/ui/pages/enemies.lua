local Enemies = {}
local Tracking = require("resources/ui/tracking")

function Enemies.Create(page, events)
    Tracking.Create(page, events, {
        prefix = "enemies", stem = "Enemies", title = "Enemy Highlighting",
        name = "Enemy", noun = "enemy", overlayTooltip = "Show enemy overlay box",
        enabled = {
            { text = "Enable enemy tracking", key = "enemiesEnabled", event = "SetEnemiesEnabled" }
        }
    })
end

return Enemies