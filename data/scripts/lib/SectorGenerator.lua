local modConfig = include("data/config/LargerAsteroidsConfig")

local old_createSmallAsteroid = SectorGenerator.createSmallAsteroid
function SectorGenerator:createSmallAsteroid(translation, size, resources, material)
    local newsize = modConfig.MultiplyAsteroidSize(translation, size, resources, material)
    return old_createSmallAsteroid(self, translation, newsize, resources, material)
end

local old_createHiddenTreasureAsteroid = SectorGenerator.createHiddenTreasureAsteroid
function SectorGenerator:createHiddenTreasureAsteroid(translation, size, material)
    local newsize = modConfig.MultiplyAsteroidSize(translation, size, true, material)
    return old_createHiddenTreasureAsteroid(self, translation, newsize, material)
end

local old_createAsteroidFieldEx = SectorGenerator.createAsteroidFieldEx
function SectorGenerator:createAsteroidFieldEx(numAsteroids, fieldSize, minAsteroidSize, maxAsteroidSize, hasResources, probability)
    local newfieldSize = modConfig.MultiplyFieldSize(numAsteroids, fieldSize, minAsteroidSize, maxAsteroidSize, hasResources, probability)
    return old_createAsteroidFieldEx(self, numAsteroids, newfieldSize, minAsteroidSize, maxAsteroidSize, hasResources, probability)
end
