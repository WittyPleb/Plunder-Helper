---@alias PlunderEntity Loc|NPC
---@alias PlunderEntityKey string|integer
---@alias PlunderEntitySource fun(center: CoordGrid): PlunderEntity[]?
---@alias PlunderSettingValue boolean|integer

---@class PlunderTrackerSettings
---@field enabled string
---@field fontSize string
---@field textColor string
---@field showName string
---@field tileColor string
---@field showTile string
---@field showAABB string
---@field aabbColor string
---@field fillAABB string
---@field aabbIgnoreDepth string
---@field aabbFillOpacity string
---@field fillTile string
---@field tileIgnoreDepth string
---@field fullSize? string

---@class PlunderTooltipOptions
---@field parent ui.Layer
---@field text string
---@field font integer
---@field width integer
---@field height integer
---@field hidden boolean

---@class PlunderTrackerAdapter
---@field ids integer[]
---@field source? PlunderEntitySource Defaults to nearby locations.
---@field key fun(entity: PlunderEntity): PlunderEntityKey?
---@field anchor fun(entity: PlunderEntity, options: PlunderTooltipOptions): prettyui.AnchoredTooltip?
---@field tileSize fun(entity: PlunderEntity, fullSize: boolean?): integer, integer
---@field markerID string
---@field notificationEnabled? fun(): boolean
---@field notify? fun(entities: PlunderEntity[], center: CoordGrid?)

---@class PlunderAABBState
---@field minX number
---@field minY number
---@field minZ number
---@field maxX number
---@field maxY number
---@field maxZ number
---@field color integer
---@field fillColor? integer
---@field ignoreDepth boolean

---@class PlunderTrackedEntry
---@field entity PlunderEntity
---@field configID integer
---@field name string
---@field nameTooltip? prettyui.AnchoredTooltip
---@field tileGeometry? PlunderTileGeometry
---@field aabbState? PlunderAABBState
---@field aabbFill? ShapeInstance
---@field aabbOutline? ShapeInstance
---@field aabbFillSignature? string
---@field aabbOutlineSignature? string

---@class PlunderTracker
---@field adapter PlunderTrackerAdapter
---@field settings PlunderTrackerSettings
---@field tracked table<PlunderEntityKey, PlunderTrackedEntry>
---@field configIDs table<integer, boolean>

