local Tracking = {}
local Settings = require("resources/settings")
local Colors = require("resources/ui/colors")

function Tracking.Create(page, events, options)
    local prefix, stem = options.prefix, options.stem
    local function key(suffix) return prefix .. suffix end
    local function show(suffix) return "show" .. stem .. suffix end
    local function fill(suffix) return "fill" .. stem .. suffix end
    local function setter(suffix) return events["Set" .. stem .. suffix] end
    local function toggle(text, tooltip, setting, callback)
        return {
            choice = {
                text = text,
                tooltip = tooltip,
                value = setting,
                selected = Settings:GetBool(setting) == true
            },
            onChange = function(_, _, _, selected) callback(selected) end
        }
    end

    local function slider(label, setting, fallback, minimum, maximum, callback)
        page:AddText(label)
        page:AddSlider({ min = minimum, max = maximum, value = Settings:GetInt(setting) or fallback, onChange = function(_, value) callback(value) end })
    end

    page:AddTitle(options.title)

    for _, enabled in ipairs(options.enabled) do
        page:AddCheckboxButton({
            {
                text = enabled.text, value = enabled.key,
                selected = Settings:GetBool(enabled.key) == true
            }
        },
            {
                onChange = function(_, _, _, selected) events[enabled.event](selected) end
            })
    end

    slider("Font Size", key("FontSize"), 12, 10, 50, setter("FontSize"))

    local definitions = {
        {
            label = "Text",
            suffix = "TextColor",
            noun = "text",
            visibility = "Name",
            tooltip = "Choose " .. options.noun .. " text colour", showTooltip = "Show text"
        },
        {
            label = "Tile",
            suffix = "TileColor",
            noun = "tile",
            visibility = "TileMarker",
            tooltip = "Choose " .. options.noun .. " tile color",
            showTooltip = "Show tile marker",
            extraToggles = {
                toggle("Fill", "Fill tile marker", fill("TileMarker"),
                events["SetFill" .. stem .. "TileMarker"]),
                toggle("Ignore Depth", "Show " .. options.noun .. " tile markers through scene geometry",
                key("TileIgnoreDepth"),
                setter("TileIgnoreDepth")),
                toggle("Full Size", "Mark entire object size",
                key("TileMarkerFullSize"),
                setter("TileMarkerFullSize"))
            }
        },
        {
            label = "Overlay",
            suffix = "AABBColor",
            noun = "overlay box",
            visibility = "AABB",
            tooltip = "Choose " .. options.noun .. " overlay box color", showTooltip = options.overlayTooltip,
            extraToggles = {
                toggle("Fill", "Fill tile marker",
                fill("AABB"),
                events["SetFill" .. stem .. "AABB"]),
                toggle("Ignore Depth", "Show " .. options.noun .. " overlay boxes through scene geometry",
                key("AABBIgnoreDepth"),
                setter("AABBIgnoreDepth"))
            }
        }
    }

    local colors = {}

    for _, definition in ipairs(definitions) do
        local onChange = setter(definition.suffix)
        local onToggle = events["SetShow" .. stem .. definition.visibility]
        colors[#colors + 1] = {
            label = definition.label,
            value = events["Get" .. stem .. definition.suffix](),
            windowTitle = options.name .. " " .. definition.noun .. " color",
            tooltip = definition.tooltip,
            onChange = function(_, color) onChange(color) end,
            toggle = {
                text = "Show",
                tooltip = definition.showTooltip,
                value = show(definition.visibility),
                selected = Settings:GetBool(show(definition.visibility)) == true
            },
            onToggle = function(_, _, _, selected) onToggle(selected) end,
            extraToggles = definition.extraToggles
        }
    end

    Colors.Create(page, colors)
    slider("Overlay box fill opacity", key("AABBFillOpacity"), 25, 0, 100, setter("AABBFillOpacity"))
end

return Tracking
