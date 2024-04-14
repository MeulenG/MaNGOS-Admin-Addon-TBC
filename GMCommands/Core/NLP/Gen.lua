if not AtlasLoot_Data then
    AtlasLoot_Data = {}
end
-- Define templates for the new format
local templates = {
    { sentence = "Add [item] to my [container]", label = "add_item" },
    { sentence = "Put [item] in [container]", label = "add_item" },
    { sentence = "I need a [item] in my [container]", label = "add_item" },
    { sentence = "Teleport me to [location]", label = "teleport" },
    { sentence = "Take me to [location]", label = "teleport" },
    { sentence = "Move me to [location]", label = "teleport" },
    { sentence = "Tp [location]", label = "teleport"},
    { sentence = "[location]", label = "teleport"},
    { sentence = "Place me in [location]", label = "teleport"},
}

local AtlasLoot_Data = require("Items")
local items = AtlasLoot_Data["AtlasLootItems"]
local containers = {"bag", "inventory"}

-- Mapping general areas to specific locations based on DewDropDown.lua structure
local areaMappings = {
    ["Eastern Kingdoms"] = {"Blackrock Camp", "Chillwind Point", "Dalaran", "Dalaran Ruins", "Dandred's Fold", "Dun Baldar", "Dun Baldar Pass", "Lordamere Internment Camp"},
    ["Arathi Highlands"] = {"Abyssal Sands", "Arathi Basin", "Arathi Highlands", "Boulderfist Hall", "Circle of East Binding", "Circle of Inner Binding", "Circle of Outer Binding", "Circle of West Binding", "Dabyrie's Farmstead", "Drowned Reef", "Faldir's Cove", "Go'Shek Farm", "Hammerfall"},
    ["Badlands"] = {"Angor Fortress", "Apocrypthan's Rest", "Camp Boff", "Camp Cagg", "Camp Kosh", "Dreadmaul Hold", "Hammertoe's Digsite", "Kargath", "Lethlor Ravine", "Maker's Terrance"},
    ["Blasted Lands"] = {"Blasted Lands", "Dark Portal", "Dreadmaul Post", "Nethergarde Keep"},
    ["Burning Steppes"] = {"Altar Of Storms A", "Altar Of Storms B", "Blackrock Depths", "Blackwing Lair", "Dragonmaw Garrison", "Draco'dar", "Dreadmaul Rock", "Molten Core", "Morgan's Vigil"},
    ["Ashenvale"] = {"Ashenvale", "Astranaar", "Blackfathom Deeps", "Bough Shadow", "Demon Fall Canyon", "Dor'Danil Barrow Den", "Falfarren River", "Felfire Hill", "Forest Song", "Greenpaw Village", "Kargathia Keep", "Maestra's Post", "Mystral Lake"},
    ["Azshara"] = {"Azshara"},
    ["Azuremyst Isle"] = {"Ammen Vale", "Azuremyst Isle", "Azure Watch", "Bristlelimb Village", "Crash Site", "Dreanai Start", "Emberglade", "Exodar"},
    ["Bloodmyst Isle"] = {"Bloodcurse Isle", "Bloodmyst Isle", "Blood Watch"},
    ["Darkshore"] = {"Ameth'Aran", "Auberdine", "Bashal'Aran", "Blackwood Den", "The Clifspring River", "Darkshore", "Grove of the Ancients", "Long Wash", "Master's Glaive", "Mist's Edge"},
    ["Darnassus"] = {"Aldrassil", "The Cenarion Enclave", "Craftsmen's Terrance", "Darnassus"},
    ["Desolace"] = {"Desolace", "Gelkis Village", "Ghost Walker Post", "Kodo Graveyard", "Kolkar Village", "Magram Village", "Mannoroc Coven", "Maraudon"},
    ["Durotar"] = {"Bladefist Bay", "Deadeye Shore", "Durotar", "Echo Isles", "Goblin Observatory", "Kolkar Crag"},
    ["Dustwallow Marsh"] = {"Alcaz Island", "Beezil's Wreck", "Brackenwall Village", "Deadmire", "Den of Flame", "Dreadmurk Shore", "Dustwallow Marsh", "Lost Point"},
    ["Felwood"] = {"Bloodvenom Falls", "Emerald Sanctuary", "Felwood", "Jaedenar"},
    ["Feralas"] = {"Camp Mojache", "Dire Maul", "Dream Bough", "Feathermoon Stronghold", "Feralas", "Forgotten Coast", "Isle of Dread"},
    ["Moonglade"] = {"Moonglade"},
    ["Mulgore"] = {"Menethil Bay", "Mulgore Mine", "The Bael'Dun Digsite", "Bloodhoof Village", "Brambleblade Ravine", "Camp Narache", "Elder Rise", "Hunter Rise"},
    ["Orgrimmar"] = {"Cleft of Shadow", "Drag", "Grommash Hold", "Hidden Path"},
    ["Silithus"] = {"Cenarion Hold", "Hive'Ashi", "Hive'Regal", "Hive'Zora"},
    ["Stonetalon Mountains"] = {"Blackwolf River", "Boulderslide Ravine", "Charred Vale", "Cragpool Lake", "The Den", "Greatwood Vale", "Malaka'jin", "Mirkfallon Lake"},
    ["Tanaris"] = {"Abyssal Sands", "Caverns of Time", "The Black Morass", "The Black Morass Portal", "Dunemaul Compound", "Eastmoon Ruins", "Gadgetzan", "Gaping Chasm"},
    ["Teldrassil"] = {"Dolanaar", "Gm Island", "Gnarlpine Hold", "Lake Al'Ameth"},
    ["The Barrens"] = {"Bael Modan", "Barrens", "Camp Taurajo", "Crossroads", "Field of Giants", "Forgotten Pools", "Fray Island", "Great Lift", "Lushwater Oasis", "Merchant Coast"},
    ["The Exodar"] = {"Abyssal Sands"},
    ["Thousand Needles"] = {"Freewind Post", "Darkcloud Pinnacle", "Highperch", "Mirage Raceway"},
    ["Thunder Bluff"] = {"Abyssal Sands"},
    ["Un'Goro Crater"] = {"Fire Plume Ridge", "Fungal Rock", "Golakka Hot Springs", "Lakkari Tar Pits", "Marshal's Refuge", "Marshlands"},
    ["Winterspring"] = {"Darkwhisper Gorge", "Everlook", "Frostfire Hot Springs", "Frostsaber Rock", "Frostwhisper Gorge", "Hidden Grove", "Mazthoril"},
    ["Hellfire Peninsula"] = {"Dark Portal", "Falcon Watch", "Fallen Sky Ridge", "Hellfire Citadel", "Hellfire Citadel Entrance", "Hellfire Peninsula", "Honor Hold", "Magtheridon", "Manoroth Corpse"},
    ["Zangarmarsh"] = {"Cenarion Refuge", "Coilfang Reservoir", "Marshlight Lake"},
    ["Blade's Edge Mountains"] = {"Blade's Edge Mountains", "Bladespire Hold", "Bladespire Outpost", "Bloodmaul Outpost", "Circle of Blood", "Crystal Spine", "Evergrove", "Felstorm Point", "Forge Camp Anger", "Forge Camp Terror", "Forge Camp Wrath", "Grishnath", "Gruul's Lair", "Mok'Nathal Village"},
    ["Netherstorm"] = {"Arcatraz", "Area 52", "Arklon Ruins", "Botanica", "Cosmowrench", "Kirin'Var Village", "Manaforge B'naar", "Manaforge Coruu", "Manaforge Duro"},
    ["Terokkar Forest"] = {"Aldor Rise", "Allerian Stronghold", "Auchindoun", "Blackwind Lake", "Bleeding Hollow Ruins", "Bonechewer Ruins", "Cenarion Thicket", "Firewing Point"},
    ["Shadowmoon Valley"] = {"Altar Of Damnation", "Black Temple", "Coilskar Point", "Deathforge", "Legion Hold"},
    ["Nagrand"] = {"Nagrand", "Garadar", "Halaa"},
}

