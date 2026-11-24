---@class PlunderUIHandle
---@field Destroy fun() Releases the settings container.

---@class PlunderUI
local UI = {}

---Pages
local general = require("resources/ui/pages/general")
local traps = require("resources/ui/pages/traps")
local urns = require("resources/ui/pages/urns")
local doors = require("resources/ui/pages/doors")
local chests = require("resources/ui/pages/chests")
local sarcophagus = require("resources/ui/pages/sarcophagus")
local enemies = require("resources/ui/pages/enemies")
local cat = require("resources/ui/pages/cat")

---Populate the settings container and return its cleanup handle.
---@param settingsBox prettyui.SimpleView|prettyui.Window
---@param events PlunderEvents
---@return PlunderUIHandle
local CreateUI = function(settingsBox, events)
    local tabs = settingsBox:AddTabs(
        { "General", "Traps", "Urns", "Exits", "Chests", "Sarcophagus", "Enemies", "Cat" },
        { height = -20, heightAnchor = 1.0 }
    )

    local generalPage = tabs:GetPage(1)
    general.Create(generalPage, events)

    local trapsPage = tabs:GetPage(2)
    traps.Create(trapsPage, events)

    local urnsPage = tabs:GetPage(3)
    urns.Create(urnsPage, events)

    local exitsPage = tabs:GetPage(4)
    doors.Create(exitsPage, events)

    local chestsPage = tabs:GetPage(5)
    chests.Create(chestsPage, events)

    local sarcoPage = tabs:GetPage(6)
    sarcophagus.Create(sarcoPage, events)

    local enemiesPage = tabs:GetPage(7)
    enemies.Create(enemiesPage, events)

    local catPage = tabs:GetPage(8)
    cat.Create(catPage, events)
    

    return {
        Destroy = function()
            settingsBox:Destroy()
        end
    }
end

UI.CreateUI = CreateUI

return UI