---@class PlunderTileTopology
---@field triangles integer[] Zero-based triangle vertex indices.
---@field perimeter integer[] One-based indices into the geometry positions.
---@field lines integer[] Zero-based indices into the perimeter vertices.

---@class PlunderTileGeometry
---@field minX integer
---@field minZ integer
---@field level integer
---@field width integer Width in tiles.
---@field depth integer Depth in tiles.
---@field filled boolean
---@field positions table<integer, Vector3> Interior vertices are omitted for unfilled tiles.
---@field perimeter Vector3[]

---@class PlunderTileMarker
local TileMarker = {}

local TILE_SIZE = 512
local HEIGHT_OFFSET = 30
local OUTLINE_HEIGHT_BIAS = 1

---@type table<integer, table<integer, PlunderTileTopology>>
local topologies = {}

---@param width integer
---@param depth integer
---@return PlunderTileTopology
local function topology(width, depth)
    local sizes = topologies[width]
    if not sizes then
        sizes = {}
        topologies[width] = sizes
    end

    if sizes[depth] then return sizes[depth] end

    local stride = width + 1
    ---@type integer[], integer[], integer[]
    local triangles, perimeter, lines = {}, {}, {}

    for z = 0, depth - 1 do
        for x = 0, width - 1 do
            local bottomLeft = z * stride + x
            local bottomRight, topLeft = bottomLeft + 1, bottomLeft + stride
            local topRight = topLeft + 1
            local index = #triangles

            triangles[index + 1], triangles[index + 2], triangles[index + 3] = bottomLeft, bottomRight, topRight
            triangles[index + 4], triangles[index + 5], triangles[index + 6] = bottomLeft, topRight, topLeft
        end
    end

    ---@param x integer
    ---@param z integer
    ---@return nil
    local function addCorner(x, z) perimeter[#perimeter + 1] = z * stride + x + 1 end

    for x = 0, width do
        addCorner(x, 0)
    end

    for z = 1, depth do
        addCorner(width, z)
    end

    for x = width - 1, 0, -1 do
        addCorner(x, depth)
    end

    for z = depth - 1, 1, -1 do
        addCorner(0, z)
    end

    for index = 1, #perimeter do
        lines[#lines + 1] = index - 1
        lines[#lines + 1] = index % #perimeter
    end

    local result = { triangles = triangles, perimeter = perimeter, lines = lines }
    sizes[depth] = result

    return result
end

---Draw a terrain-following marker, reusing compatible cached geometry.
---@param entity Loc|NPC|nil
---@param width integer
---@param depth integer
---@param outlineColor integer Packed RGBA color.
---@param fillColor integer? Nil disables filling.
---@param ignoreDepth boolean
---@param geometry PlunderTileGeometry?
---@return PlunderTileGeometry? geometry Nil when the entity, dimensions, or terrain are unavailable.
function TileMarker.Draw(entity, width, depth, outlineColor, fillColor, ignoreDepth, geometry)
    if not entity or not entity.isValid then return end
    if width <= 0 or depth <= 0 then return end

    local center = entity.position
    local level = entity.coordGrid.level
    local minX = math.floor(center.x - width * TILE_SIZE * 0.5 + 0.5)
    local minZ = math.floor(center.z - depth * TILE_SIZE * 0.5 + 0.5)
    local stride = width + 1
    local indices = topology(width, depth)
    local filled = fillColor ~= nil
    if not geometry or geometry.minX ~= minX or geometry.minZ ~= minZ
        or geometry.level ~= level or geometry.width ~= width or geometry.depth ~= depth
        or geometry.filled ~= filled then
        geometry = { minX = minX, minZ = minZ, level = level, width = width, depth = depth,
            filled = filled, positions = {}, perimeter = {} }

        for z = 0, depth do
            for x = 0, width do
                if filled or x == 0 or x == width or z == 0 or z == depth then
                    local worldX, worldZ = minX + x * TILE_SIZE, minZ + z * TILE_SIZE
                    local height, available = World.GetGroundHeight(level, worldX, worldZ)
                    if not available then return nil end
                    geometry.positions[z * stride + x + 1] = Vector3.new(worldX, height + HEIGHT_OFFSET, worldZ)
                end
            end
        end

        for _, index in ipairs(indices.perimeter) do
            local position = geometry.positions[index]
            geometry.perimeter[#geometry.perimeter + 1] = Vector3.new(position.x, position.y + OUTLINE_HEIGHT_BIAS, position.z)
        end
    end

    if fillColor then
        ShapeList.Draw({
            shapePositions = geometry.positions,
            shapeTris = indices.triangles,
            colour = fillColor,
            ignoreDepth = ignoreDepth
        })
    end

    ShapeList.Draw({
        shapePositions = geometry.perimeter,
        shapeLines = indices.lines,
        colour = outlineColor,
        lineWidth = 2,
        ignoreDepth = ignoreDepth
    })
    return geometry
end

return TileMarker
