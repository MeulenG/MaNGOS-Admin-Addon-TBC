--[[
DewDropDown.lua
Defines the table listings for the dropdown lists.
]]

--Invoke all libraries
local BabbleZone = LibStub("LibBabble-Zone-3.0"):GetLookupTable();
local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot");

--This is a multi-layer table defining the main loot listing.
--Entries have the text to display, loot table or sub table to link to and if the link is to a loot table or sub table
AtlasLoot_DewDropDown = {
	[1] = {
		[AL["Eastern Kingdoms"]] = {
			[1] = {
				[BabbleZone["Alterac Mountains"]] = {
					{ BabbleZone["Blackrock Camp"], "Blackrock Camp"},
					{ BabbleZone["Chillwind Point"], "Chillwind Point"},
					{ BabbleZone["Dalaran"], "Dalaran"},
					{ BabbleZone["Dalaran Ruins"], "Dalaran Ruins"},
					{ BabbleZone["Dandred's Fold"], "Dandred's Fold"},
					{ BabbleZone["Dun Baldar"], "Dun Baldar"},
					{ BabbleZone["Dun Baldar Pass"], "Dun Baldar Pass"},
					{ BabbleZone["Lordamere Internment Camp"], "Lordamere Internment Camp"},
				},
			},
			[2] = { 
				[BabbleZone["Arathi Highlands"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
					{ BabbleZone["Arathi Basin"], "Arathi Basin"},
					{ BabbleZone["Arathi Highlands"], "Arathi Highlands"},
					{ BabbleZone["Boulderfist Hall"], "Boulderfist Hall"},
					{ BabbleZone["Circle of East Binding"], "Circle of East Binding"},
					{ BabbleZone["Circle of Inner Binding"], "Circle of Inner Binding"},
					{ BabbleZone["Circle of Outer Binding"], "Circle of Outer Binding"},
					{ BabbleZone["Circle of West Binding"], "Circle of West Binding"},
					{ BabbleZone["Dabyrie's Farmstead"], "Dabyrie's Farmstead"},
					{ BabbleZone["Drowned Reef"], "Drowned Reef"},
					{ BabbleZone["Faldir's Cove"], "Faldir's Cove"},
					{ BabbleZone["Go'Shek Farm"], "Go'Shek Farm"},
					{ BabbleZone["Hammerfall"], "Hammerfall"},
				},
			},
			[3] = { 
				[BabbleZone["Badlands"]] = {
					{ BabbleZone["Angor Fortress"], "Angor Fortress"},
					{ BabbleZone["Apocrypthan's Rest"], "Apocrypthan's Rest"},
					{ BabbleZone["Camp Boff"], "Camp Boff"},
					{ BabbleZone["Camp Cagg"], "Camp Cagg"},
					{ BabbleZone["Camp Kosh"], "Camp Kosh"},
					{ BabbleZone["Dreadmaul Hold"], "Dreadmaul Hold"},
					{ BabbleZone["Hammertoe's Digsite"], "Hammertoe's Digsite"},
					{ BabbleZone["Kargath"], "Kargath"},
					{ BabbleZone["Lethlor Ravine"], "Lethlor Ravine"},
					{ BabbleZone["Maker's Terrance"], "Maker's Terrance"},
				},
			},
			[4] = { 
				[BabbleZone["Blasted Lands"]] = {
					{ BabbleZone["Blasted Lands"], "Blasted Lands"},
					{ BabbleZone["Dark Portal"], "Dark Portal"},
					{ BabbleZone["Dreadmaul Post"], "Dreadmaul Post"},
					{ BabbleZone["Nethergarde Keep"], "Nethergarde Keep"},
				},
			},
			[5] = { 
				[BabbleZone["Burning Steppes"]] = {
					{ BabbleZone["Altar Of Storms A"], "Altar Of Storms A"},
					{ BabbleZone["Altar Of Storms B"], "Altar Of Storms B"},
					{ BabbleZone["Blackrock Depths"], "Blackrock Depths"},
					{ BabbleZone["Blackwing Lair"], "Blackwing Lair"},
					{ BabbleZone["Dragonmaw Garrison"], "Dragonmaw Garrison"},
					{ BabbleZone["Draco'dar"], "Draco'dar"},
					{ BabbleZone["Dreadmaul Rock"], "Dreadmaul Rock"},
					{ BabbleZone["Molten Core"], "Molten Core"},
					{ BabbleZone["Morgan's Vigil"], "Morgan's Vigil"},
				},
			},
			[6] = { 
				[BabbleZone["Deadwind Pass"]] = {
					{ BabbleZone["Ariden's Camp"], "Ariden's Camp"},
					{ BabbleZone["Deadwind Pass"], "Deadwind Pass"},
					{ BabbleZone["Morgan's Plot"], "Morgan's Plot"},
				},
			},
			[7] = { 
				[BabbleZone["Dun Morogh"]] = {
					{ BabbleZone["Anvilmar"], "Anvilmar"},
					{ BabbleZone["Brewnall Village"], "Brewnall Village"},
					{ BabbleZone["Coldridge Valley"], "Coldridge Valley"},
					{ BabbleZone["Dun Morogh"], "Dun Morogh"},
					{ BabbleZone["Frostmane Hold"], "Frostmane Hold"},
					{ BabbleZone["Gnomeregan"], "Gnomeregan"},
					{ BabbleZone["Gnomeregan Train Depot"], "Gnomeregan Train Depot"},
					{ BabbleZone["Gol'Bolar Quarry"], "Gol'Bolar Quarry"},
					{ BabbleZone["Helm's Bed Lake"], "Helm's Bed Lake"},
					{ BabbleZone["Kharanos"], "Kharanos"},
					{ BabbleZone["Misty Pine Refuge"], "Misty Pine Refuge"},
				},
			},
			[8] = { 
				[BabbleZone["Duskwood"]] = {
					{ BabbleZone["Addles Stead"], "Addles Stead"},
					{ BabbleZone["Beggar's Haunt"], "Beggar's Haunt"},
					{ BabbleZone["Brightwood Grove"], "Brightwood Grove"},
					{ BabbleZone["Darkened Bank"], "Darkened Bank"},
					{ BabbleZone["Darkshire"], "Darkshire"},
					{ BabbleZone["Deadman's Crossing"], "Deadman's Crossing"},
					{ BabbleZone["Duskwood"], "Duskwood"},
				},
			},
			[9] = { 
				[BabbleZone["Eastern Plaguelands"]] = {
					{ BabbleZone["Blackwood Lake"], "Blackwood Lake"},
					{ BabbleZone["Corin's Crossing"], "Corin's Crossing"},
					{ BabbleZone["Crown Guard Tower"], "Crown Guard Tower"},
					{ BabbleZone["Darrowmere Lake"], "Darrowmere Lake"},
					{ BabbleZone["Eastwall Tower"], "Eastwall Tower"},
					{ BabbleZone["Light's Hope Chapel"], "Light's Hope Chapel"},
					{ BabbleZone["Naxxramas"], "Naxxramas"},
				},
			},
			[10] = { 
				[BabbleZone["Elwynn Forest"]] = {
					{ BabbleZone["Brackwell Pumpkin Patch"], "Brackwell Pumpkin Patch"},
					{ BabbleZone["Crystal Lake"], "Crystal Lake"},
					{ BabbleZone["Eastvale Logging Camp"], "Eastvale Logging Camp"},
					{ BabbleZone["Elwynn Forest"], "Elwynn Forest"},
					{ BabbleZone["Fargo Deepmine"], "Fargo Deepmine"},
					{ BabbleZone["Goldshire"], "Goldshire"},
					{ BabbleZone["Heroe's Vigil"], "Heroe's Vigil"},
					{ BabbleZone["Jasperlode Mine"], "Jasperlode Mine"},
					{ BabbleZone["Maclure Vineyards"], "Maclure Vineyards"},
					{ BabbleZone["Mirror Lake"], "Mirror Lake"},
					{ BabbleZone["Mirror Lake Orchard"], "Mirror Lake Orchard"},
				},
			},
			[11] = { 
				[BabbleZone["Eversong Woods"]] = {
					{ BabbleZone["Fairbreeze Village"], "Fairbreeze Village"},
					{ BabbleZone["Farstrider Retreat"], "Farstrider Retreat"},
				},
			},
			[12] = { 
				[BabbleZone["Ghostlands"]] = {
					{ BabbleZone["Amani Pass"], "Amani Pass"},
					{ BabbleZone["Deatholme"], "Deatholme"},
					{ BabbleZone["Ghostlands"], "Ghostlands"},
				},
			},
			[13] = { 
				[BabbleZone["Hillsbrad Foothills"]] = {
					{ BabbleZone["Alterac Valley"], "Alterac Valley"},
					{ BabbleZone["Darrow Hill"], "Darrow Hill"},
					{ BabbleZone["Dun Garok"], "Dun Garok"},
					{ BabbleZone["Durnholde Keep"], "Durnholde Keep"},
					{ BabbleZone["Eastern Strand"], "Eastern Strand"},
					{ BabbleZone["Headland"], "Headland"},
					{ BabbleZone["Hillsbrad Fields"], "Hillsbrad Fields"},
				},
			},
			[14] = { 
				[BabbleZone["Ironforge"]] = {
					{ BabbleZone["Ironforge"], "Ironforge"},
					{ BabbleZone["Commons"], "Commons"},
					{ BabbleZone["Forlorn Cavern"], "Forlorn Cavern"},
					{ BabbleZone["Great Forge"], "Great Forge"},
					{ BabbleZone["Hall of Explorers"], "Hall of Explorers"},
					{ BabbleZone["Hall of Legends"], "Hall of Legends"},
					{ BabbleZone["Military Ward"], "Military Ward"},
					{ BabbleZone["Mystic Ward"], "Mystic Ward"},
				},
			},
			[15] = { 
				[BabbleZone["Isle of Quel'Danas"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[16] = { 
				[BabbleZone["Loch Modan"]] = {
					{ BabbleZone["Algaz Station"], "Algaz Station"},
					{ BabbleZone["Dun Algaz"], "Dun Algaz"},
					{ BabbleZone["Farstrider Lodge"], "Farstrider Lodge"},
					{ BabbleZone["Ironband's Excavation Site"], "Ironband's Excavation Site"},
					{ BabbleZone["Loch Lake"], "Loch Lake"},
					{ BabbleZone["Mo'grosh Stronghold"], "Mo'grosh Stronghold"},
				},
			},
			[17] = { 
				[BabbleZone["Redridge Mountains"]] = {
					{ BabbleZone["Althers Mill"], "Althers Mill"},
					{ BabbleZone["Lake Everstill"], "Lake Everstill"},
					{ BabbleZone["Lakeshire"], "Lakeshire"},
					{ BabbleZone["Murloc Camp"], "Murloc Camp"},
				},
			},
			[18] = { 
				[BabbleZone["Searing Gorge"]] = {
					{ BabbleZone["Dustfire Valley"], "Dustfire Valley"},
					{ BabbleZone["Firewatch Ridge"], "Firewatch Ridge"},
					{ BabbleZone["Grimeslit Dig Site"], "Grimeslit Dig Site"},
				},
			},
			[19] = { 
				[BabbleZone["Silvermoon City"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[20] = { 
				[BabbleZone["Silverpine Forest"]] = {
					{ BabbleZone["Amber Mill"], "Amber Mill"},
					{ BabbleZone["Dawning Isles"], "Dawning Isles"},
					{ BabbleZone["Dead Field"], "Dead Field"},
					{ BabbleZone["Deathknell"], "Deathknell"},
					{ BabbleZone["Fenris Isle"], "Fenris Isle"},
					{ BabbleZone["Fenris Keep"], "Fenris Keep"},
					{ BabbleZone["Greymane Wall"], "Greymane Wall"},
					{ BabbleZone["Ivar Patch"], "Ivar Patch"},
					{ BabbleZone["Lordamere Lake"], "Lordamere Lake"},
					{ BabbleZone["Malden's Orchard"], "Malden's Orchard"},
				},
			},
			[21] = { 
				[BabbleZone["Stormwind City"]] = {
					{ BabbleZone["Champion's Hall"], "Champion's Hall"},
					{ BabbleZone["Deeprun Tram"], "Deeprun Tram"},
					{ BabbleZone["Mage Quarter"], "Mage Quarter"},
				},
			},
			[22] = { 
				[BabbleZone["Stranglethorn Vale"]] = {
					{ BabbleZone["Bloodsail Compound"], "Bloodsail Compound"},
					{ BabbleZone["Booty Bay"], "Booty Bay"},
					{ BabbleZone["Gilijim's Isle"], "Gilijim's Isle"},
					{ BabbleZone["Grom'Gol Base Camp"], "Grom'Gol Base Camp"},
					{ BabbleZone["Gurubashi Arena"], "Gurubashi Arena"},
					{ BabbleZone["Jaguero Isle"], "Jaguero Isle"},
					{ BabbleZone["Janeiro's Point"], "Janeiro's Point"},
					{ BabbleZone["Kurzen's Compound"], "Kurzen's Compound"},
				},
			},
			[23] = { 
				[BabbleZone["Swamp of Sorrows"]] = {
					{ BabbleZone["Fallow Sanctuary"], "Fallow Sanctuary"},
					{ BabbleZone["Misty Reed Post"], "Misty Reed Post"},
					{ BabbleZone["Misty Reed Strand"], "Misty Reed Strand"},
					{ BabbleZone["Misty Valley"], "Misty Valley"},
				},
			},
			[24] = { 
				[BabbleZone["The Hinterlands"]] = {
					{ BabbleZone["Aerie Peak"], "Aerie Peak"},
					{ BabbleZone["Agol'Watha"], "Agol'Watha"},
					{ BabbleZone["The Altar Of Zul"], "The Altar Of Zul"},
					{ BabbleZone["Jintha'Alor"], "Jintha'Alor"},
				},
			},
			[25] = { 
				[BabbleZone["Tirisfal Glades"]] = {
					{ BabbleZone["Agamand Mills"], "Agamand Mills"},
					{ BabbleZone["Bulwark"], "Bulwark"},
					{ BabbleZone["Brightwater Lake"], "Brigthwater Lake"},
					{ BabbleZone["Brill"], "Brill"},
					{ BabbleZone["Cold Hearth Manor"], "Cold Hearth Manor"},
					{ BabbleZone["Garren's Haunt"], "Garren's Haunt"},
					{ BabbleZone["Gunther's Retreat"], "Gunther's Retreat"},
				},
			},
			[26] = { 
				[BabbleZone["Undercity"]] = {
					{ BabbleZone["Magic Quarter"], "Magic Quarter"},
				},
			},
			[27] = { 
				[BabbleZone["Western Plaguelands"]] = {
					{ BabbleZone["Caer Darrow"], "Caer Darrow"},
					{ BabbleZone["Caer Darrow The Dark Portal"], "Caer Darrow The Dark Portal"},
					{ BabbleZone["Dalson's Tears"], "Dalson's Tears"},
					{ BabbleZone["Felstone Field"], "Felstone Field"},
					{ BabbleZone["Fungal Vale"], "Fungal Vale"},
					{ BabbleZone["Gahrron's Withering"], "Gahrron's Withering"},
					{ BabbleZone["Mardenholde Keep"], "Mardenholde Keep"},
					{ BabbleZone["Marris Stead"], "Marris Stead"},
					{ BabbleZone["Moonbrook"], "Moonbrook"},
				},
			},
			[28] = {
				[BabbleZone["Westfall"]] = {
					{ BabbleZone["Alexston Farmstead"], "Alexston Farmstead"},
					{ BabbleZone["Dagger Hills"], "Dagger Hills"},
					{ BabbleZone["Dead Acre"], "Dead Acre"},
					{ BabbleZone["Deadmines"], "Deadmines"},
					{ BabbleZone["Dust Plains"], "Dust Plains"},
					{ BabbleZone["Furlbrow's Pumpkin Patch"], "Furlbrow's Pumpkin Patch"},
					{ BabbleZone["Jangolode Mine"], "Jangolode Mine"},
					{ BabbleZone["Longshore"], "Longshore"},
				},
			},
			[29] = {
				[BabbleZone["Wetlands"]] = {
					{ BabbleZone["Baradin Bay"], "Baradin Bay"},
					{ BabbleZone["Direforge Hill"], "Direforge Hill"},
					{ BabbleZone["Dragonmaw Gates"], "Dragonmaw Gates"},
					{ BabbleZone["Dun Modr"], "Dun Modr"},
					{ BabbleZone["Green Belt"], "Green Belt"},
					{ BabbleZone["Grim Batol"], "Grim Batol"},
					{ BabbleZone["Ironbeard's Tomb"], "Ironbeard's Tomb"},
					{ BabbleZone["Menethil Bay"], "Menethil Bay"},
					{ BabbleZone["Menethil Harbor"], "Menethil Harbor"},
				},
			},
		},
	},
	[2] = {
		[AL["Kalimdor"]] = {
			[1] = { 
				[BabbleZone["Ashenvale"]] = {
					{ BabbleZone["Ashenvale"], "Ashenvale"},
					{ BabbleZone["Astranaar"], "Astranaar"},
					{ BabbleZone["Blackfathom Deeps"], "Blackfathom Deeps"},
					{ BabbleZone["Bough Shadow"], "Bough Shadow"},
					{ BabbleZone["Demon Fall Canyon"], "Demon Fall Canyon"},
					{ BabbleZone["Dor'Danil Barrow Den"], "Dor'Danil Barrow Den"},
					{ BabbleZone["Falfarren River"], "Falfarren River"},
					{ BabbleZone["Felfire Hill"], "Felfire Hill"},
					{ BabbleZone["Forest Song"], "Forest Song"},
					{ BabbleZone["Greenpaw Village"], "Greenpaw Village"},
					{ BabbleZone["Kargathia Keep"], "Kargathia Keep"},
					{ BabbleZone["Maestra's Post"], "Maestra's Post"},
					{ BabbleZone["Mystral Lake"], "Mystral Lake"},
				},
			},
			[2] = { 
				[BabbleZone["Azshara"]] = {
					{ BabbleZone["Azshara Azshara"], "Azshara"},
				},
			},
			[3] = {
				[BabbleZone["Azuremyst Isle"]] = {
					{ BabbleZone["Ammen Vale"], "Ammen Vale"},
					{ BabbleZone["Azuremyst Isle"], "Azuremyst Isle"},
					{ BabbleZone["Azure Watch"], "Azure Watch"},
					{ BabbleZone["Bristlelimb Village"], "Bristlelimb Village"},
					{ BabbleZone["Crash Site"], "Crash Site"},
					{ BabbleZone["Dreanai Start"], "Dreanai Start"},
					{ BabbleZone["Emberglade"], "Emberglade"},
					{ BabbleZone["Exodar"], "Exodar"},
				},
			},
			[4] = { 
				[BabbleZone["Bloodmyst Isle"]] = {
					{ BabbleZone["Bloodcurse Isle"], "Bloodcurse Isle"},
					{ BabbleZone["Bloodmyst Isle"], "Bloodmyst Isle"},
					{ BabbleZone["Blood Watch"], "Blood Watch"},
				},
			},
			[5] = { 
				[BabbleZone["Darkshore"]] = {
					{ BabbleZone["Ameth'Aran"], "Ameth'Aran"},
					{ BabbleZone["Auberdine"], "Auberdine"},
					{ BabbleZone["Bashal'Aran"], "Bashal'Aran"},
					{ BabbleZone["Blackwood Den"], "Blackwood Den"},
					{ BabbleZone["The Clifspring River"], "The Clifspring River"},
					{ BabbleZone["Darkshore"], "Darkshore"},
					{ BabbleZone["Grove of the Ancients"], "Grove of the Ancients"},
					{ BabbleZone["Long Wash"], "Long Wash"},
					{ BabbleZone["Master's Glaive"], "Master's Glaive"},
					{ BabbleZone["Mist's Edge"], "Mist's Edge"},
				},
			},
			[6] = { 
				[BabbleZone["Darnassus"]] = {
					{ BabbleZone["Aldrassil"], "Aldrassil"},
					{ BabbleZone["The Cenarion Enclave"], "The Cenarion Enclave"},
					{ BabbleZone["Craftsmen's Terrance"], "Craftsmen's Terrance"},
					{ BabbleZone["Darnassus"], "Darnassus"},
				},
			},
			[7] = { 
				[BabbleZone["Desolace"]] = {
					{ BabbleZone["Desolace"], "Desolace"},
					{ BabbleZone["Gelkis Village"], "Gelkis Village"},
					{ BabbleZone["Ghost Walker Post"], "Ghost Walker Post"},
					{ BabbleZone["Kodo Graveyard"], "Kodo Graveyard"},
					{ BabbleZone["Kolkar Village"], "Kolkar Village"},
					{ BabbleZone["Magram Village"], "Magram Village"},
					{ BabbleZone["Mannoroc Coven"], "Mannoroc Coven"},
					{ BabbleZone["Maraudon"], "Maraudon"},
				},
			},
			[8] = { 
				[BabbleZone["Durotar"]] = {
					{ BabbleZone["Bladefist Bay"], "Bladefist Bay"},
					{ BabbleZone["Deadeye Shore"], "Deadeye Shore"},
					{ BabbleZone["Durotar"], "Durotar"},
					{ BabbleZone["Echo Isles"], "Echo Isles"},
					{ BabbleZone["Goblin Observatory"], "Goblin Observatory"},
					{ BabbleZone["Kolkar Crag"], "Kolkar Crag"},
				},
			},
			[9] = { 
				[BabbleZone["Dustwallow Marsh"]] = {
					{ BabbleZone["Alcaz Island"], "Alcaz Island"},
					{ BabbleZone["Beezil's Wreck"], "Beezil's Wreck"},
					{ BabbleZone["Brackenwall Village"], "Brackenwall Village"},
					{ BabbleZone["Deadmire"], "Deadmire"},
					{ BabbleZone["Den of Flame"], "Den of Flame"},
					{ BabbleZone["Dreadmurk Shore"], "Dreadmurk Shore"},
					{ BabbleZone["Dustwallow Marsh"], "Dustwallow Marsh"},
					{ BabbleZone["Lost Point"], "Lost Point"},
				},
			},
			[10] = { 
				[BabbleZone["Felwood"]] = {
					{ BabbleZone["Bloodvenom Falls"], "Bloodvenom Falls"},
					{ BabbleZone["Emerald Sanctuary"], "Emerald Sanctuary"},
					{ BabbleZone["Felwood"], "Felwood"},
					{ BabbleZone["Jaedenar"], "Jaedenar"},
				},
			},
			[11] = { 
				[BabbleZone["Feralas"]] = {
					{ BabbleZone["Camp Mojache"], "Camp Mojache"},
					{ BabbleZone["Dire Maul"], "Dire Maul"},
					{ BabbleZone["Dream Bough"], "Dream Bough"},
					{ BabbleZone["Feathermoon Stronghold"], "Feathermoon Stronghold"},
					{ BabbleZone["Feralas"], "Feralas"},
					{ BabbleZone["Forgotten Coast"], "Forgotten Coast"},
					{ BabbleZone["Isle of Dread"], "Isle of Dread"},
				},
			},
			[12] = { 
				[BabbleZone["Moonglade"]] = {
					{ BabbleZone["Moonglade"], "Moonglade"},
				},
			},
			[13] = { 
				[BabbleZone["Mulgore"]] = {
					{ BabbleZone["Mulgore"], "Menethil Bay"},
					{ BabbleZone["Mulgore Mine"], "Mulgore Mine"},
					{ BabbleZone["The Bael'Dun Digsite"], "The Bael'Dun Digsite"},
					{ BabbleZone["Bloodhoof Village"], "Bloodhoof Village"},
					{ BabbleZone["Brambleblade Ravine"], "Brambleblade Ravine"},
					{ BabbleZone["Camp Narache"], "Camp Narache"},
					{ BabbleZone["Elder Rise"], "Elder Rise"},
					{ BabbleZone["Hunter Rise"], "Hunter Rise"},
				},
			},
			[14] = { 
				[BabbleZone["Orgrimmar"]] = {
					{ BabbleZone["Cleft of Shadow"], "Cleft of Shadow"},
					{ BabbleZone["Drag"], "Drag"},
					{ BabbleZone["Grommash Hold"], "Grommash Hold"},
					{ BabbleZone["Hidden Path"], "Hidden Path"},
				},
			},
			[15] = { 
				[BabbleZone["Silithus"]] = {
					{ BabbleZone["Cenarion Hold"], "Cenarion Hold"},
					{ BabbleZone["Hive'Ashi"], "Hive'Ashi"},
					{ BabbleZone["Hive'Regal"], "Hive'Regal"},
					{ BabbleZone["Hive'Zora"], "Hive'Zora"},
				},
			},
			[16] = { 
				[BabbleZone["Stonetalon Mountains"]] = {
					{ BabbleZone["Blackwolf River"], "Blackwolf River"},
					{ BabbleZone["Boulderslide Ravine"], "Boulderslide Ravine"},
					{ BabbleZone["Charred Vale"], "Charred Vale"},
					{ BabbleZone["Cragpool Lake"], "Cragpool Lake"},
					{ BabbleZone["The Den"], "The Den"},
					{ BabbleZone["Greatwood Vale"], "Greatwood Vale"},
					{ BabbleZone["Malaka'jin"], "Malaka'jin"},
					{ BabbleZone["Mirkfallon Lake"], "Mirkfallon Lake"},
				},
			},
			[17] = { 
				[BabbleZone["Tanaris"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
					{ BabbleZone["Caverns of Time"], "Caverns of Time"},
					{ BabbleZone["The Black Morass"], "The Black Morass"},
					{ BabbleZone["The Black Morass Portal"], "The Black Morass Portal"},
					{ BabbleZone["Dunemaul Compound"], "Dunemaul Compound"},
					{ BabbleZone["Eastmoon Ruins"], "Eastmoon Ruins"},
					{ BabbleZone["Gadgetzan"], "Gadgetzan"},
					{ BabbleZone["Gaping Chasm"], "Gaping Chasm"},
				},
			},
			[18] = { 
				[BabbleZone["Teldrassil"]] = {
					{ BabbleZone["Dolanaar"], "Dolanaar"},
					{ BabbleZone["Gm Island"], "Gm Island"},
					{ BabbleZone["Gnarlpine Hold"], "Gnarlpine Hold"},
					{ BabbleZone["Lake Al'Ameth"], "Lake Al'Ameth"},
				},
			},
			[19] = { 
				[BabbleZone["The Barrens"]] = {
					{ BabbleZone["Bael Modan"], "Bael Modan"},
					{ BabbleZone["Barrens"], "Barrens"},
					{ BabbleZone["Camp Taurajo"], "Camp Taurajo"},
					{ BabbleZone["Crossroads"], "Crossroads"},
					{ BabbleZone["Field of Giants"], "Field of Giants"},
					{ BabbleZone["Forgotten Pools"], "Forgotten Pools"},
					{ BabbleZone["Fray Island"], "Fray Island"},
					{ BabbleZone["Great Lift"], "Great Lift"},
					{ BabbleZone["Lushwater Oasis"], "Lushwater Oasis"},
					{ BabbleZone["Merchant Coast"], "Merchant Coast"},
				},
			},
			[20] = { 
				[BabbleZone["The Exodar"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[21] = { 
				[BabbleZone["Thousand Needles"]] = {
					{ BabbleZone["Freewind Post"], "Freewind Post"},
					{ BabbleZone["Darkcloud Pinnacle"], "Darkcloud Pinnacle"},
					{ BabbleZone["Highperch"], "Highperch"},
					{ BabbleZone["Mirage Raceway"], "Mirage Raceway"},

				},
			},
			[22] = { 
				[BabbleZone["Thunder Bluff"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[23] = { 
				[BabbleZone["Un'Goro Crater"]] = {
					{ BabbleZone["Fire Plume Ridge"], "Fire Plume Ridge"},
					{ BabbleZone["Fungal Rock"], "Fungal Rock"},
					{ BabbleZone["Golakka Hot Springs"], "Golakka Hot Springs"},
					{ BabbleZone["Lakkari Tar Pits"], "Lakkari Tar Pits"},
					{ BabbleZone["Marshal's Refuge"], "Marshal's Refuge"},
					{ BabbleZone["Marshlands"], "Marshlands"},
				},
			},
			[24] = { 
				[BabbleZone["Winterspring"]] = {
					{ BabbleZone["Darkwhisper Gorge"], "Darkwhisper Gorge"},
					{ BabbleZone["Everlook"], "Everlook"},
					{ BabbleZone["Frostfire Hot Springs"], "Frostfire Hot Springs"},
					{ BabbleZone["Frostsaber Rock"], "Frostsaber Rock"},
					{ BabbleZone["Frostwhisper Gorge"], "Frostwhisper Gorge"},
					{ BabbleZone["Hidden Grove"], "Hidden Grove"},
					{ BabbleZone["Mazthoril"], "Mazthoril"},
				},
			},
		},
	},
	[3] = {
		[AL["Outland"]] = {
			[1] = { 
				[BabbleZone["Hellfire Peninsula"]] = {
					{ BabbleZone["Dark Portal"], "Dark Portal"},
					{ BabbleZone["Falcon Watch"], "Falcon Watch"},
					{ BabbleZone["Fallen Sky Ridge"], "Fallen Sky Ridge"},
					{ BabbleZone["Hellfire Citadel"], "Hellfire Citadel"},
					{ BabbleZone["Hellfire Citadel Entrance"], "Hellfire Citadel Entrance"},
					{ BabbleZone["Hellfire Peninsula"], "Hellfire Peninsula"},
					{ BabbleZone["Honor Hold"], "Honor Hold"},
					{ BabbleZone["Magtheridon"], "Magtheridon"},
					{ BabbleZone["Manoroth Corpse"], "Manoroth Corpse"},
				},
			},
			[2] = { 
				[BabbleZone["Zangarmarsh"]] = {
					{ BabbleZone["Cenarion Refuge"], "Cenarion Refuge"},
					{ BabbleZone["Coilfang Reservoir"], "Coilfang Reservoir"},
					{ BabbleZone["Marshlight Lake"], "Marshlight Lake"},
				},
			},
			[3] = { 
				[BabbleZone["Blade's Edge Mountains"]] = {
					{ BabbleZone["Blade's Edge Mountains"], "Blade's Edge Mountains"},
					{ BabbleZone["Bladespire Hold"], "Bladespire Hold"},
					{ BabbleZone["Bladespire Outpost"], "Bladespire Outpost"},
					{ BabbleZone["Bloodmaul Outpost"], "Bloodmaul Outpost"},
					{ BabbleZone["Circle of Blood"], "Circle of Blood"},
					{ BabbleZone["Crystal Spine"], "Crystal Spine"},
					{ BabbleZone["Evergrove"], "Evergrove"},
					{ BabbleZone["Felstorm Point"], "Felstorm Point"},
					{ BabbleZone["Forge Camp Anger"], "Forge Camp Anger"},
					{ BabbleZone["Forge Camp Terror"], "Forge Camp Terror"},
					{ BabbleZone["Forge Camp Wrath"], "Forge Camp Wrath"},
					{ BabbleZone["Grishnath"], "Grishnath"},
					{ BabbleZone["Gruul's Lair"], "Gruul's Lair"},
					{ BabbleZone["Mok'Nathal Village"], "Mok'Nathal Village"},
				},
			},
			[4] = { 
				[BabbleZone["Netherstorm"]] = {
					{ BabbleZone["Arcatraz"], "Arcatraz"},
					{ BabbleZone["Area 52"], "Area 52"},
					{ BabbleZone["Arklon Ruins"], "Arklon Ruins"},
					{ BabbleZone["Botanica"], "Botanica"},
					{ BabbleZone["Cosmowrench"], "Cosmowrench"},
					{ BabbleZone["Kirin'Var Village"], "Kirin'Var Village"},
					{ BabbleZone["Manaforge B'naar"], "Manaforge B'naar"},
					{ BabbleZone["Manaforge Coruu"], "Manaforge Coruu"},
					{ BabbleZone["Manaforge Duro"], "Manaforge Duro"},
				},
			},
			[5] = { 
				[BabbleZone["Terokkar Forest"]] = {
					{ BabbleZone["Aldor Rise"], "Aldor Rise"},
					{ BabbleZone["Allerian Stronghold"], "Allerian Stronghold"},
					{ BabbleZone["Auchindoun"], "Auchindoun"},
					{ BabbleZone["Blackwind Lake"], "Blackwind Lake"},
					{ BabbleZone["Bleeding Hollow Ruins"], "Bleeding Hollow Ruins"},
					{ BabbleZone["Bonechewer Ruins"], "Bonechewer Ruins"},
					{ BabbleZone["Cenarion Thicket"], "Cenarion Thicket"},
					{ BabbleZone["Firewing Point"], "Firewing Point"},
				},
			},
			[6] = { 
				[BabbleZone["Shadowmoon Valley"]] = {
					{ BabbleZone["Altar Of Damnation"], "Altar Of Damnation"},
					{ BabbleZone["Black Temple"], "Black Temple"},
					{ BabbleZone["Coilskar Point"], "Coilskar Point"},
					{ BabbleZone["Deathforge"], "Deathforge"},
					{ BabbleZone["Legion Hold"], "Legion Hold"},
				},
			},
			[7] = { 
				[BabbleZone["Nagrand"]] = {
					{ BabbleZone["Nagrand"], "Nagrand"},
					{ BabbleZone["Garadar"], "Garadar"},
					{ BabbleZone["Halaa"], "Halaa"},
				},
			},
		},
	},
};