---@class PlunderEnemiesPage
local Enemies = {}
local Tracking = require("resources/ui/tracking")

---Build this category's settings controls.
---@param page prettyui.SimpleView
---@param events PlunderEvents
---@return nil
function Enemies.Create(page, events)
    Tracking.Create(page, events, {
        prefix = "enemies", stem = "Enemies", title = "Enemy Highlighting",
        name = "Enemy", noun = "enemy", overlayTooltip = "Show enemy overlay box",
        enabled = {
            { text = "Enable enemy highlighting", key = "enemiesEnabled", event = "SetEnemiesEnabled" }
        }
    })
end

return Enemies