local LocationsData = require("Locations")




-- Helper function to check if a table contains a value
function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function extractItemNamesAndIDs(lootTable)
    local itemNamesAndIDs = {}
    for _, item in ipairs(lootTable) do
        local itemId = item[1]
        local itemName = item[3]
        if itemId and itemId ~= 0 and itemName and itemName ~= "" then
            local name = itemName:match("=q%d=(.-)$")
            if name then
                table.insert(itemNamesAndIDs, {id = itemId, name = name})
            end
        end
    end
    return itemNamesAndIDs
end


function generateItemCommands()
    local generatedCommands = {}
    print("Inside generateItemCommands...")

    for _, lootTable in pairs(items) do
        print("Processing lootTable...")
        local itemNamesAndIDs = extractItemNamesAndIDs(lootTable)
        if #itemNamesAndIDs == 0 then
            print("No items extracted from lootTable.")
        end

        for _, item in ipairs(itemNamesAndIDs) do
            for _, template in ipairs(templates) do
                if template.label == "add_item" then
                    for _, container in ipairs(containers) do
                        local command = {
                            sentence = template.sentence:gsub("%[item%]", item.name):gsub("%[container%]", container),
                            label = template.label,
                            itemId = item.id
                        }
                        table.insert(generatedCommands, command)
                    end
                end
            end
        end
    end

    print("Exiting generateItemCommands...")
    return generatedCommands