---Public setters and color getters are installed by bindCategory and bindEnabled.
---@class PlunderEvents
---@field [string] function
---@field SetTrapsTextColor fun(value: integer?)
---@field GetTrapsTextColor fun(): integer
---@field SetTrapsTileColor fun(value: integer?)
---@field GetTrapsTileColor fun(): integer
---@field SetTrapsAABBColor fun(value: integer?)
---@field GetTrapsAABBColor fun(): integer
---@field SetTrapsFontSize fun(value: integer)
---@field SetTrapsAABBFillOpacity fun(value: integer)
---@field SetTrapsTileIgnoreDepth fun(value: boolean)
---@field SetTrapsTileMarkerFullSize fun(value: boolean)
---@field SetTrapsAABBIgnoreDepth fun(value: boolean)
---@field SetShowTrapsName fun(value: boolean)
---@field SetShowTrapsTileMarker fun(value: boolean)
---@field SetShowTrapsAABB fun(value: boolean)
---@field SetFillTrapsTileMarker fun(value: boolean)
---@field SetFillTrapsAABB fun(value: boolean)
---@field SetUrnsTextColor fun(value: integer?)
---@field GetUrnsTextColor fun(): integer
---@field SetUrnsTileColor fun(value: integer?)
---@field GetUrnsTileColor fun(): integer
---@field SetUrnsAABBColor fun(value: integer?)
---@field GetUrnsAABBColor fun(): integer
---@field SetUrnsFontSize fun(value: integer)
---@field SetUrnsAABBFillOpacity fun(value: integer)
---@field SetUrnsTileIgnoreDepth fun(value: boolean)
---@field SetUrnsTileMarkerFullSize fun(value: boolean)
---@field SetUrnsAABBIgnoreDepth fun(value: boolean)
---@field SetShowUrnsName fun(value: boolean)
---@field SetShowUrnsTileMarker fun(value: boolean)
---@field SetShowUrnsAABB fun(value: boolean)
---@field SetFillUrnsTileMarker fun(value: boolean)
---@field SetFillUrnsAABB fun(value: boolean)
---@field SetDoorsTextColor fun(value: integer?)
---@field GetDoorsTextColor fun(): integer
---@field SetDoorsTileColor fun(value: integer?)
---@field GetDoorsTileColor fun(): integer
---@field SetDoorsAABBColor fun(value: integer?)
---@field GetDoorsAABBColor fun(): integer
---@field SetDoorsFontSize fun(value: integer)
---@field SetDoorsAABBFillOpacity fun(value: integer)
---@field SetDoorsTileIgnoreDepth fun(value: boolean)
---@field SetDoorsTileMarkerFullSize fun(value: boolean)
---@field SetDoorsAABBIgnoreDepth fun(value: boolean)
---@field SetShowDoorsName fun(value: boolean)
---@field SetShowDoorsTileMarker fun(value: boolean)
---@field SetShowDoorsAABB fun(value: boolean)
---@field SetFillDoorsTileMarker fun(value: boolean)
---@field SetFillDoorsAABB fun(value: boolean)
---@field SetChestsTextColor fun(value: integer?)
---@field GetChestsTextColor fun(): integer
---@field SetChestsTileColor fun(value: integer?)
---@field GetChestsTileColor fun(): integer
---@field SetChestsAABBColor fun(value: integer?)
---@field GetChestsAABBColor fun(): integer
---@field SetChestsFontSize fun(value: integer)
---@field SetChestsAABBFillOpacity fun(value: integer)
---@field SetChestsTileIgnoreDepth fun(value: boolean)
---@field SetChestsTileMarkerFullSize fun(value: boolean)
---@field SetChestsAABBIgnoreDepth fun(value: boolean)
---@field SetShowChestsName fun(value: boolean)
---@field SetShowChestsTileMarker fun(value: boolean)
---@field SetShowChestsAABB fun(value: boolean)
---@field SetFillChestsTileMarker fun(value: boolean)
---@field SetFillChestsAABB fun(value: boolean)
---@field SetSarcoTextColor fun(value: integer?)
---@field GetSarcoTextColor fun(): integer
---@field SetSarcoTileColor fun(value: integer?)
---@field GetSarcoTileColor fun(): integer
---@field SetSarcoAABBColor fun(value: integer?)
---@field GetSarcoAABBColor fun(): integer
---@field SetSarcoFontSize fun(value: integer)
---@field SetSarcoAABBFillOpacity fun(value: integer)
---@field SetSarcoTileIgnoreDepth fun(value: boolean)
---@field SetSarcoTileMarkerFullSize fun(value: boolean)
---@field SetSarcoAABBIgnoreDepth fun(value: boolean)
---@field SetShowSarcoName fun(value: boolean)
---@field SetShowSarcoTileMarker fun(value: boolean)
---@field SetShowSarcoAABB fun(value: boolean)
---@field SetFillSarcoTileMarker fun(value: boolean)
---@field SetFillSarcoAABB fun(value: boolean)
---@field SetEnemiesTextColor fun(value: integer?)
---@field GetEnemiesTextColor fun(): integer
---@field SetEnemiesTileColor fun(value: integer?)
---@field GetEnemiesTileColor fun(): integer
---@field SetEnemiesAABBColor fun(value: integer?)
---@field GetEnemiesAABBColor fun(): integer
---@field SetEnemiesFontSize fun(value: integer)
---@field SetEnemiesAABBFillOpacity fun(value: integer)
---@field SetEnemiesTileIgnoreDepth fun(value: boolean)
---@field SetEnemiesTileMarkerFullSize fun(value: boolean)
---@field SetEnemiesAABBIgnoreDepth fun(value: boolean)
---@field SetShowEnemiesName fun(value: boolean)
---@field SetShowEnemiesTileMarker fun(value: boolean)
---@field SetShowEnemiesAABB fun(value: boolean)
---@field SetFillEnemiesTileMarker fun(value: boolean)
---@field SetFillEnemiesAABB fun(value: boolean)
---@field SetCatTextColor fun(value: integer?)
---@field GetCatTextColor fun(): integer
---@field SetCatTileColor fun(value: integer?)
---@field GetCatTileColor fun(): integer
---@field SetCatAABBColor fun(value: integer?)
---@field GetCatAABBColor fun(): integer
---@field SetCatFontSize fun(value: integer)
---@field SetCatAABBFillOpacity fun(value: integer)
---@field SetCatTileIgnoreDepth fun(value: boolean)
---@field SetCatTileMarkerFullSize fun(value: boolean)
---@field SetCatAABBIgnoreDepth fun(value: boolean)
---@field SetShowCatName fun(value: boolean)
---@field SetShowCatTileMarker fun(value: boolean)
---@field SetShowCatAABB fun(value: boolean)
---@field SetFillCatTileMarker fun(value: boolean)
---@field SetFillCatAABB fun(value: boolean)
---@field SetGuardianTextColor fun(value: integer?)
---@field GetGuardianTextColor fun(): integer
---@field SetGuardianTileColor fun(value: integer?)
---@field GetGuardianTileColor fun(): integer
---@field SetGuardianAABBColor fun(value: integer?)
---@field GetGuardianAABBColor fun(): integer
---@field SetGuardianFontSize fun(value: integer)
---@field SetGuardianAABBFillOpacity fun(value: integer)
---@field SetGuardianTileIgnoreDepth fun(value: boolean)
---@field SetGuardianTileMarkerFullSize fun(value: boolean)
---@field SetGuardianAABBIgnoreDepth fun(value: boolean)
---@field SetShowGuardianName fun(value: boolean)
---@field SetShowGuardianTileMarker fun(value: boolean)
---@field SetShowGuardianAABB fun(value: boolean)
---@field SetFillGuardianTileMarker fun(value: boolean)
---@field SetFillGuardianAABB fun(value: boolean)
---@field SetTrapsEnabled fun(value: boolean)
---@field SetUrnsEnabled fun(value: boolean)
---@field SetDoorsEnabled fun(value: boolean)
---@field SetExitsEnabled fun(value: boolean)
---@field SetChestsEnabled fun(value: boolean)
---@field SetSarcoEnabled fun(value: boolean)
---@field SetEngravedEnabled fun(value: boolean)
---@field SetEnemiesEnabled fun(value: boolean)
---@field SetCatEnabled fun(value: boolean)
---@field SetGuardianEnabled fun(value: boolean)

local Events = {}
local Settings = require("resources/settings")
local ConfigIDs = require("resources/config_ids")
local TileMarker = require("resources/events/tile_marker")

local DEFAULT_TEXT_COLOR = 0xFFFFFFFF
local DEFAULT_TILE_COLOR = 0xFF0000FF
local TILE_FILL_ALPHA = 0x80
local TRACKING_RADIUS = 48 -- Tiles around the player, 48 is the render distance for NPCs
local DEFAULT_FONT_SIZE = 12

---@type integer[]
local AABB_TRIANGLES = {
  0, 2, 1,
  0, 3, 2,
  4, 5, 6,
  4, 6, 7,
  0, 1, 5,
  0, 5, 4,
  3, 7, 6,
  3, 6, 2,
  0, 4, 7,
  0, 7, 3,
  1, 2, 6,
  1, 6, 5,
  0, 1, 2,
  0, 2, 3,
  4, 6, 5,
  4, 7, 6,
  0, 5, 1,
  0, 4, 5,
  3, 6, 7,
  3, 2, 6,
  0, 7, 4,
  0, 3, 7,
  1, 6, 2,
  1, 5, 6,
}

