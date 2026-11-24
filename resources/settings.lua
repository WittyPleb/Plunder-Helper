---@class PlunderSettings
local Settings = {}

---@type table<string, boolean|number|string|table>
local values = {}

---@type table<string, boolean>
local loaded = {}

---Missing values are normalized to false.
---@param key string
---@return boolean

function Settings:GetBool(key)
    if not loaded[key] then
        values[key] = PersistentDB:Get(key) == true
        loaded[key] = true
    end

    local value = values[key]
    ---@cast value boolean
    return value
end

---@param key string
---@param value boolean
---@return nil
function Settings:SetBool(key, value)
    PersistentDB:SetBool(key, value)
    values[key] = value
    loaded[key] = true
end

---@param key string
---@return integer?
function Settings:GetInt(key)
    if not loaded[key] then
        values[key] = PersistentDB:GetInt(key)
        loaded[key] = true
    end

    local value = values[key]
    ---@cast value integer?
    return value
end

---@param key string
---@param value integer
---@return nil
function Settings:SetInt(key, value)
    PersistentDB:SetInt(key, value)
    values[key] = value
    loaded[key] = true
end

---@param key string
---@return number?
function Settings:GetFloat(key)
    if not loaded[key] then
        values[key] = PersistentDB:GetFloat(key)
        loaded[key] = true
    end

    local value = values[key]
    ---@cast value number?
    return value
end

---@param key string
---@param value number
---@return nil
function Settings:SetFloat(key, value)
    PersistentDB:SetFloat(key, value)
    values[key] = value
    loaded[key] = true
end

---@param key string
---@return string?
function Settings:GetString(key)
  if not loaded[key] then
    values[key] = PersistentDB:GetString(key)
    loaded[key] = true
  end

  local value = values[key]
  ---@cast value string?
  return value
end

---@param key string
---@param value string
---@return nil
function Settings:SetString(key, value)
  PersistentDB:SetString(key, value)
  values[key] = value
  loaded[key] = true
end

---@param key string
---@return table?
function Settings:GetStructuredData(key)
  if not loaded[key] then
    values[key] = PersistentDB:GetStructuredData(key)
    loaded[key] = true
  end

  local value = values[key]
  ---@cast value table?
  return value
end

---@param key string
---@param value table
---@return nil
function Settings:SetStructuredData(key, value)
  PersistentDB:SetStructuredData(key, value)
  values[key] = value
  loaded[key] = true
end

return Settings