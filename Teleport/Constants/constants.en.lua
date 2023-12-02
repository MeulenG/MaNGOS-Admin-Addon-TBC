--[[
constants.en.lua
This file defines an AceLocale table for all the various text strings needed
by AtlasLoot.  In this implementation, if a translation is missing, it will fall
back to the English translation.

The ["text"] = true; shortcut can ONLY be used for English (the root translation).
]]

--Table for all data to be inserted into.  Included here as it is the first file loaded
AtlasLoot_Data = {};

--Create the library instance
local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot");

--Allow reporting of what translations are missing
AL:EnableDebugging();

--Allow the language to be changed dynamically for debugging purposes
AL:EnableDynamicLocales();

--Register translations
AL:RegisterTranslations("enUS", function() return {
    --Text strings for UI objects
    ["AtlasLoot"] = true,
    ["No match found for"] = true,
    ["Search"] = true,
    ["Clear"] = true,
    ["Teleport"] = true,
    ["GMCommands"] = true,
    ["Select Sub-Table"] = true,
    ["Drop Rate: "] = true,
    ["DKP"] = true,
    ["Priority:"] = true,
    ["Click boss name to view loot."] = true,
    ["Various Locations"] = true,
    ["This is a loot browser only.  To view maps as well, install either Atlas or Alphamap."] = true,
    ["Toggle AL Panel"] = true,
    [" is safe."] = true,
    ["Server queried for "] = true,
    [".  Right click on any other item to refresh the loot page."] = true,
    ["Back"] = true,
    ["Level 60"] = true,
    ["Level 70"] = true,
    ["|cffff0000(unsafe)"] = true,
    ["Misc"] = true,
    ["Rewards"] = true,
    ["Heroic Mode"] = true,
    ["Normal Mode"] = true,
    ["Raid"] = true,
    ["Factions - Azeroth"] = true,
    ["Factions - Outland"] = true,
    ["Factions - Shattrath City"] = true,
    ["Pre-Burning Crusade"] = true,
    ["Post-Burning Crusade"] = true,
    ["Choose Location ..."] = true,
    ["Close Menu"] = true,
    ["Unknown"] = true,
    ["Skill Required:"] = true,
    ["QuickLook"] = true,
    ["Add to QuickLooks:"] = true,
    ["Assign this loot table\n to QuickLook"] = true,
    ["Req. Rating:"] = true,  --Shorthand for 'Required Rating' for the personal/team ratings in Arena S4
    ["Query Server"] = true,
    ["Eastern Kingdoms"] = true,
    ["Kalimdor"] = true,
    ["Outland"] = true,
    ["Burning Crusade"] = true,
    ["Abyssal Sands"] = true,
    } end)