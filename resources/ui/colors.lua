---@class PlunderToggleChoice
---@field text string
---@field tooltip? string
---@field value string Persistent setting key.
---@field selected boolean

---@alias PlunderToggleCallback fun(control: unknown, index: integer, value: string, selected: boolean)

---@class PlunderExtraToggle
---@field choice PlunderToggleChoice
---@field onChange PlunderToggleCallback

---@class PlunderColorSetting
---@field label string
---@field value integer Packed RGBA color.
---@field windowTitle string
---@field tooltip string
---@field onChange fun(control: unknown, color: integer)
---@field toggle PlunderToggleChoice
---@field onToggle PlunderToggleCallback
---@field extraToggles? PlunderExtraToggle[]

---@class PlunderColors
local Colors = {}

---Build aligned color pickers and their visibility controls.
---@param page prettyui.SimpleView
---@param colors PlunderColorSetting[]
---@return nil
function Colors.Create(page, colors)
    local columnWidth = 140
    local columnGap = 8
    local buttonSize = 28

    page:AddTitle("Colors and Highlights")

    for index, setting in ipairs(colors) do
        page:AddText({ text = setting.label, width = columnWidth, height = 24, columnGap = columnGap, inline = index > 1 })
    end

    for index, setting in ipairs(colors) do
        page:AddColourPicker({
            value = setting.value,
            buttonSize = buttonSize,
            columnGap = columnWidth - buttonSize + columnGap,
            inline = index > 1,
            windowTitle = setting.windowTitle,
            tooltip = setting.tooltip,
            onChange = setting.onChange
        })
    end

    ---@type number[]
    local columnPositions = {}
    local extraRows = 0

    for index, setting in ipairs(colors) do
        local checkbox = page:AddCheckboxButton({ setting.toggle }, {
            width = columnWidth,
            columnGap = columnGap,
            inline = index > 1,
            onChange = setting.onToggle
        })
        columnPositions[index] = checkbox.root.x
        extraRows = math.max(extraRows, #(setting.extraToggles or {}))
    end

    for row = 1, extraRows do
        local inline = false
        for index, setting in ipairs(colors) do
            local toggle = (setting.extraToggles or {})[row]
            if toggle then
                page:AddCheckboxButton({ toggle.choice }, {
                    x = columnPositions[index],
                    width = columnWidth,
                    columnGap = columnGap,
                    inline = inline,
                    onChange = toggle.onChange
                })
                inline = true
            end
        end
    end
end

return Colors