---@type integer[]
local AABB_LINES = {
  0, 1,
  1, 2,
  2, 3,
  3, 0,
  4, 5,
  5, 6,
  6, 7,
  7, 4,
  0, 4,
  1, 5,
  2, 6,
  3, 7,
}

---@type PlunderTracker[]
local trackers = {}
---@type table<PlunderEntitySource, table<integer, PlunderTracker[]>>
local trackersByConfigID = {}
---@param center CoordGrid
---@return Loc[]?
local function nearbyLocs(center) return LocList.ByDistance(center, TRACKING_RADIUS, true) end
---@param center CoordGrid
---@return NPC[]?
local function nearbyNPCs(center) return NPCList.ByDistance(center, TRACKING_RADIUS) end
---@type (fun())?
local updateAll = nil
---@type (fun())?
local drawTileMarkers = nil
---@type ui.Layer?
local highlightLayer = nil
local runtimeSubscribed = false
---@type boolean?
local highlightsHidden = nil

---@param hex string? Hexadecimal RGBA string.
---@param default integer
---@return integer
local function parseColor(hex, default) return (hex and tonumber(hex, 16)) or default end
---@return boolean
local function isWorldMapOpen() return ui.Interfaces:GetInterface(id.Interface.WORLDMAP_V2) ~= nil end
---@param text string
---@return string
local function trim(text) return string.match(text, "^%s*(.-)%s*$") end

---@param ... unknown
---@return string?
local function firstName(...)
    for index = 1, select("#", ...) do
        local name = select(index, ...)
        if type(name) == "string" and trim(name) ~= "" then return name end
    end
end

---@param entity PlunderEntity
---@return string
local function entityName(entity)
    return firstName(entity.displayName, entity.config and entity.config.name, entity.config and entity.config.configName)
    or tostring(entity.configID)
end

---@return CoordGrid?
local function playerCoord()
    local player = PlayerList.Self()
    return player and player.isValid and player.coordGrid or nil
end

---@param entity PlunderEntity
---@param center CoordGrid?
---@return boolean
local function isNearby(entity, center)
    if not center then return false end
    local coord = entity.coordGrid
    return coord.level == center.level and math.abs(coord.x - center.x) <= TRACKING_RADIUS and math.abs(coord.z - center.z) <= TRACKING_RADIUS
end

---@return boolean hidden
local function updateHighlightVisibility()
    local hidden = isWorldMapOpen()
    if highlightsHidden == hidden then return hidden end
    highlightsHidden = hidden

    if highlightLayer then highlightLayer.hidden = hidden end

    for _, tracker in ipairs(trackers) do
        for _, entry in pairs(tracker.tracked) do
            if entry.aabbFill then entry.aabbFill.visible = not hidden end
            if entry.aabbOutline then entry.aabbOutline.visible = not hidden end
        end
    end
    
    return hidden
end

