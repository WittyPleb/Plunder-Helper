log("Loading Plunder Helper...")

local uiMain = require("resources/ui/main")
local events = require("resources/events/events")

events.SubscribeAll()

---@type PlunderUIHandle|prettyui.Window|prettyui.SimpleView|nil
local activeWindow
---@type prettyui.SimpleView?
local contentView
---@type boolean?
local contentViewOpen

---Close the active settings container.
---@return nil
local function destroyUI()
    contentViewOpen = false
    if activeWindow then
        activeWindow:Destroy()
        activeWindow = nil
    end
end

---Toggle the standalone settings window.
---@return nil
local function toggleSettings()
    if contentViewOpen then
        destroyUI()
        return
    end

    destroyUI()

    local gameArea = ui.Interfaces:GetComponent(id.Component.TOPLEVEL_V2__GAME_AREA)
    local window = prettyui.Window.new(gameArea, {
        categoryID = "auto",
        title = "Plunder Helper Settings",
        resizable = true,
        width = 800,
        height = 600,
        x = 200,
        y = 100,
        onClose = destroyUI
    })

    activeWindow = window
    activeWindow = uiMain.CreateUI(window, events)
    contentViewOpen = true
end

Event.SettingsLayerReady.Subscribe("plunderHelperSettings", function(settingsLayerEvent)
    ---@cast settingsLayerEvent { component: ui.Component }
    destroyUI()

    local settingsBox = prettyui.SimpleView.new(settingsLayerEvent.component, {
        categoryID = "auto",
        width = 0,
        height = 0,
        widthAnchor = 1.0,
        heightAnchor = 1.0
    })

    activeWindow = settingsBox
    activeWindow = uiMain.CreateUI(settingsBox, events)
end)

Event.ContentLayerReady.Subscribe("plunderHelperContent", function(layerEvent)
    ---@cast layerEvent { component: ui.Component }
    if contentView then contentView:Destroy() end
    contentView = prettyui.SimpleView.new(layerEvent.component, {
        categoryID = "auto",
        width = 0,
        height = 0,
        widthAnchor = 1.0,
        heightAnchor = 1.0
    })
    contentView:AddSimpleButton("Toggle Settings", toggleSettings)
end)

---Release subscriptions and UI when the plugin is unloaded.
---@return nil
function PluginShutdown()
    Event.SettingsLayerReady.Unsubscribe("plunderHelperSettings")
    Event.ContentLayerReady.Unsubscribe("plunderHelperContent")
    events.UnsubscribeAll()
    destroyUI()

    if contentView then
        contentView:Destroy()
        contentView = nil
    end
end