end

-- Function to get a specific location
function getSpecificLocation(area, requestedLocation)
    local specificLocations = areaMappings[area]

    if specificLocations then
        -- If a specific location is requested and it exists in the area
        if requestedLocation and table.contains(specificLocations, requestedLocation) then
            return requestedLocation
        else
            -- Otherwise, randomly select a location for diversity
            return specificLocations[math.random(#specificLocations)]
        end
    else
        return nil
    end
end

local function TeleportHandler(locKey)
    local loc = locations[locKey]
    if loc then
        local command = string.format(".go %f %f %f %d %s", loc.x, loc.y, loc.z, loc.map, locKey)
        return command
    else
        print("Invalid Location/Coordinates")
    end
end

-- Function to generate commands in the new format
function generateCommands()
    local generatedCommands = {}
    for _, template in ipairs(templates) do
        if template.label == "teleport" then
            for region, locations in pairs(areaMappings) do
                for i, location in ipairs(locations) do
                    local command = {
                        sentence = template.sentence:gsub("%[location%]", location),
                        label = template.label
                    }
                    table.insert(generatedCommands, command)
                end
            end
        end
    end
    return generatedCommands
end

function generateRegions()
    local regions_set = {}
    for _, template in ipairs(templates) do
        if template.label == "teleport" then
            for region, locations in pairs(areaMappings) do
                for _, location in ipairs(region) do
                    local command = {
                        sentence = template.sentence:gsub("%[location%]", location),
                        label = template.label
                    }
                    table.insert(regions_set, command)
                end
            end
        end
    end
    return regions_set
end


Dataset_Items = {}
Dataset_Teleport = {}
Dataset_regions = {}

-- Generate and print commands in the new format
local generatedCommands = generateCommands()
for _, command in ipairs(generatedCommands) do
    tele_Data = "{ sentence = \"" .. command.sentence .. "\", label = \"" .. command.label .. "\" },"
    table.insert(Dataset_Teleport, tele_Data)
end

local regions_set = generateRegions()
print(regions_set)
for _, command in ipairs(regions_set) do
    region_Data = "{ sentence = \"" .. command.sentence .. "\", label = \"" .. command.label .. "\" },"
    table.insert(Dataset_regions, region_Data)
end

print("Generating item commands...")
local generatedItemCommands = generateItemCommands()
for _, command in ipairs(generatedItemCommands) do
    data = "{ sentence = \"" .. command.sentence .. "\", label = \"" .. command.label .. "\", item_id = " .. command.itemId .. " },"
    table.insert(Dataset_Items, data)
end

io.output(assert(io.open("gen3.txt", "w")))
-- for key, value in ipairs(Dataset_Items) do
--     io.write(key, value)
-- end

-- for key, value in ipairs(Dataset_Teleport) do
--     io.write(key, value)
-- end

for key, value in ipairs(Dataset_regions) do
    io.write(key, value)
end