---Refresh each enabled source once and distribute entities to matching trackers.
---@return nil
local function refreshTrackers()
    local center = playerCoord()
    ---@type table<PlunderTracker, PlunderEntity[]>, table<PlunderTracker, boolean?>
    local candidates, enabled = {}, {}
    ---@type table<PlunderEntitySource, boolean>
    local enabledSources = {}
    for _, tracker in ipairs(trackers) do
        candidates[tracker] = {}
        enabled[tracker] = tracker:isEnabled() or (tracker.adapter.notificationEnabled and tracker.adapter.notificationEnabled())
        if enabled[tracker] then enabledSources[tracker.adapter.source] = true end
    end
    if center then
        for source in pairs(enabledSources) do
            local sourceTrackers = trackersByConfigID[source]
            for _, entity in ipairs(source(center) or {}) do
                local matches = entity.isValid and sourceTrackers[entity.configID]
                if matches then
                    for _, tracker in ipairs(matches) do
                        if enabled[tracker] then
                            local list = candidates[tracker]
                            list[#list + 1] = entity
                        end
                    end
                end
            end
        end
    end
    for _, tracker in ipairs(trackers) do
        tracker:refresh(candidates[tracker], center)
        if tracker.adapter.notify then tracker.adapter.notify(candidates[tracker], center) end
    end
end

---@param tracker PlunderTracker
---@param name string
---@return integer width
---@return integer height
local function textSize(tracker, name)
    local fontSize = Settings:GetInt(tracker.settings.fontSize) or DEFAULT_FONT_SIZE
    local width, height = #name * fontSize * 0.65, fontSize
    if config.Font.FromID then
        local succeeded, font = pcall(function() return config.Font.FromID(tracker:fontID()) end)
        if succeeded and font then
            local measured, textWidth = pcall(function() return font:GetStringWidth(name, false) end)
            if measured then width = textWidth end
            measured, height = pcall(function() return font:GetStringHeightAndLineCount(name, 300, font.baseline, false, false, false) end)
            if not measured then height = fontSize end
        end
    end
    return math.min(300, math.ceil(width + 24)), math.ceil(height + 20)
end

---@return ui.Layer?
local function ensureHighlightLayer()
    if highlightLayer then return highlightLayer end
    local parent = ui.Interfaces:GetComponent(id.Component.TOPLEVEL_V2__PLUGIN_BUILD_LAYER_BOTTOM)
    if not parent then log("Cannot find PlunderHelper highlight layer")
    elseif not runtimeSubscribed then
        highlightLayer = ui.Layer.new(parent)
        highlightLayer:SetSize(0, 0, 1.0, 1.0)
        highlightLayer.clickthrough = true
        highlightLayer.hidden = isWorldMapOpen()
        Event.Logic.Subscribe("tracker_update", updateAll)
        Event.Draw.Subscribe("tracker_tile_markers", drawTileMarkers)
        runtimeSubscribed = true
    end
    return highlightLayer
end

---@param adapter PlunderTrackerAdapter
---@param settings PlunderTrackerSettings
---@return PlunderTracker
local function createTracker(adapter, settings)
    adapter.source = adapter.source or nearbyLocs
    ---@type PlunderTracker
    local tracker = {
        adapter = adapter,
        settings = settings,
        tracked = {},
        configIDs = {}
    }

    ---@return nil
    function tracker:loadConfigIDs()
        self.configIDs = {}

        for _, configID in ipairs(self.adapter.ids or {}) do
            self.configIDs[configID] = true
        end
    end

    ---@return integer
    function tracker:fontID()
        local size = Settings:GetInt(self.settings.fontSize) or DEFAULT_FONT_SIZE
        return id.Font["NOTOSANS_BOLD_" .. tostring(size)] or id.Font.NOTOSANS_BOLD_12
    end

    ---@param entity PlunderEntity?
    ---@return boolean
    function tracker:isTracked(entity)
        if not entity or not entity.isValid then
            return false
        end
        return self.configIDs[entity.configID] == true
    end

    ---@param entities PlunderEntity[]? Omit to query the source around the player.
    ---@param center CoordGrid?
    ---@return nil
    function tracker:refresh(entities, center)
        if entities == nil then center = playerCoord() end

        if not self:isEnabled() or not center then
            for key in pairs(self.tracked) do
                self:destroyEntry(key)
            end

            return
        end

        entities = entities or self.adapter.source(center) or {}
        ---@type table<PlunderEntityKey, PlunderEntity>
        local visible = {}

        for _, entity in ipairs(entities) do
            if self:isTracked(entity) and isNearby(entity, center) then
                local key = self.adapter.key(entity)

                if key then
                    visible[key] = entity
                    self:start(entity, key)
                end
            end
        end

        for key in pairs(self.tracked) do
            if not visible[key] then
                self:destroyEntry(key)
            end
        end

    end

    ---@param entity PlunderEntity
    ---@param key PlunderEntityKey?
    ---@return nil
    function tracker:start(entity, key)
        if not key or not entity.isValid or not ensureHighlightLayer() then return end
        local entry = self.tracked[key]
        if entry then
            if entry.configID == entity.configID and entry.name == entityName(entity) and entry.entity.isValid then
                entry.entity = entity
                -- Refresh terrain each server tick, including same-coordinate scene reloads.
                entry.tileGeometry = nil
                if not entry.nameTooltip then entry.nameTooltip = self:createTooltip(entity) end
                return
            end
            self:destroyEntry(key)
        end
        self.tracked[key] = {
            entity = entity,
            configID = entity.configID,
            name = entityName(entity),
            nameTooltip = self:createTooltip(entity)
        }
    end

    ---@param key PlunderEntityKey
    ---@return nil
    function tracker:destroyEntry(key)
        local entry = self.tracked[key]
        if not entry then return end
        if entry.nameTooltip then entry.nameTooltip:Destroy() end
        if entry.aabbFill then entry.aabbFill:Destroy() end
        if entry.aabbOutline then entry.aabbOutline:Destroy() end
        self.tracked[key] = nil
    end

    ---@param entity PlunderEntity
    ---@return prettyui.AnchoredTooltip?
    function tracker:createTooltip(entity)
        if Settings:GetBool(self.settings.showName) ~= true then return nil end
        local parent = ensureHighlightLayer()
        if not parent then return nil end
        local name = entityName(entity)
        local width, height = textSize(self, name)
        local rgb = (self:textColor() >> 8) & 0xFFFFFF

        return self.adapter.anchor(entity, {
            parent = parent,
            text = string.format("<col=%06X>%s</col>", rgb, name),
            font = self:fontID(),
            width = width,
            height = height,
            hidden = Settings:GetBool(self.settings.showName) ~= true
        })
    end

    ---@return integer
    function tracker:textColor() return parseColor(Settings:GetString(self.settings.textColor), DEFAULT_TEXT_COLOR) end
    
    ---@param alpha integer? Alpha byte; defaults to 255.
    ---@return integer
    function tracker:tileColor(alpha)
        local color = parseColor(Settings:GetString(self.settings.tileColor), DEFAULT_TILE_COLOR)
        return (color & ~0xFF) | (alpha or 0xFF)
    end

    ---@return nil
    function tracker:drawTiles()
        if Settings:GetBool(self.settings.showTile) ~= true then return end
        local fullSize = self.settings.fullSize and Settings:GetBool(self.settings.fullSize) == true
        local outlineColor = self:tileColor()
        local fillColor = Settings:GetBool(self.settings.fillTile) == true and self:tileColor(TILE_FILL_ALPHA) or nil
        local ignoreDepth = Settings:GetBool(self.settings.tileIgnoreDepth) == true

        for _, entry in pairs(self.tracked) do
            if entry.entity and entry.entity.isValid then
                local width, depth = self.adapter.tileSize(entry.entity, fullSize)
                entry.tileGeometry = TileMarker.Draw(entry.entity, width, depth, outlineColor, fillColor, ignoreDepth, entry.tileGeometry)
            end
        end
    end
    
    ---@return integer
    function tracker:aabbColor() return parseColor(Settings:GetString(self.settings.aabbColor), DEFAULT_TILE_COLOR) end
  
    ---@return integer
    function tracker:aabbFillColor()
        local opacity = Settings:GetInt(self.settings.aabbFillOpacity) or 25
        return (self:aabbColor() & ~0xFF) | math.floor(math.max(0, math.min(100, opacity)) * 2.55 + 0.5)
    end

    ---@return boolean
    function tracker:isEnabled()
        return Settings:GetBool("enableTracking") == true and Settings:GetBool(self.settings.enabled) == true
    end

    ---@param key PlunderEntityKey
    ---@param entry PlunderTrackedEntry
    ---@return nil
    function tracker:updateAABB(key, entry)
        local entity = entry.entity
        local aabb = Settings:GetBool(self.settings.showAABB) == true and entity and entity.isValid and entity.aabb

        if not aabb then
            entry.aabbState = nil
            if entry.aabbFill then
                entry.aabbFill:Destroy()
                entry.aabbFill = nil
                entry.aabbFillSignature = nil
            end
            if entry.aabbOutline then
                entry.aabbOutline:Destroy()
                entry.aabbOutline = nil
                entry.aabbOutlineSignature = nil
            end
            return
        end

        local min, max = aabb.minimum, aabb.maximum
        local fill = Settings:GetBool(self.settings.fillAABB) == true
        local color = self:aabbColor()
        local fillColor = fill and self:aabbFillColor() or nil
        local ignoreDepth = Settings:GetBool(self.settings.aabbIgnoreDepth) == true
        local state = entry.aabbState
        if state and state.minX == min.x and state.minY == min.y and state.minZ == min.z
            and state.maxX == max.x and state.maxY == max.y and state.maxZ == max.z
            and state.color == color and state.fillColor == fillColor and state.ignoreDepth == ignoreDepth
            and entry.aabbOutline and (not fill or entry.aabbFill) then return end
        entry.aabbState = { minX = min.x, minY = min.y, minZ = min.z,
            maxX = max.x, maxY = max.y, maxZ = max.z,
            color = color, fillColor = fillColor, ignoreDepth = ignoreDepth }
        local boundsSignature = table.concat({ min.x, min.y, min.z, max.x, max.y, max.z }, ":")
        ---@return Vector3[]
        local function positions()
            return{
                Vector3.new(min.x, min.y, min.z),
                Vector3.new(max.x, min.y, min.z),
                Vector3.new(max.x, max.y, min.z),
                Vector3.new(min.x, max.y, min.z),
                Vector3.new(min.x, min.y, max.z),
                Vector3.new(max.x, min.y, max.z),
                Vector3.new(max.x, max.y, max.z),
                Vector3.new(min.x, max.y, max.z),
            }
        end

        ---@param field "aabbFill"|"aabbOutline"
        ---@param name string
        ---@param signature string
        ---@param color integer
        ---@param lineWidth number
        ---@param createData fun(): ShapeData
        ---@return nil
        local function updateShape(field, name, signature, color, lineWidth, createData)
            if not entry[field] then entry[field] = ShapeList.CreateInstance(name) end
            local shape = entry[field]
            if not shape then return end
            if entry[field .. "Signature"] ~= signature then
                shape:SetShapeData(createData())
                entry[field .. "Signature"] = signature
            end

            shape.colour = color
            shape.lineWidth = lineWidth
            shape.ignoreDepth = ignoreDepth
            shape.visible = not highlightsHidden
        end

        if fill then
            updateShape("aabbFill", self.adapter.markerID .. "aabb-fill:" .. key, boundsSignature .. ":" .. fillColor, 0xFFFFFFFF, 1, function()
                local fillData = ShapeData.new()
                fillData.positions = positions()
                fillData.rgba = { fillColor, fillColor, fillColor, fillColor, fillColor, fillColor, fillColor, fillColor }
                fillData.tris = AABB_TRIANGLES
                return fillData
            end)
        elseif entry.aabbFill then
            entry.aabbFill:Destroy()
            entry.aabbFill = nil
            entry.aabbFillSignature = nil
        end
        updateShape("aabbOutline", self.adapter.markerID .. "aabb-outline:" .. key, boundsSignature, color, 1, function()
            local outlineData = ShapeData.new()
            outlineData.positions = positions()
            outlineData.lines = AABB_LINES
            return outlineData
        end)
    end

    ---@param visibilityKnown boolean? True when visibility was already refreshed this frame.
    ---@return nil
    function tracker:updateAABBs(visibilityKnown)
        if not visibilityKnown then updateHighlightVisibility() end
        for key, entry in pairs(self.tracked) do
            self:updateAABB(key, entry)
        end
    end

    return tracker
end

---@param loc Loc
---@return string
local function locSlotKey(loc)
    local coord = loc.coordGrid
    return string.format("%d:%d:%d:%s:%s", coord.level, coord.x, coord.z, loc.shapeType, loc.rotationType)
end

---@param loc Loc
---@return string
local function locKey(loc)
    local configID = loc.isMultiLoc and loc.parentConfigID or loc.configID
    return locSlotKey(loc) .. ":" .. tostring(configID)
end

local trapsTracker = createTracker({
    ids = ConfigIDs.Traps,
    key = locKey,
    anchor = function(loc, options) return prettyui.AnchoredTooltip.forLoc(CoordGrid.new(loc.coordGrid), options) end,
    tileSize = function(entity, fullSize) return fullSize and entity.width or 1, fullSize and entity.length or 1 end,
    markerID = "traps-tracker:",
},
{
    enabled = "trapsEnabled",
    fontSize = "trapsFontSize",
    textColor = "trapsTextColor",
    showName = "showTrapsName",
    tileColor = "trapsTileColor",
    showTile = "showTrapsTileMarker",
    showAABB = "showTrapsAABB",
    aabbColor = "trapsAABBColor",
    fillAABB = "fillTrapsAABB",
    aabbIgnoreDepth = "trapsAABBIgnoreDepth",
    aabbFillOpacity = "trapsAABBFillOpacity",
    fillTile = "fillTrapsTileMarker",
    tileIgnoreDepth = "trapsTileIgnoreDepth",
    fullSize = "trapsTileMarkerFullSize"
})

local urnsTracker = createTracker({
    ids = ConfigIDs.Urns,
    key = locKey,
    anchor = function(loc, options) return prettyui.AnchoredTooltip.forLoc(CoordGrid.new(loc.coordGrid), options) end,
    tileSize = function(entity, fullSize) return fullSize and entity.width or 1, fullSize and entity.length or 1 end,
    markerID = "urns-tracker:",
},
{
    enabled = "urnsEnabled",
    fontSize = "urnsFontSize",
    textColor = "urnsTextColor",
    showName = "showUrnsName",
    tileColor = "urnsTileColor",
    showTile = "showUrnsTileMarker",
    showAABB = "showUrnsAABB",
    aabbColor = "urnsAABBColor",
    fillAABB = "fillUrnsAABB",
    aabbIgnoreDepth = "urnsAABBIgnoreDepth",
    aabbFillOpacity = "urnsAABBFillOpacity",
    fillTile = "fillUrnsTileMarker",
    tileIgnoreDepth = "urnsTileIgnoreDepth",
    fullSize = "urnsTileMarkerFullSize"
})

local doorsTracker = createTracker({
    ids = ConfigIDs.Doors,
    key = locKey,
    anchor = function(loc, options) return prettyui.AnchoredTooltip.forLoc(CoordGrid.new(loc.coordGrid), options) end,
    tileSize = function(entity, fullSize) return fullSize and entity.width or 1, fullSize and entity.length or 1 end,
    markerID = "doors-tracker:",
},
{
    enabled = "doorsEnabled",
    fontSize = "doorsFontSize",
    textColor = "doorsTextColor",
    showName = "showDoorsName",
    tileColor = "doorsTileColor",
    showTile = "showDoorsTileMarker",
    showAABB = "showDoorsAABB",
    aabbColor = "doorsAABBColor",
    fillAABB = "fillDoorsAABB",
    aabbIgnoreDepth = "doorsAABBIgnoreDepth",
    aabbFillOpacity = "doorsAABBFillOpacity",
    fillTile = "fillDoorsTileMarker",
    tileIgnoreDepth = "doorsTileIgnoreDepth",
    fullSize = "doorsTileMarkerFullSize"
})

local exitsTracker = createTracker({
    ids = ConfigIDs.Exits,
    key = locKey,
    anchor = function(loc, options) return prettyui.AnchoredTooltip.forLoc(CoordGrid.new(loc.coordGrid), options) end,
    tileSize = function(entity, fullSize) return fullSize and entity.width or 1, fullSize and entity.length or 1 end,
    markerID = "exits-tracker:",
},
{
    enabled = "exitsEnabled",
    fontSize = "doorsFontSize",
    textColor = "doorsTextColor",
    showName = "showDoorsName",
    tileColor = "doorsTileColor",
    showTile = "showDoorsTileMarker",
    showAABB = "showDoorsAABB",
    aabbColor = "doorsAABBColor",
    fillAABB = "fillDoorsAABB",
    aabbIgnoreDepth = "doorsAABBIgnoreDepth",
    aabbFillOpacity = "doorsAABBFillOpacity",
    fillTile = "fillDoorsTileMarker",
    tileIgnoreDepth = "doorsTileIgnoreDepth",
    fullSize = "doorsTileMarkerFullSize"
})

local chestsTracker = createTracker({
    ids = ConfigIDs.Chests,
    key = locKey,
    anchor = function(loc, options) return prettyui.AnchoredTooltip.forLoc(CoordGrid.new(loc.coordGrid), options) end,
    tileSize = function(entity, fullSize) return fullSize and entity.width or 1, fullSize and entity.length or 1 end,
    markerID = "chests-tracker:",
},
{
    enabled = "chestsEnabled",
    fontSize = "chestsFontSize",
    textColor = "chestsTextColor",
    showName = "showChestsName",
    tileColor = "chestsTileColor",
    showTile = "showChestsTileMarker",
    showAABB = "showChestsAABB",
    aabbColor = "chestsAABBColor",
    fillAABB = "fillChestsAABB",
    aabbIgnoreDepth = "chestsAABBIgnoreDepth",
    aabbFillOpacity = "chestsAABBFillOpacity",
    fillTile = "fillChestsTileMarker",
    tileIgnoreDepth = "chestsTileIgnoreDepth",
    fullSize = "chestsTileMarkerFullSize"
})

local sarcoTracker = createTracker({
    ids = ConfigIDs.Sarcophagus,
    key = locKey,
    anchor = function(loc, options) return prettyui.AnchoredTooltip.forLoc(CoordGrid.new(loc.coordGrid), options) end,
    tileSize = function(entity, fullSize) return fullSize and entity.width or 1, fullSize and entity.length or 1 end,
    markerID = "sarco-tracker:",
},
{
    enabled = "sarcoEnabled",
    fontSize = "sarcoFontSize",
    textColor = "sarcoTextColor",
    showName = "showSarcoName",
    tileColor = "sarcoTileColor",
    showTile = "showSarcoTileMarker",
    showAABB = "showSarcoAABB",
    aabbColor = "sarcoAABBColor",
    fillAABB = "fillSarcoAABB",
    aabbIgnoreDepth = "sarcoAABBIgnoreDepth",
    aabbFillOpacity = "sarcoAABBFillOpacity",
    fillTile = "fillSarcoTileMarker",
    tileIgnoreDepth = "sarcoTileIgnoreDepth",
    fullSize = "sarcoTileMarkerFullSize"
})

local engravedTracker = createTracker({
    ids = ConfigIDs.EngravedSarcophagus,
    key = locKey,
    anchor = function(loc, options) return prettyui.AnchoredTooltip.forLoc(CoordGrid.new(loc.coordGrid), options) end,
    tileSize = function(entity, fullSize) return fullSize and entity.width or 1, fullSize and entity.length or 1 end,
    markerID = "engraved-tracker:",
},
{
    enabled = "engravedEnabled",
    fontSize = "sarcoFontSize",
    textColor = "sarcoTextColor",
    showName = "showSarcoName",
    tileColor = "sarcoTileColor",
    showTile = "showSarcoTileMarker",
    showAABB = "showSarcoAABB",
    aabbColor = "sarcoAABBColor",
    fillAABB = "fillSarcoAABB",
    aabbIgnoreDepth = "sarcoAABBIgnoreDepth",
    aabbFillOpacity = "sarcoAABBFillOpacity",
    fillTile = "fillSarcoTileMarker",
    tileIgnoreDepth = "sarcoTileIgnoreDepth",
    fullSize = "sarcoTileMarkerFullSize"
})

local enemiesTracker = createTracker({
    ids = ConfigIDs.Enemies,
    source = nearbyNPCs,
    key = function(npc) return npc.uid end,
    anchor = function(npc, options) return prettyui.AnchoredTooltip.forNPC(npc, options) end,
    tileSize = function(npc, fullSize)
        local size = fullSize and npc.config and npc.config.gridSize or 1
        return size, size
    end,
    markerID = "enemies-tracker:",
},
{
    enabled = "enemiesEnabled",
    fontSize = "enemiesFontSize",
    textColor = "enemiesTextColor",
    showName = "showEnemiesName",
    tileColor = "enemiesTileColor",
    showTile = "showEnemiesTileMarker",
    showAABB = "showEnemiesAABB",
    aabbColor = "enemiesAABBColor",
    fillAABB = "fillEnemiesAABB",
    aabbIgnoreDepth = "enemiesAABBIgnoreDepth",
    aabbFillOpacity = "enemiesAABBFillOpacity",
    fillTile = "fillEnemiesTileMarker",
    tileIgnoreDepth = "enemiesTileIgnoreDepth",
    fullSize = "enemiesTileMarkerFullSize"
})

---@type table<integer, NPC>
local notifiedCats = {}
---@type table<prettyui.AchievementPopup, boolean>
local catPopups = {}

---@return boolean
local function catNotificationEnabled()
    return Settings:GetBool("catNotificationEnabled") == true
end

---@param entities NPC[]
---@param center CoordGrid?
---@return nil
local function notifyCats(entities, center)
    for uid, entity in pairs(notifiedCats) do
        if not entity.isValid then notifiedCats[uid] = nil end
    end
    if not catNotificationEnabled() or not center then return end

    for _, entity in ipairs(entities) do
        if entity.isValid and isNearby(entity, center) and not notifiedCats[entity.uid] then
            ---@type prettyui.AchievementPopup?
            local popup
            popup = prettyui.AchievementPopup.show({
                title = "CAT SPOTTED!",
                text = "Jennifurr has been spotted!",
                onComplete = function()
                    if popup then catPopups[popup] = nil end
                end
            })
            -- Retry next refresh if the game UI is not ready to display the popup.
            if popup then
                notifiedCats[entity.uid] = entity
                catPopups[popup] = true
            end
        end
    end
end

local catTracker = createTracker({
    ids = ConfigIDs.Cat,
    notificationEnabled = catNotificationEnabled,
    notify = notifyCats,
    source = nearbyNPCs,
    key = function(npc) return npc.uid end,
    anchor = function(npc, options) return prettyui.AnchoredTooltip.forNPC(npc, options) end,
    tileSize = function(npc, fullSize)
        local size = fullSize and npc.config and npc.config.gridSize or 1
        return size, size
    end,
    markerID = "cat-tracker:",
},
{
    enabled = "catEnabled",
    fontSize = "catFontSize",
    textColor = "catTextColor",
    showName = "showCatName",
    tileColor = "catTileColor",
    showTile = "showCatTileMarker",
    showAABB = "showCatAABB",
    aabbColor = "catAABBColor",
    fillAABB = "fillCatAABB",
    aabbIgnoreDepth = "catAABBIgnoreDepth",
    aabbFillOpacity = "catAABBFillOpacity",
    fillTile = "fillCatTileMarker",
    tileIgnoreDepth = "catTileIgnoreDepth",
    fullSize = "catTileMarkerFullSize"
})

local guardianTracker = createTracker({
    ids = ConfigIDs.Guardian,
    source = nearbyNPCs,
    key = function(npc) return npc.uid end,
    anchor = function(npc, options) return prettyui.AnchoredTooltip.forNPC(npc, options) end,
    tileSize = function(npc, fullSize)
        local size = fullSize and npc.config and npc.config.gridSize or 1
        return size, size
    end,
    markerID = "guardian-tracker:",
},
{
    enabled = "guardianEnabled",
    fontSize = "guardianFontSize",
    textColor = "guardianTextColor",
    showName = "showGuardianName",
    tileColor = "guardianTileColor",
    showTile = "showGuardianTileMarker",
    showAABB = "showGuardianAABB",
    aabbColor = "guardianAABBColor",
    fillAABB = "fillGuardianAABB",
    aabbIgnoreDepth = "guardianAABBIgnoreDepth",
    aabbFillOpacity = "guardianAABBFillOpacity",
    fillTile = "fillGuardianTileMarker",
    tileIgnoreDepth = "guardianTileIgnoreDepth",
    fullSize = "guardianTileMarkerFullSize"
})

trackers = { trapsTracker, urnsTracker, doorsTracker, exitsTracker, chestsTracker, sarcoTracker, engravedTracker, enemiesTracker, catTracker, guardianTracker }

---Update visibility and bounding boxes between server ticks.
---@return nil
updateAll = function()
    updateHighlightVisibility()

    for _, tracker in ipairs(trackers) do
        for key, entry in pairs(tracker.tracked) do
            if not entry.entity or not entry.entity.isValid then
                tracker:destroyEntry(key)
            end
        end
        tracker:updateAABBs(true)
    end
end

---@return nil
drawTileMarkers = function()
    if updateHighlightVisibility() then return end
    for _, tracker in ipairs(trackers) do
        tracker:drawTiles()
    end
end

---@param tracker PlunderTracker
---@return nil
local function refreshTrackerVisuals(tracker)
    for key, entry in pairs(tracker.tracked) do
        if not entry.entity or not entry.entity.isValid then
            tracker:destroyEntry(key)
        else
            if entry.nameTooltip then entry.nameTooltip:Destroy() end
            entry.nameTooltip = tracker:createTooltip(entry.entity)
        end
    end
end

---@param value boolean
---@return nil
Events.SetEnabled = function(value)
    Settings:SetBool("enableTracking", value)
    refreshTrackers()
end

-- Bind public event names to the tracker setting keys in one place.
---@param stem string
---@param group PlunderTracker[]
---@return nil
local function bindCategory(stem, group)
    local primary = group[1]
    local definitions = {
        { "TextColor", "textColor", "color", "text", DEFAULT_TEXT_COLOR },
        { "FontSize", "fontSize", "int", "text" },
        { "ShowName", "showName", "bool", "text" },
        { "TileColor", "tileColor", "color", nil, DEFAULT_TILE_COLOR },
        { "ShowTileMarker", "showTile", "bool" },
        { "FillTileMarker", "fillTile", "bool" },
        { "TileIgnoreDepth", "tileIgnoreDepth", "bool" },
        { "TileMarkerFullSize", "fullSize", "bool" },
        { "ShowAABB", "showAABB", "bool", "aabb" },
        { "AABBColor", "aabbColor", "color", "aabb", DEFAULT_TILE_COLOR },
        { "FillAABB", "fillAABB", "bool", "aabb" },
        { "AABBFillOpacity", "aabbFillOpacity", "int", "aabb" },
        { "AABBIgnoreDepth", "aabbIgnoreDepth", "bool", "aabb" }
    }
    for _, definition in ipairs(definitions) do
        local suffix, field, kind, refresh, fallback = table.unpack(definition, 1, 5)
        local action, remainder = suffix:match("^(Show)(.*)$")
        if not action then action, remainder = suffix:match("^(Fill)(.*)$") end
        local name = action and ("Set" .. action .. stem .. remainder) or ("Set" .. stem .. suffix)
        ---@param value PlunderSettingValue? Color setters accept nil to restore the default.
        ---@return nil
        Events[name] = function(value)
            local setting = primary.settings[field]
            if kind == "color" then
                Settings:SetString(setting, string.format("%08X", value or fallback))
            elseif kind == "int" then
                Settings:SetInt(setting, value)
            else
                Settings:SetBool(setting, value)
            end
            for _, tracker in ipairs(group) do
                if refresh == "text" then refreshTrackerVisuals(tracker)
                elseif refresh == "aabb" then tracker:updateAABBs() end
            end
        end
    end
    Events["Get" .. stem .. "TextColor"] = function() return primary:textColor() end
    Events["Get" .. stem .. "TileColor"] = function() return primary:tileColor() end
    Events["Get" .. stem .. "AABBColor"] = function() return primary:aabbColor() end
end

bindCategory("Traps", { trapsTracker })
bindCategory("Urns", { urnsTracker })
bindCategory("Doors", { doorsTracker, exitsTracker })
bindCategory("Chests", { chestsTracker })
bindCategory("Sarco", { sarcoTracker, engravedTracker })
bindCategory("Enemies", { enemiesTracker })
bindCategory("Cat", { catTracker })
bindCategory("Guardian", { guardianTracker })

---@param stem string
---@param tracker PlunderTracker
---@return nil
local function bindEnabled(stem, tracker)
    ---@param value boolean
    ---@return nil
    Events["Set" .. stem .. "Enabled"] = function(value)
        Settings:SetBool(tracker.settings.enabled, value)
        tracker:refresh()
    end
end

bindEnabled("Traps", trapsTracker)
bindEnabled("Urns", urnsTracker)
bindEnabled("Doors", doorsTracker)
bindEnabled("Exits", exitsTracker)
bindEnabled("Chests", chestsTracker)
bindEnabled("Sarco", sarcoTracker)
bindEnabled("Engraved", engravedTracker)
bindEnabled("Enemies", enemiesTracker)
bindEnabled("Cat", catTracker)
bindEnabled("Guardian", guardianTracker)

---@param value boolean
---@return nil
Events.SetCatNotificationEnabled = function(value)
    Settings:SetBool("catNotificationEnabled", value)
    refreshTrackers()
end

---Index configuration IDs and subscribe to server updates.
---@return nil
Events.SubscribeAll = function()
    trackersByConfigID = {}
    for _, tracker in ipairs(trackers) do
        tracker:loadConfigIDs()
        local source = tracker.adapter.source
        local sourceTrackers = trackersByConfigID[source] or {}
        trackersByConfigID[source] = sourceTrackers
        for configID in pairs(tracker.configIDs) do
            local matches = sourceTrackers[configID] or {}
            matches[#matches + 1] = tracker
            sourceTrackers[configID] = matches
        end
    end

    Event.ServerLogic.Subscribe("plunderHelper:refresh", refreshTrackers)
    refreshTrackers()
end

---Release all subscriptions, popups, and tracked highlights.
---@return nil
Events.UnsubscribeAll = function()
    Event.ServerLogic.Unsubscribe("plunderHelper:refresh")
    for popup in pairs(catPopups) do popup:Destroy() end
    catPopups = {}
    notifiedCats = {}

    if runtimeSubscribed then
        Event.Logic.Unsubscribe("tracker_update")
        Event.Draw.Unsubscribe("tracker_tile_markers")
        runtimeSubscribed = false
    end

    for _, tracker in ipairs(trackers) do
        for key in pairs(tracker.tracked) do
            tracker:destroyEntry(key)
        end

    end

    if highlightLayer then
        highlightLayer:Destroy()
        highlightLayer = nil
    end
    highlightsHidden = nil
end

return Events