local Config = {}
Config.author = 'Dirtyredz'
Config.name = 'LargerAsteroids'
Config.homepage = ""
Config.version = {
    major=1, minor=0, patch = 0,
    string = function()
        return  Config.version.major .. '.' ..
                Config.version.minor .. '.' ..
                Config.version.patch
    end
}

function Config.print(...)
  local args = table.pack(...)
  table.insert(args,1,"[" .. Config.name .. "][" .. Config.version.string() .. "]")
  print(table.unpack(args))
end

Config.ChanceForLargerMinable = 0.15
Config.LargerMinableMultiplier = 2.5
Config.StandardMinableMultiplier = 1.5
Config.NonMinableMultiplier = 1
Config.ChanceForTightCluster = 0.15
Config.ChanceForSpeadCluster = 0.25
Config.TightClusterMultiplier = 0.75
Config.SpreadClusterMultiplier = 3
Config.NormalClusterMultiplier = 1.5


Config.MultiplyAsteroidSize = function(translation, size, resources, material)
    local NewSize
    if resources == true then
        if math.random() < Config.ChanceForLargerMinable then
            NewSize = size * Config.LargerMinableMultiplier
        else
            NewSize = size * Config.StandardMinableMultiplier
        end
    else
        NewSize = size * Config.NonMinableMultiplier
    end
    return NewSize
end

Config.MultiplyFieldSize = function(numAsteroids, fieldSize, minAsteroidSize, maxAsteroidSize, hasResources, probability)
    local NewFieldSize = fieldSize * Config.NormalClusterMultiplier
    local Rand = math.random()
    if Config.ChanceForTightCluster < Config.ChanceForSpreadCluster then
        if Rand < Config.ChanceForTightCluster then
            NewFieldSize = fieldSize * Config.TightClusterMultiplier
        elseif Rand < Config.ChanceForSpreadCluster then
            NewFieldSize = fieldSize * Config.SpreadClusterMultiplier
        end
    else
        if Rand < Config.ChanceForSpreadCluster then
            NewFieldSize = fieldSize * Config.SpreadClusterMultiplier
        elseif Rand < Config.ChanceForTightCluster then
            NewFieldSize = fieldSize * Config.TightClusterMultiplier
        end
    end
    return NewFieldSize
end


return Config
