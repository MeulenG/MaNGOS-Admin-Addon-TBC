-- Lua Script for GM Commands
commands = {}
commands['account'] = {
    gmLevel = 0,
    syntax = '.account',
    description = 'Display the access level of your account.',
    execute = function(account)
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
        local com
        if account then
            com = string.format(".account")
            return com
        else
            Print("Invalid use of command")
        end
        SendChatMessage(com, "SAY")
    end
}

commands['account characters'] = {
    gmLevel = 3,
    syntax = '.account characters [#accountId|$accountName]',
    description = 'Show list all characters for account selected by provided #accountId or $accountName, or for selected player in game.',
    execute = function(account, accountId)
        -- Let's check access level
        if commands['account'].execute(account) < 3 then
            -- No go
            Print("Access level not high enough.")
        end
        local commandString
        if account then
            commandString = string.format(".account characters %s", account)
            return commandString
        elseif accountId then
            commandString = string.format(".account characters %s", accountId)
            return commandString
        else
            print("Invalid use of command")
            return
        end
    end    
}

commands['account create'] = {
    gmLevel = 4,
    syntax = '.account create $account $password',
    description = 'Create account and set password to it.',
    execute = function()
        Print("This requires level 4 access level, and needs to be typed in your server-side terminal. Syntax is: .account create $account $password")
    end
}

commands['account delete'] = {
    gmLevel = 4,
    syntax = '.account delete $account',
    description = 'Delete account with all characters.',
    execute = function()
        Print("This requires level 4 access level, and needs to be typed in your server-side terminal. Syntax is: .account delete $account")
    end
}

commands['account lock'] = {
    gmLevel = 0,
    syntax = '.account lock [on|off]',
    description = 'Allow login from account only from current used IP or remove this requirement.',
    execute = function(on, off)
        local commandString
        if commandString == "ON" or commandString== "OFF" then
            commandString = string.format(".account lock" .. on .. off)
        else
            Print("Invalid use of command. Syntax is:" .. commands['account lock'].syntax)
        end
    end
}

commands['account onlinelist'] = {
    gmLevel = 4,
    syntax = '.account onlinelist',
    description = 'Show list of online accounts.',
    execute = function()
        Print("This requires level 4 access level, and needs to be typed in your server-side terminal. Syntax is: " .. commands['account onlinelist'].syntax)
    end
}

commands['account password'] = {
    gmLevel = 0,
    syntax = '.account password $old_password $new_password $new_password',
    description = 'Change your account password.',
    execute = function(old_password, new_password)
        local commandString
        -- Let's make sure that new password isn't the old password
        if new_password == old_password then
            Print("New password can't be old password")
        elseif !new_password == old_password then
            commandString = string.format(".account password " .. old_password .. new_password .. new_password)
            return commandString
        else
            Print("Wrong syntax/invalid use. Syntax is: " .. commands['account password'].syntax)
        end
    end
}

commands['account set addon'] = {
    gmLevel = 3,
    syntax = '.account set addon [#accountId|$accountName] #addon',
    description = 'Set user (possible targeted) expansion addon level allowed. Addon values: 0 classic, 1 tbc, 2 wotlk.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
        
    end
}

commands['account set gmlevel'] = {
    gmLevel = 4,
    syntax = '.account set gmlevel [#accountId|$accountName] #level',
    description = 'Set the security level for targeted player (canâ€™t be used at self) or for #accountId or $accountName to a level of #level.; #level may range from 0 to 3.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
        Print("This requires level 4 access level, and needs to be typed in your server-side terminal. Syntax is: " .. commands['account set gmlevel'].syntax)
    end
}

commands['account set password'] = {
    gmLevel = 4,
    syntax = '.account set password (#accountId|$accountName) $password $password',
    description = 'Set password for account.',
    execute = function()
        Print("This requires level 4 access level, and needs to be typed in your server-side terminal. Syntax is: " .. commands['account set password'].syntax)
    end
}

commands['achievement'] = {
    gmLevel = 3,
    syntax = '.achievement $playername #achivementid',
    description = 'Show state achievment #achivmentid (can be shift link) and list of achievement criteria with progress data for selected player in game or by player name.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end

    end
}

commands['achievement add'] = {
    gmLevel = 3,
    syntax = '.achievement add $playername #achivementid',
    description = 'Complete achievement and all itâ€™s criteria for selected player in game or by player name. Command canâ€™t be used for counter achievements.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['achievement criteria add'] = {
    gmLevel = 3,
    syntax = '.achievement criteria add $playername #criteriaid #change',
    description = 'Increase progress for non-completed criteria at #change for selected player in game or by player name. If #chnage not provided then non-counter criteria progress set to completed state. For counter criteria increased at 1.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['achievement criteria remove'] = {
    gmLevel = 3,
    syntax = '.achievement criteria remove $playername #criteriaid #change',
    description = 'ecrease progress for criteria at #change for selected player in game or by player name. If #chnage not provided then criteria progress reset to 0.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['achievement remove'] = {
    gmLevel = 3,
    syntax = '.achievement remove $playername #achivementid',
    description = 'Remove complete state for achievement #achivmentid and reset all achievementâ€™s criteria for selected player in game or by player name. Also command can be used for reset counter achievements.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['additem'] = {
    gmLevel = 3,
    syntax = '.additem #itemid/[#itemname]/#shift-click-item-link #itemcount',
    description = 'Adds the specified number of items of id #itemid (or exact (!) name $itemname in brackets, or link created by shift-click at item in inventory or recipe) to your or selected character inventory. If #itemcount is omitted, only one item will be added.; .',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['additemset'] = {
    gmLevel = 3,
    syntax = '.additemset #itemsetid',
    description = 'Add items from itemset of id #itemsetid to your or selected character inventory. Will add by one example each item from itemset.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ahbot items amount'] = {
    gmLevel = 3,
    syntax = '.ahbot items amount $GreyItems $WhiteItems $GreenItems $BlueItems $PurpleItems $OrangeItems $YellowItems',
    description = 'Set amount of each items color be selled on auction.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ahbot items amount blue'] = {
    gmLevel = 3,
    syntax = '.ahbot items amount blue $BlueItems',
    description = 'Set amount of Blue color items be selled on auction.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ahbot items amount green'] = {
    gmLevel = 3,
    syntax = '.ahbot items amount green $GreenItems',
    description = 'Set amount of Green color items be selled on auction.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ahbot items amount grey'] = {
    gmLevel = 3,
    syntax = '.ahbot items amount grey $GreyItems',
    description = 'Set amount of Grey color items be selled on auction.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ahbot items amount orange'] = {
    gmLevel = 3,
    syntax = '.ahbot items amount orange $OrangeItems',
    description = 'Set amount of Orange color items be selled on auction.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ahbot items amount purple'] = {
    gmLevel = 3,
    syntax = '.ahbot items amount purple $PurpleItems',
    description = 'Set amount of Purple color items be selled on auction.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ahbot items amount white'] = {
    gmLevel = 3,
    syntax = '.ahbot items amount white $WhiteItems',
    description = 'Set amount of White color items be selled on auction.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ahbot items amount yellow'] = {
    gmLevel = 3,
    syntax = '.ahbot items amount yellow $YellowItems',
    description = 'Set amount of Yellow color items be selled on auction.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ahbot items ratio'] = {
    gmLevel = 3,
    syntax = '.ahbot items ratio $allianceratio $horderatio $neutralratio',
    description = 'Set ratio of items in 3 auctions house.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ahbot items ratio alliance'] = {
    gmLevel = 3,
    syntax = '.ahbot items ratio alliance $allianceratio',
    description = 'Set ratio of items in alliance auction house.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ahbot items ratio horde'] = {
    gmLevel = 3,
    syntax = '.ahbot items ratio horde $horderatio',
    description = 'Set ratio of items in horde auction house.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ahbot items ratio neutral'] = {
    gmLevel = 3,
    syntax = '.ahbot items ratio neutral $neutralratio',
    description = 'Set ratio of items in $neutral auction house.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ahbot rebuild'] = {
    gmLevel = 3,
    syntax = '.ahbot rebuild [all]',
    description = 'Expire all actual auction of ahbot except bided by player. Binded auctions included to expire if â€œallâ€ option used. Ahbot re-fill auctions base at current settings then.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ahbot reload'] = {
    gmLevel = 3,
    syntax = '.ahbot reload',
    description = 'Reload AHBot settings from configuration file.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ahbot status'] = {
    gmLevel = 3,
    syntax = '.ahbot status [all]',
    description = 'Show current ahbot state data in short form, and with â€œallâ€ with details.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['announce'] = {
    gmLevel = 1,
    syntax = '.announce $MessageToBroadcast',
    description = 'Send a global message to all players online in chat log.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['auction'] = {
    gmLevel = 3,
    syntax = '.auction',
    description = 'Show your team auction store.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['auction alliance'] = {
    gmLevel = 3,
    syntax = '.auction alliance',
    description = 'Show alliance auction store independent from your team.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['auction goblin'] = {
    gmLevel = 3,
    syntax = '.auction goblin',
    description = 'Show goblin auction store common for all teams.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['auction horde'] = {
    gmLevel = 3,
    syntax = '.auction horde',
    description = 'Show horde auction store independent from your team.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['auction item'] = {
    gmLevel = 3,
    syntax = '.auction item (alliance|horde|goblin) #itemid[:#itemcount] [[[#minbid] #buyout] [short|long|verylong]',
    description = 'Add new item (in many stackes if amount grater stack size) to specific auction house at short|long|verylogn perios similar same settings in auction in game dialog. Created auction not have owner.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['aura'] = {
    gmLevel = 3,
    syntax = '.aura #spellid',
    description = 'Add the aura from spell #spellid to the selected Unit.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ban account'] = {
    gmLevel = 3,
    syntax = '.ban account $Name $bantime $reason; Ban account kick player.; $bantime: negative value leads to permban, otherwise use a timestring like â€œ4d20h3sâ€.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ban character'] = {
    gmLevel = 3,
    syntax = '.ban character $Name $bantime $reason; Ban account and kick player.; $bantime: negative value leads to permban, otherwise use a timestring like â€œ4d20h3sâ€.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ban ip'] = {
    gmLevel = 3,
    syntax = '.ban ip $Ip $bantime $reason; Ban IP.; $bantime: negative value leads to permban, otherwise use a timestring like â€œ4d20h3sâ€.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['baninfo account'] = {
    gmLevel = 3,
    syntax = '.baninfo account $accountid; Watch full information about a specific ban.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['baninfo character'] = {
    gmLevel = 3,
    syntax = '.baninfo character $charactername; Watch full information about a specific ban.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['baninfo ip'] = {
    gmLevel = 3,
    syntax = '.baninfo ip $ip; Watch full information about a specific ban.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['bank'] = {
    gmLevel = 3,
    syntax = '.bank',
    description = 'Show your bank inventory.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['banlist account'] = {
    gmLevel = 3,
    syntax = '.banlist account [$Name]; Searches the banlist for a account name pattern or show full list account bans.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['banlist character'] = {
    gmLevel = 3,
    syntax = '.banlist character $Name; Searches the banlist for a character name pattern. Pattern required.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['banlist ip'] = {
    gmLevel = 3,
    syntax = '.banlist ip [$Ip]; Searches the banlist for a IP pattern or show full list of IP bans.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['cast'] = {
    gmLevel = 3,
    syntax = '.cast #spellid [triggered]; Cast #spellid to selected target. If no target selected cast to self. If â€˜trigeredâ€™ or part provided then spell casted with triggered flag.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['cast back'] = {
    gmLevel = 3,
    syntax = '.cast back #spellid [triggered]; Selected target will cast #spellid to your character. If â€˜trigeredâ€™ or part provided then spell casted with triggered flag.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['cast dist'] = {
    gmLevel = 3,
    syntax = '.cast dist #spellid [#dist [triggered]]; You will cast spell to pint at distance #dist. If â€˜trigeredâ€™ or part provided then spell casted with triggered flag. Not all spells can be casted as area spells.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['cast self'] = {
    gmLevel = 3,
    syntax = '.cast self #spellid [triggered]; Cast #spellid by target at target itself. If â€˜trigeredâ€™ or part provided then spell casted with triggered flag.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['cast target'] = {
    gmLevel = 3,
    syntax = '.cast target #spellid [triggered]; Selected target will cast #spellid to his victim. If â€˜trigeredâ€™ or part provided then spell casted with triggered flag.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['character achievements'] = {
    gmLevel = 2,
    syntax = '.character achievements [$player_name]',
    description = 'Show completed achievments for selected player or player find by $player_name.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['character customize'] = {
    gmLevel = 2,
    syntax = '.character customize [$name]',
    description = 'Mark selected in game or by $name in command character for customize at next login.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['character deleted delete'] = {
    gmLevel = 4,
    syntax = '.character deleted delete #guid|$name',
    description = 'Completely deletes the selected characters.; If $name is supplied, only characters with that string in their name will be deleted, if #guid is supplied, only the character with that GUID will be deleted.',
    execute = function()
        Print("This requires level 4 access level, and needs to be typed in your server-side terminal. Syntax is: .character deleted delete #guid|$name")
    end
}

commands['character deleted list'] = {
    gmLevel = 3,
    syntax = '.character deleted list [#guid|$name]',
    description = 'Shows a list with all deleted characters.; If $name is supplied, only characters with that string in their name will be selected, if #guid is supplied, only the character with that GUID will be selected.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['character deleted old'] = {
    gmLevel = 4,
    syntax = '.character deleted old [#keepDays]',
    description = 'Completely deletes all characters with deleted time longer #keepDays. If #keepDays not provided the used value from mangosd.conf option â€˜CharDelete.KeepDaysâ€™. If referenced config option disabled (use 0 value) then command canâ€™t be used without #keepDays.',
    execute = function()
        Print("This requires level 4 access level, and needs to be typed in your server-side terminal. Syntax is: .character deleted old [#keepDays]")
    end
}

commands['character deleted restore'] = {
    gmLevel = 3,
    syntax = '.character deleted restore #guid|$name [$newname] [#new account]',
    description = 'Restores deleted characters.; If $name is supplied, only characters with that string in their name will be restored, if $guid is supplied, only the character with that GUID will be restored.; If $newname is set, the character will be restored with that name instead of the original one. If #newaccount is set, the character will be restored to specific account character list. This works only with one character!',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['character erase'] = {
    gmLevel = 4,
    syntax = '.character erase $name',
    description = 'Delete character $name. Character finally deleted in case any deleting options.',
    execute = function()
        Print("This requires level 4 access level, and needs to be typed in your server-side terminal. Syntax is: .character erase $name")
    end
}

commands['character level'] = {
    gmLevel = 3,
    syntax = '.character level [$playername] [#level]',
    description = 'Set the level of character with $playername (or the selected if not name provided) by #numberoflevels Or +1 if no #numberoflevels provided). If #numberoflevels is omitted, the level will be increase by 1. If #numberoflevels is 0, the same level will be restarted. If no character is selected and name not provided, increase your level. Command can be used for offline character. All stats and dependent values recalculated. At level decrease talents can be reset if need. Also at level decrease equipped items with greater level requirement can be lost.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['character rename'] = {
    gmLevel = 2,
    syntax = '.character rename [$name]',
    description = 'Mark selected in game or by $name in command character for rename at next login.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['character reputation'] = {
    gmLevel = 2,
    syntax = '.character reputation [$player_name]',
    description = 'Show reputation information for selected player or player find by $player_name.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['character titles'] = {
    gmLevel = 2,
    syntax = '.character titles [$player_name]',
    description = 'Show known titles list for selected player or player find by $player_name.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['combatstop'] = {
    gmLevel = 2,
    syntax = '.combatstop [$playername]; Stop combat for selected character. If selected non-player then command applied to self. If $playername provided then attempt applied to online player $playername.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['commands'] = {
    gmLevel = 0,
    syntax = '.commands',
    description = 'Display a list of available commands for your account level.',
    execute = function()
    end
}

commands['cooldown'] = {
    gmLevel = 3,
    syntax = '.cooldown [#spell_id]',
    description = 'Remove all (if spell_id not provided) or #spel_id spell cooldown from selected character or you (if no selection).',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['damage'] = {
    gmLevel = 3,
    syntax = '.damage $damage_amount [$school [$spellid]]',
    description = 'Apply $damage to target. If not $school and $spellid provided then this flat clean melee damage without any modifiers. If $school provided then damage modified by armor reduction (if school physical), and target absorbing modifiers and result applied as melee damage to target. If spell provided then damage modified and applied as spell damage. $spellid can be shift-link.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['debug anim'] = {
    gmLevel = 2,
    syntax = '.debug anim #emoteid',
    description = 'Play emote #emoteid for your character.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['debug arena'] = {
    gmLevel = 3,
    syntax = '.debug arena',
    description = 'Toggle debug mode for arenas. In debug mode GM can start arena with single player.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['debug bg'] = {
    gmLevel = 3,
    syntax = '.debug bg',
    description = 'Toggle debug mode for battlegrounds. In debug mode GM can start battleground with single player.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['debug getitemvalue'] = {
    gmLevel = 3,
    syntax = '.debug getitemvalue #itemguid #field [int|hex|bit|float]',
    description = 'Get the field #field of the item #itemguid in your inventroy.; Use type arg for set output format: int (decimal number), hex (hex value), bit (bitstring), float. By default use integer output.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['debug getvalue'] = {
    gmLevel = 3,
    syntax = '.debug getvalue #field [int|hex|bit|float]',
    description = 'Get the field #field of the selected target. If no target is selected, get the content of your field.; Use type arg for set output format: int (decimal number), hex (hex value), bit (bitstring), float. By default use integer output.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['debug moditemvalue'] = {
    gmLevel = 3,
    syntax = '.debug moditemvalue #guid #field [int|float| &= | |= | &=~ ] #value',
    description = 'Modify the field #field of the item #itemguid in your inventroy by value #value.; Use type arg for set mode of modification: int (normal add/subtract #value as decimal number), float (add/subtract #value as float number), &= (bit and, set to 0 all bits in value if it not set to 1 in #value as hex number), |= (bit or, set to 1 all bits in value if it set to 1 in #value as hex number), &=~ (bit and not, set to 0 all bits in value if it set to 1 in #value as hex number). By default expect integer add/subtract.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['debug modvalue'] = {
    gmLevel = 3,
    syntax = '.debug modvalue #field [int|float| &= | |= | &=~ ] #value',
    description = 'Modify the field #field of the selected target by value #value. If no target is selected, set the content of your field.; Use type arg for set mode of modification: int (normal add/subtract #value as decimal number), float (add/subtract #value as float number), &= (bit and, set to 0 all bits in value if it not set to 1 in #value as hex number), |= (bit or, set to 1 all bits in value if it set to 1 in #value as hex number), &=~ (bit and not, set to 0 all bits in value if it set to 1 in #value as hex number). By default expect integer add/subtract.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['debug play cinematic'] = {
    gmLevel = 1,
    syntax = '.debug play cinematic #cinematicid',
    description = 'Play cinematic #cinematicid for you. You stay at place while your mind fly.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['debug play movie'] = {
    gmLevel = 1,
    syntax = '.debug play movie #movieid',
    description = 'Play movie #movieid for you.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['debug play sound'] = {
    gmLevel = 1,
    syntax = '.debug play sound #soundid',
    description = 'Play sound with #soundid.; Sound will be play only for you. Other players do not hear this.; Warning: client may have more 5000 soundsâ€¦',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['debug setitemvalue'] = {
    gmLevel = 3,
    syntax = '.debug setitemvalue #guid #field [int|hex|bit|float] #value',
    description = 'Set the field #field of the item #itemguid in your inventroy to value #value.; Use type arg for set input format: int (decimal number), hex (hex value), bit (bitstring), float. By default expect integer input format.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['debug setvalue'] = {
    gmLevel = 3,
    syntax = '.debug setvalue #field [int|hex|bit|float] #value',
    description = 'Set the field #field of the selected target to value #value. If no target is selected, set the content of your field.; Use type arg for set input format: int (decimal number), hex (hex value), bit (bitstring), float. By default expect integer input format.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['debug spellcoefs'] = {
    gmLevel = 3,
    syntax = '.debug spellcoefs #spellid',
    description = 'Show default calculated and DB stored coefficients for direct/dot heal/damage.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['debug spellmods'] = {
    gmLevel = 3,
    syntax = '.debug spellmods (flat|pct) #spellMaskBitIndex #spellModOp #value',
    description = 'Set at client side spellmod affect for spell that have bit set with index #spellMaskBitIndex in spell family mask for values dependent from spellmod #spellModOp to #value.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['delticket'] = {
    gmLevel = 2,
    syntax = '.delticket all; .delticket #num; .delticket $character_name',
    description = 'all to dalete all tickets at server, $character_name to delete ticket of this character, #num to delete ticket #num.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['demorph'] = {
    gmLevel = 2,
    syntax = '.demorph',
    description = 'Demorph the selected player.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['die'] = {
    gmLevel = 3,
    syntax = '.die',
    description = 'Kill the selected player. If no player is selected, it will kill you.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['dismount'] = {
    gmLevel = 0,
    syntax = '.dismount',
    description = 'Dismount you, if you are mounted.',
    execute = function()
    end
}

commands['distance'] = {
    gmLevel = 3,
    syntax = '.distance [$name/$link]',
    description = 'Display the distance from your character to the selected creature/player, or player with name $name, or player/creature/gameobject pointed to shift-link with guid.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['event'] = {
    gmLevel = 2,
    syntax = '.event #event_id; Show details about event with #event_id.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['event list'] = {
    gmLevel = 2,
    syntax = '.event list; Show list of currently active events.; Show list of all events',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['event start'] = {
    gmLevel = 2,
    syntax = '.event start #event_id; Start event #event_id. Set start time for event to current moment (change not saved in DB).',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['event stop'] = {
    gmLevel = 2,
    syntax = '.event stop #event_id; Stop event #event_id. Set start time for event to time in past that make current moment is event stop time (change not saved in DB).',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['explorecheat'] = {
    gmLevel = 3,
    syntax = '.explorecheat #flag',
    description = 'Reveal or hide all maps for the selected player. If no player is selected, hide or reveal maps to you.; Use a #flag of value 1 to reveal, use a #flag value of 0 to hide all maps.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['flusharenapoints'] = {
    gmLevel = 3,
    syntax = '.flusharenapoints',
    description = 'Use it to distribute arena points based on arena team ratings, and start a new week.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['gearscore'] = {
    gmLevel = 3,
    syntax = '.gearscore [#withBags] [#withBank]',
    description = 'Show selected playerâ€™s gear score. Check items in bags if #withBags != 0 and check items in Bank if #withBank != 0. Default: 1 for bags and 0 for bank',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['gm'] = {
    gmLevel = 1,
    syntax = '.gm [on/off]',
    description = 'Enable or Disable in game GM MODE or show current state of on/off not provided.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['gm chat'] = {
    gmLevel = 1,
    syntax = '.gm chat [on/off]',
    description = 'Enable or disable chat GM MODE (show gm badge in messages) or show current state of on/off not provided.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['gm fly'] = {
    gmLevel = 3,
    syntax = '.gm fly [on/off]; Enable/disable gm fly mode.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['gm ingame'] = {
    gmLevel = 0,
    syntax = '.gm ingame',
    description = 'Display a list of available in game Game Masters.',
    execute = function()
    end
}

commands['gm list'] = {
    gmLevel = 3,
    syntax = '.gm list',
    description = 'Display a list of all Game Masters accounts and security levels.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['gm setview'] = {
    gmLevel = 1,
    syntax = '.gm setview',
    description = 'Set farsight view on selected unit. Select yourself to set view back.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['gm visible'] = {
    gmLevel = 1,
    syntax = '.gm visible on/off',
    description = 'Output current visibility state or make GM visible(on) and invisible(off) for other players.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['go'] = {
    gmLevel = 1,
    syntax = '.go [$playername|pointlink|#x #y #z [#mapid]]; Teleport your character to point with coordinates of player $playername, or coordinates of one from shift-link types: player, tele, taxinode, creature/creature_entry, gameobject/gameobject_entry, or explicit #x #y #z #mapid coordinates.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['go creature'] = {
    gmLevel = 1,
    syntax = '.go creature (#creature_guid|$creature_name|id #creature_id); Teleport your character to creature with guid #creature_guid, or teleport your character to creature with name including as part $creature_name substring, or teleport your character to a creature that was spawned from the template with this entry #creature_id.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['go graveyard'] = {
    gmLevel = 1,
    syntax = '.go graveyard #graveyardId; Teleport to graveyard with the graveyardId specified.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['go grid'] = {
    gmLevel = 1,
    syntax = '.go grid #gridX #gridY [#mapId]',
    description = 'Teleport the gm to center of grid with provided indexes at map #mapId (or current map if it not provided).',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['go object'] = {
    gmLevel = 1,
    syntax = '.go object (#gameobject_guid|$gameobject_name|id #gameobject_id); Teleport your character to gameobject with guid #gameobject_guid, or teleport your character to gameobject with name including as part $gameobject_name substring, or teleport your character to a gameobject that was spawned from the template with this entry #gameobject_id.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['go taxinode'] = {
    gmLevel = 1,
    syntax = '.go taxinode #taxinode',
    description = 'Teleport player to taxinode coordinates. You can look up zone using .lookup taxinode $namepart',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['go trigger'] = {
    gmLevel = 1,
    syntax = '.go trigger (#trigger_id|$trigger_shift-link|$trigger_target_shift-link) [target]',
    description = 'Teleport your character to areatrigger with id #trigger_id or trigger id associated with shift-link. If additional arg â€œtargetâ€ provided then character will teleported to areatrigger target point.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['go xy'] = {
    gmLevel = 1,
    syntax = '.go xy #x #y [#mapid]',
    description = 'Teleport player to point with (#x,#y) coordinates at ground(water) level at map #mapid or same map if #mapid not provided.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['go xyz'] = {
    gmLevel = 1,
    syntax = '.go xyz #x #y #z [#mapid]',
    description = 'Teleport player to point with (#x,#y,#z) coordinates at ground(water) level at map #mapid or same map if #mapid not provided.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['go zonexy'] = {
    gmLevel = 1,
    syntax = '.go zonexy #x #y [#zone]',
    description = 'Teleport player to point with (#x,#y) client coordinates at ground(water) level in zone #zoneid or current zone if #zoneid not provided. You can look up zone using .lookup area $namepart',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['gobject add'] = {
    gmLevel = 2,
    syntax = '.gobject add #id',
    description = 'Add a game object from game object templates to the world at your current location using the #id.; spawntimesecs sets the spawntime, it is optional.; Note: this is a copy of .gameobject.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['gobject delete'] = {
    gmLevel = 2,
    syntax = '.gobject delete #go_guid; Delete gameobject with guid #go_guid.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['gobject move'] = {
    gmLevel = 2,
    syntax = '.gobject move #goguid [#x #y #z]',
    description = 'Move gameobject #goguid to character coordinates (or to (#x,#y,#z) coordinates if its provide).',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['gobject near'] = {
    gmLevel = 2,
    syntax = '.gobject near [#distance]',
    description = 'Output gameobjects at distance #distance from player. Output gameobject guids and coordinates sorted by distance from character. If #distance not provided use 10 as default value.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['gobject setphase'] = {
    gmLevel = 2,
    syntax = '.gobject setphase #guid #phasemask',
    description = 'Gameobject with DB guid #guid phasemask changed to #phasemask with related world vision update for players. Gameobject state saved to DB and persistent.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['gobject target'] = {
    gmLevel = 2,
    syntax = '.gobject target [#go_id|#go_name_part]',
    description = 'Locate and show position nearest gameobject. If #go_id or #go_name_part provide then locate and show position of nearest gameobject with gameobject template id #go_id or name included #go_name_part as part.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['gobject turn'] = {
    gmLevel = 2,
    syntax = '.gobject turn #goguid [#z_angle]',
    description = 'Changes gameobject #goguid orientation (rotates gameobject around z axis). Optional parameters are (#y_angle,#x_angle) values that represents rotation angles around y and x axes.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['goname'] = {
    gmLevel = 1,
    syntax = '.goname [$charactername]',
    description = 'Teleport to the given character. Either specify the character name or click on the characterâ€™s portrait, e.g. when you are in a group. Character can be offline.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['gps'] = {
    gmLevel = 1,
    syntax = '.gps [$name|$shift-link]',
    description = 'Display the position information for a selected character or creature (also if player name $name provided then for named player, or if creature/gameobject shift-link provided then pointed creature/gameobject if it loaded). Position information includes X, Y, Z, and orientation, map Id and zone Id',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['groupgo'] = {
    gmLevel = 1,
    syntax = '.groupgo [$charactername]',
    description = 'Teleport the given character and his group to you. Teleported only online characters but original selected group member can be offline.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['guid'] = {
    gmLevel = 2,
    syntax = '.guid',
    description = 'Display the GUID for the selected character.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['guild create'] = {
    gmLevel = 2,
    syntax = '.guild create [$GuildLeaderName] â€œ$GuildNameâ€',
    description = 'Create a guild named $GuildName with the player $GuildLeaderName (or selected) as leader. Guild name must in quotes.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['guild delete'] = {
    gmLevel = 2,
    syntax = '.guild delete â€œ$GuildNameâ€',
    description = 'Delete guild $GuildName. Guild name must in quotes.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['guild invite'] = {
    gmLevel = 2,
    syntax = '.guild invite [$CharacterName] â€œ$GuildNameâ€',
    description = 'Add player $CharacterName (or selected) into a guild $GuildName. Guild name must in quotes.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['guild rank'] = {
    gmLevel = 2,
    syntax = '.guild rank $CharacterName #Rank',
    description = 'Set for $CharacterName rank #Rank in a guild.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['guild uninvite'] = {
    gmLevel = 2,
    syntax = '.guild uninvite [$CharacterName]',
    description = 'Remove player $CharacterName (or selected) from a guild.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['help'] = {
    gmLevel = 0,
    syntax = '.help [$command]',
    description = 'Display usage instructions for the given $command. If no $command provided show list available commands.',
    execute = function()
    end
}

commands['hidearea'] = {
    gmLevel = 3,
    syntax = '.hidearea #areaid',
    description = 'Hide the area of #areaid to the selected character. If no character is selected, hide this area to you.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['honor add'] = {
    gmLevel = 2,
    syntax = '.honor add $amount',
    description = 'Add a certain amount of honor (gained today) to the selected player.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['honor addkill'] = {
    gmLevel = 2,
    syntax = '.honor addkill',
    description = 'Add the targeted unit as one of your pvp kills today (you only get honor if itâ€™s a racial leader or a player)',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['honor updatekills'] = {
    gmLevel = 2,
    syntax = '.honor updatekills',
    description = 'Force the yesterdayâ€™s honor kill fields to be updated with todayâ€™s data, which will get reset for the selected player.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['instance listbinds'] = {
    gmLevel = 3,
    syntax = '.instance listbinds; Lists the binds of the selected player.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['instance savedata'] = {
    gmLevel = 3,
    syntax = '.instance savedata; Save the InstanceData for the current playerâ€™s map to the DB.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['instance stats'] = {
    gmLevel = 3,
    syntax = '.instance stats; Shows statistics about instances.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['instance unbind'] = {
    gmLevel = 3,
    syntax = '.instance unbind all; All of the selected playerâ€™s binds will be cleared.; .instance unbind #mapid; Only the specified #mapid instance will be cleared.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['itemmove'] = {
    gmLevel = 2,
    syntax = '.itemmove #sourceslotid #destinationslotid',
    description = 'Move an item from slots #sourceslotid to #destinationslotid in your inventory; Not yet implemented',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['kick'] = {
    gmLevel = 2,
    syntax = '.kick [$charactername]',
    description = 'Kick the given character name from the world. If no character name is provided then the selected player (except for yourself) will be kicked.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['learn'] = {
    gmLevel = 3,
    syntax = '.learn #spell [all]',
    description = 'Selected character learn a spell of id #spell. If â€˜allâ€™ provided then all ranks learned.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['learn all'] = {
    gmLevel = 3,
    syntax = '.learn all',
    description = 'Learn all big set different spell maybe useful for Administaror.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['learn all_crafts'] = {
    gmLevel = 2,
    syntax = '.learn crafts',
    description = 'Learn all professions and recipes.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['learn all_default'] = {
    gmLevel = 1,
    syntax = '.learn all_default [$playername]',
    description = 'Learn for selected/$playername player all default spells for his race/class and spells rewarded by completed quests.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['learn all_gm'] = {
    gmLevel = 2,
    syntax = '.learn all_gm',
    description = 'Learn all default spells for Game Masters.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['learn all_lang'] = {
    gmLevel = 1,
    syntax = '.learn all_lang',
    description = 'Learn all languages',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['learn all_myclass'] = {
    gmLevel = 3,
    syntax = '.learn all_myclass',
    description = 'Learn all spells and talents available for his class.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['learn all_mypettalents'] = {
    gmLevel = 3,
    syntax = '.learn all_mypettalents',
    description = 'Learn all talents for your pet available for his creature type (only for hunter pets).',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['learn all_myspells'] = {
    gmLevel = 3,
    syntax = '.learn all_myspells',
    description = 'Learn all spells (except talents and spells with first rank learned as talent) available for his class.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['learn all_mytalents'] = {
    gmLevel = 3,
    syntax = '.learn all_mytalents',
    description = 'Learn all talents (and spells with first rank learned as talent) available for his class.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['learn all_recipes'] = {
    gmLevel = 2,
    syntax = '.learn all_recipes [$profession]',
    description = 'Learns all recipes of specified profession and sets skill level to max.; Example: .learn all_recipes enchanting',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['levelup'] = {
    gmLevel = 3,
    syntax = '.levelup [$playername] [#numberoflevels]',
    description = 'Increase/decrease the level of character with $playername (or the selected if not name provided) by #numberoflevels Or +1 if no #numberoflevels provided). If #numberoflevels is omitted, the level will be increase by 1. If #numberoflevels is 0, the same level will be restarted. If no character is selected and name not provided, increase your level. Command can be used for offline character. All stats and dependent VALUESrecalculated. At level decrease talents can be reset if need. Also at level decrease equipped items with greater level requirement can be lost.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['linkgrave'] = {
    gmLevel = 3,
    syntax = '.linkgrave #graveyard_id [alliance|horde]',
    description = 'Link current zone to graveyard for any (or alliance/horde faction ghosts). This let character ghost from zone teleport to graveyard after die if graveyard is nearest from linked to zone and accept ghost of this faction. Add only single graveyard at another map and only if no graveyards linked (or planned linked at same map).',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['list creature'] = {
    gmLevel = 3,
    syntax = '.list creature #creature_id [#max_count]',
    description = 'Output creatures with creature id #creature_id found in world. Output creature guids and coordinates sorted by distance from character. Will be output maximum #max_count creatures. If #max_count not provided use 10 as default value.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['list item'] = {
    gmLevel = 3,
    syntax = '.list item #item_id [#max_count]',
    description = 'Output items with item id #item_id found in all character inventories, mails, auctions, and guild banks. Output item guids, item owner guid, owner account and owner name (guild name and guid in case guild bank). Will be output maximum #max_count items. If #max_count not provided use 10 as default value.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['list object'] = {
    gmLevel = 3,
    syntax = '.list object #gameobject_id [#max_count]',
    description = 'Output gameobjects with gameobject id #gameobject_id found in world. Output gameobject guids and coordinates sorted by distance from character. Will be output maximum #max_count gameobject. If #max_count not provided use 10 as default value.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['list talents'] = {
    gmLevel = 3,
    syntax = '.list talents',
    description = 'Show list all really known (as learned spells) talent rank spells for selected player or self.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['loadscripts'] = {
    gmLevel = 3,
    syntax = '.loadscripts $scriptlibraryname',
    description = 'Unload current and load the script library $scriptlibraryname or reload current if $scriptlibraryname omitted, in case you changed it while the server was running.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup account email'] = {
    gmLevel = 2,
    syntax = '.lookup account email $emailpart [#limit]',
    description = 'Searchs accounts, which email including $emailpart with optional parametr #limit of results. If #limit not provided expected 100.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup account ip'] = {
    gmLevel = 2,
    syntax = 'lookup account ip $ippart [#limit]',
    description = 'Searchs accounts, which last used ip inluding $ippart (textual) with optional parametr #$limit of results. If #limit not provided expected 100.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup account name'] = {
    gmLevel = 2,
    syntax = '.lookup account name $accountpart [#limit]',
    description = 'Searchs accounts, which username including $accountpart with optional parametr #limit of results. If #limit not provided expected 100.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup achievement'] = {
    gmLevel = 2,
    syntax = '.lookup $name; Looks up a achievement by $namepart, and returns all matches with their quest IDâ€™s. Achievement shift-links generated with information about achievment state for selected player. Also for completed achievments in list show complete date.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup area'] = {
    gmLevel = 1,
    syntax = '.lookup area $namepart',
    description = 'Looks up an area by $namepart, and returns all matches with their area IDâ€™s.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup creature'] = {
    gmLevel = 3,
    syntax = '.lookup creature $namepart',
    description = 'Looks up a creature by $namepart, and returns all matches with their creature IDâ€™s.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup currency'] = {
    gmLevel = 3,
    syntax = '.lookup currency $namepart',
    description = 'Looks up a currency by $namepart, and returns all matches.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup event'] = {
    gmLevel = 2,
    syntax = '.lookup event $name; Attempts to find the ID of the event with the provided $name.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup faction'] = {
    gmLevel = 3,
    syntax = '.lookup faction $name; Attempts to find the ID of the faction with the provided $name.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup item'] = {
    gmLevel = 3,
    syntax = '.lookup item $itemname',
    description = 'Looks up an item by $itemname, and returns all matches with their Item IDâ€™s.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup itemset'] = {
    gmLevel = 3,
    syntax = '.lookup itemset $itemname',
    description = 'Looks up an item set by $itemname, and returns all matches with their Item set IDâ€™s.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup object'] = {
    gmLevel = 3,
    syntax = '.lookup object $objname',
    description = 'Looks up an gameobject by $objname, and returns all matches with their Gameobject IDâ€™s.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup player account'] = {
    gmLevel = 2,
    syntax = '.lookup player account $accountpart [#limit]',
    description = 'Searchs players, which account username including $accountpart with optional parametr #limit of results. If #limit not provided expected 100.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup player email'] = {
    gmLevel = 2,
    syntax = '.lookup player email $emailpart [#limit]',
    description = 'Searchs players, which account email including $emailpart with optional parametr #limit of results. If #limit not provided expected 100.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup player ip'] = {
    gmLevel = 2,
    syntax = '.lookup player ip $ippart [#limit]',
    description = 'Searchs players, which account last used ip inluding $ippart (textual) with optional parametr #limit of results. If #limit not provided expected 100.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup pool'] = {
    gmLevel = 2,
    syntax = '.lookup pool $pooldescpart',
    description = 'List of pools (anywhere) with substring in description.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup quest'] = {
    gmLevel = 3,
    syntax = '.lookup quest $namepart',
    description = 'Looks up a quest by $namepart, and returns all matches with their quest IDâ€™s.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup skill'] = {
    gmLevel = 3,
    syntax = '.lookup skill $$namepart',
    description = 'Looks up a skill by $namepart, and returns all matches with their skill IDâ€™s.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup spell'] = {
    gmLevel = 3,
    syntax = '.lookup spell $namepart',
    description = 'Looks up a spell by $namepart, and returns all matches with their spell IDâ€™s.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup taxinode'] = {
    gmLevel = 3,
    syntax = '.lookup taxinode $substring',
    description = 'Search and output all taxinodes with provide $substring in name.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup tele'] = {
    gmLevel = 1,
    syntax = '.lookup tele $substring',
    description = 'Search and output all .tele command locations with provide $substring in name.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['lookup title'] = {
    gmLevel = 2,
    syntax = '.lookup title $$namepart',
    description = 'Looks up a title by $namepart, and returns all matches with their title IDâ€™s and indexâ€™s.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['mailbox'] = {
    gmLevel = 3,
    syntax = '.mailbox',
    description = 'Show your mailbox content.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['maxskill'] = {
    gmLevel = 3,
    syntax = '.maxskill; Sets all skills of the targeted player to their maximum VALUESfor its current level.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify aspeed'] = {
    gmLevel = 1,
    syntax = '.modify aspeed #rate',
    description = 'Modify all speeds -run,swim,run back,swim back- of the selected player to â€œnormalbase speed for this move typeâ€*rate. If no player is selected, modify your speed.; #rate may range from 0.1 to 10.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify bwalk'] = {
    gmLevel = 1,
    syntax = '.modify bwalk #rate',
    description = 'Modify the speed of the selected player while running backwards to â€œnormal walk back speedâ€*rate. If no player is selected, modify your speed.; #rate may range from 0.1 to 10.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify currency'] = {
    gmLevel = 2,
    syntax = '.modify currency $id $amount',
    description = 'Add $amount points of currency $id to the selected player.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify drunk'] = {
    gmLevel = 1,
    syntax = '.modify drunk #value; Set drunk level to #value (0..100). Value 0 remove drunk state, 100 is max drunked state.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify energy'] = {
    gmLevel = 1,
    syntax = '.modify energy #energy',
    description = 'Modify the energy of the selected player. If no player is selected, modify your energy.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify faction'] = {
    gmLevel = 1,
    syntax = '.modify faction #factionid #flagid #npcflagid #dynamicflagid',
    description = 'Modify the faction and flags of the selected creature. Without arguments, display the faction and flags of the selected creature.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify fly'] = {
    gmLevel = 1,
    syntax = '.modify fly #rate; .fly #rate',
    description = 'Modify the flying speed of the selected player to â€œnormal base fly speedâ€*rate. If no player is selected, modify your fly.; #rate may range from 0.1 to 10.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify gender'] = {
    gmLevel = 2,
    syntax = '.modify gender male/female',
    description = 'Change gender of selected player.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify hp'] = {
    gmLevel = 1,
    syntax = '.modify hp #newhp',
    description = 'Modify the hp of the selected player. If no player is selected, modify your hp.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify mana'] = {
    gmLevel = 1,
    syntax = '.modify mana #newmana',
    description = 'Modify the mana of the selected player. If no player is selected, modify your mana.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify money'] = {
    gmLevel = 1,
    syntax = '.modify money #money; .money #money',
    description = 'Add or remove money to the selected player. If no player is selected, modify your money.; #gold can be negative to remove money.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify morph'] = {
    gmLevel = 2,
    syntax = '.modify morph #displayid',
    description = 'Change your current model id to #displayid.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify mount'] = {
    gmLevel = 1,
    syntax = '.modify mount #id #speed; Display selected player as mounted at #id creature and set speed to #speed value.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify phase'] = {
    gmLevel = 3,
    syntax = '.modify phase #phasemask',
    description = 'Selected character phasemask changed to #phasemask with related world vision update. Change active until in game phase changed, or GM-mode enable/disable, or re-login. Character pts pasemask update to same value.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify rage'] = {
    gmLevel = 1,
    syntax = '.modify rage #newrage',
    description = 'Modify the rage of the selected player. If no player is selected, modify your rage.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify rep'] = {
    gmLevel = 2,
    syntax = '.modify rep #repId (#repvalue | $rankname [#delta]); Sets the selected players reputation with faction #repId to #repvalue or to $reprank.; If the reputation rank name is provided, the resulting reputation will be the lowest reputation for that rank plus the delta amount, if specified.; You can use â€˜.pinfo repâ€™ to list all known reputation ids, or use â€˜.lookup faction $nameâ€™ to locate a specific faction id.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify runicpower'] = {
    gmLevel = 1,
    syntax = '.modify runicpower #newrunicpower',
    description = 'Modify the runic power of the selected player. If no player is selected, modify your runic power.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify scale'] = {
    gmLevel = 1,
    syntax = '.modify scale #scale',
    description = 'Change model scale for targeted player (util relogin) or creature (until respawn).',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify speed'] = {
    gmLevel = 1,
    syntax = '.modify speed #rate; .speed #rate',
    description = 'Modify the running speed of the selected player to â€œnormal base run speedâ€*rate. If no player is selected, modify your speed.; #rate may range from 0.1 to 10.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify standstate'] = {
    gmLevel = 2,
    syntax = '.modify standstate #emoteid',
    description = 'Change the emote of your character while standing to #emoteid.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify swim'] = {
    gmLevel = 1,
    syntax = '.modify swim #rate',
    description = 'Modify the swim speed of the selected player to â€œnormal swim speedâ€*rate. If no player is selected, modify your speed.; #rate may range from 0.1 to 10.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['modify tp'] = {
    gmLevel = 1,
    syntax = '.modify tp #amount',
    description = 'Set free talent pointes for selected character or characterâ€™s pet. It will be reset to default expected at next levelup/login/quest reward.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['movegens'] = {
    gmLevel = 3,
    syntax = '.movegens; Show movement generators stack for selected creature or player.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['mute'] = {
    gmLevel = 1,
    syntax = '.mute [$playerName] $timeInMinutes',
    description = 'Disible chat messaging for any character from account of character $playerName (or currently selected) at $timeInMinutes minutes. Player can be offline.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['namego'] = {
    gmLevel = 1,
    syntax = '.namego [$charactername]',
    description = 'Teleport the given character to you. Character can be offline.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['neargrave'] = {
    gmLevel = 3,
    syntax = '.neargrave [alliance|horde]',
    description = 'Find nearest graveyard linked to zone (or only nearest from accepts alliance or horde faction ghosts).',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['notify'] = {
    gmLevel = 1,
    syntax = '.notify $MessageToBroadcast',
    description = 'Send a global message to all players online in screen.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc add'] = {
    gmLevel = 2,
    syntax = '.npc add #creatureid',
    description = 'Spawn a creature by the given template id of #creatureid.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc addcurrency'] = {
    gmLevel = 2,
    syntax = '.npc addcurrency #currencyId #buycount #extendedcost',
    description = 'Add currency #currencyId to item list of selected vendor.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc additem'] = {
    gmLevel = 2,
    syntax = '.npc additem #itemId <#maxcount><#incrtime><#extendedcost>r',
    description = 'Add item #itemid to item list of selected vendor. Also optionally set max count item in vendor item list and time to item count restoring and items ExtendedCost.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc addmove'] = {
    gmLevel = 2,
    syntax = '.npc addmove #creature_guid [#waittime]',
    description = 'Add your current location as a waypoint for creature with guid #creature_guid. And optional add wait time.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc addweapon'] = {
    gmLevel = 3,
    syntax = '',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc aiinfo'] = {
    gmLevel = 2,
    syntax = '.npc npc aiinfo',
    description = 'Show npc AI and script information.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc allowmove'] = {
    gmLevel = 3,
    syntax = '.npc allowmove',
    description = 'Enable or disable movement creatures in world. Not implemented.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc changelevel'] = {
    gmLevel = 2,
    syntax = '.npc changelevel #level',
    description = 'Change the level of the selected creature to #level.; #level may range from 1 to 63.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc delcurrency'] = {
    gmLevel = 2,
    syntax = '.npc delcurrency #currencyId',
    description = 'Remove currency #currencyId from item list of selected vendor.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc delete'] = {
    gmLevel = 2,
    syntax = '.npc delete [#guid]',
    description = 'Delete creature with guid #guid (or the selected if no guid is provided)',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc delitem'] = {
    gmLevel = 2,
    syntax = '.npc delitem #itemId',
    description = 'Remove item #itemid from item list of selected vendor.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc factionid'] = {
    gmLevel = 2,
    syntax = '.npc factionid #factionid',
    description = 'Set the faction of the selected creature to #factionid.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc flag'] = {
    gmLevel = 2,
    syntax = '.npc flag #npcflag',
    description = 'Set the NPC flags of creature template of the selected creature and selected creature to #npcflag. NPC flags will applied to all creatures of selected creature template after server restart or grid unload/load.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc follow'] = {
    gmLevel = 2,
    syntax = '.npc follow',
    description = 'Selected creature start follow you until death/fight/etc.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc info'] = {
    gmLevel = 3,
    syntax = '.npc info',
    description = 'Display a list of details for the selected creature.; The list includes:; â€" GUID, Faction, NPC flags, Entry ID, Model ID,; â€" Level,; â€" Health (current/maximum),; â€" Field flags, dynamic flags, faction template,; â€" Position information,; â€" and the creature type, e.g. if the creature is a vendor.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc move'] = {
    gmLevel = 2,
    syntax = '.npc move [#creature_guid]',
    description = 'Move the targeted creature spawn point to your coordinates.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc name'] = {
    gmLevel = 2,
    syntax = '.npc name $name',
    description = 'Change the name of the selected creature or character to $name.; Command disabled.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc playemote'] = {
    gmLevel = 3,
    syntax = '.npc playemote #emoteid',
    description = 'Make the selected creature emote with an emote of id #emoteid.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc say'] = {
    gmLevel = 1,
    syntax = '.npc say #text; Make the selected npc says #text.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc setdeathstate'] = {
    gmLevel = 2,
    syntax = '.npc setdeathstate on/off',
    description = 'Set default death state (dead/alive) for npc at spawn.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc setmodel'] = {
    gmLevel = 2,
    syntax = '.npc setmodel #displayid',
    description = 'Change the model id of the selected creature to #displayid.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc setmovetype'] = {
    gmLevel = 2,
    syntax = '.npc setmovetype [#creature_guid] stay/random/way [NODEL]',
    description = 'Set for creature pointed by #creature_guid (or selected if #creature_guid not provided) movement type and move it to respawn position (if creature alive). Any existing waypoints for creature will be removed from the database if you do not use NODEL. If the creature is dead then movement type will applied at creature respawn.; Make sure you use NODEL, if you want to keep the waypoints.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc setphase'] = {
    gmLevel = 2,
    syntax = '.npc setphase #phasemask',
    description = 'Selected unit or pet phasemask changed to #phasemask with related world vision update for players. In creature case state saved to DB and persistent. In pet case change active until in game phase changed for owner, owner re-login, or GM-mode enable/disable..',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc spawndist'] = {
    gmLevel = 2,
    syntax = '.npc spawndist #dist',
    description = 'Adjust spawndistance of selected creature to dist.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc spawntime'] = {
    gmLevel = 2,
    syntax = '.npc spawntime #time',
    description = 'Adjust spawntime of selected creature to time.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc subname'] = {
    gmLevel = 2,
    syntax = '.npc subname $Name',
    description = 'Change the subname of the selected creature or player to $Name.; Command disabled.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc tame'] = {
    gmLevel = 2,
    syntax = '.npc tame',
    description = 'Tame selected creature (tameable non pet creature). You donâ€™t must have pet.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc textemote'] = {
    gmLevel = 1,
    syntax = '.npc textemote #emoteid',
    description = 'Make the selected creature to do textemote with an emote of id #emoteid.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc unfollow'] = {
    gmLevel = 2,
    syntax = '.npc unfollow',
    description = 'Selected creature (non pet) stop follow you.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc whisper'] = {
    gmLevel = 1,
    syntax = '.npc whisper #playerguid #text; Make the selected npc whisper #text to #playerguid.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['npc yell'] = {
    gmLevel = 1,
    syntax = '.npc yell #text; Make the selected npc yells #text.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['pdump load'] = {
    gmLevel = 3,
    syntax = '.pdump load $filename $account [$newname] [$newguid]; Load character dump from dump file into character list of $account with saved or $newname, with saved (or first free) or $newguid guid.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['pdump write'] = {
    gmLevel = 3,
    syntax = '.pdump write $filename $playerNameOrGUID; Write character dump with name/guid $playerNameOrGUID to file $filename.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['pinfo'] = {
    gmLevel = 2,
    syntax = '.pinfo [$player_name]',
    description = 'Output account information for selected player or player find by $player_name.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['pool'] = {
    gmLevel = 2,
    syntax = '.pool #pool_id',
    description = 'Pool information and full list creatures/gameobjects included in pool.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['pool list'] = {
    gmLevel = 2,
    syntax = '.pool list',
    description = 'List of pools with spawn in current map (only work in instances. Non-instanceable maps share pool system state os useless attempt get all pols at all continents.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['pool spawns'] = {
    gmLevel = 2,
    syntax = '.pool spawns #pool_id',
    description = 'List current creatures/objects listed in pools (or in specific #pool_id) and spawned (added to grid data, not meaning show in world.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['quest add'] = {
    gmLevel = 3,
    syntax = '.quest add #quest_id',
    description = 'Add to character quest log quest #quest_id. Quest started from item canâ€™t be added by this command but correct .additem call provided in command output.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['quest complete'] = {
    gmLevel = 3,
    syntax = '.quest complete #questid; Mark all quest objectives as completed for target character active quest. After this target character can go and get quest reward.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['quest remove'] = {
    gmLevel = 3,
    syntax = '.quest remove #quest_id',
    description = 'Set quest #quest_id state to not completed and not active (and remove from active quest list) for selected player.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['quit'] = {
    gmLevel = 4,
    syntax = 'quit',
    description = 'Close RA connection. Command must be typed fully (quit).',
    execute = function()
        Print("This requires level 4 access level, and needs to be typed in your server-side terminal. Syntax is: " .. commands['quit'].syntax)
    end
}

commands['recall'] = {
    gmLevel = 1,
    syntax = '.recall [$playername]',
    description = 'Teleport $playername or selected player to the place where he has been before last use of a teleportation command. If no $playername is entered and no player is selected, it will teleport you.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['reload all'] = {
    gmLevel = 3,
    syntax = '.reload all',
    description = 'Reload all tables with reload support added and that can be _safe_ reloaded.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reload all_achievement'] = {
    gmLevel = 3,
    syntax = '.reload all_achievement',
    description = 'Reload all `achievement_*` tables if reload support added for this table and this table can be _safe_ reloaded.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reload all_area'] = {
    gmLevel = 3,
    syntax = '.reload all_area',
    description = 'Reload all `areatrigger_*` tables if reload support added for this table and this table can be _safe_ reloaded.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reload all_eventai'] = {
    gmLevel = 3,
    syntax = '.reload all_eventai',
    description = 'Reload `creature_ai_*` tables if reload support added for these tables and these tables can be _safe_ reloaded.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reload all_item'] = {
    gmLevel = 3,
    syntax = '.reload all_item',
    description = 'Reload `item_required_target`, `page_texts` and `item_enchantment_template` tables.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reload all_locales'] = {
    gmLevel = 3,
    syntax = '.reload all_locales',
    description = 'Reload all `locales_*` tables with reload support added and that can be _safe_ reloaded.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reload all_loot'] = {
    gmLevel = 3,
    syntax = '.reload all_loot',
    description = 'Reload all `*_loot_template` tables. This can be slow operation with lags for server run.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reload all_npc'] = {
    gmLevel = 3,
    syntax = '.reload all_npc',
    description = 'Reload `points_of_interest` and `npc_*` tables if reload support added for these tables and these tables can be _safe_ reloaded.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reload all_quest'] = {
    gmLevel = 3,
    syntax = '.reload all_quest',
    description = 'Reload all quest related tables if reload support added for this table and this table can be _safe_ reloaded.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reload all_scripts'] = {
    gmLevel = 3,
    syntax = '.reload all_scripts',
    description = 'Reload `*_scripts` tables.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reload all_spell'] = {
    gmLevel = 3,
    syntax = '.reload all_spell',
    description = 'Reload all `spell_*` tables with reload support added and that can be _safe_ reloaded.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reload config'] = {
    gmLevel = 3,
    syntax = '.reload config',
    description = 'Reload config settings (by default stored in mangosd.conf). Not all settings can be change at reload: some new setting values will be ignored until restart, some values will applied with delay or only to new objects/maps, some values will explicitly rejected to change at reload.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['repairitems'] = {
    gmLevel = 2,
    syntax = '.repairitems',
    description = 'Repair all selected playerâ€™s items.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['reset achievements'] = {
    gmLevel = 3,
    syntax = '.reset achievements [$playername]',
    description = 'Reset achievements data for selected or named (online or offline) character. Achievements for persistance progress data like completed quests/etc re-filled at reset. Achievements for events like kills/casts/etc will lost.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reset all'] = {
    gmLevel = 3,
    syntax = '.reset all spells',
    description = 'Syntax: .reset all talents; Request reset spells or talents (including talents for all characterâ€™s pets if any) at next login each existed character.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reset honor'] = {
    gmLevel = 3,
    syntax = '.reset honor [Playername]; Reset all honor data for targeted character.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reset level'] = {
    gmLevel = 3,
    syntax = '.reset level [Playername]; Reset level to 1 including reset stats and talents. Equipped items with greater level requirement can be lost.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reset specs'] = {
    gmLevel = 3,
    syntax = '.reset specs [Playername]; Removes all talents (for all specs) of the targeted player or named player. Playername can be name of offline character. With player talents also will be reset talents for all characterâ€™s pets if any.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reset spells'] = {
    gmLevel = 3,
    syntax = '.reset spells [Playername]; Removes all non-original spells from spellbook.; . Playername can be name of offline character.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reset stats'] = {
    gmLevel = 3,
    syntax = '.reset stats [Playername]; Resets(recalculate) all stats of the targeted player to their original VALUESat current level.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['reset talents'] = {
    gmLevel = 3,
    syntax = '.reset talents [Playername]; Removes all talents (current spec) of the targeted player or pet or named player. With player talents also will be reset talents for all characterâ€™s pets if any.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['respawn'] = {
    gmLevel = 3,
    syntax = '.respawn',
    description = 'Respawn selected creature or respawn all nearest creatures (if none selected) and GO without waiting respawn time expiration.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['revive'] = {
    gmLevel = 3,
    syntax = '.revive',
    description = 'Revive the selected player. If no player is selected, it will revive you.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['save'] = {
    gmLevel = 0,
    syntax = '.save',
    description = 'Saves your character.',
    execute = function()
    end
}

commands['saveall'] = {
    gmLevel = 1,
    syntax = '.saveall',
    description = 'Save all characters in game.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['send items'] = {
    gmLevel = 3,
    syntax = '.send items #playername â€œ#subjectâ€ â€œ#textâ€ itemid1[:count1] itemid2[:count2] â€¦ itemidN[:countN]',
    description = 'Send a mail to a player. Subject and mail text must be in â€œâ€. If for itemid not provided related count values then expected 1, if count > max items in stack then items will be send in required amount stacks. All stacks amount in mail limited to 12.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['send mail'] = {
    gmLevel = 1,
    syntax = '.send mail #playername â€œ#subjectâ€ â€œ#textâ€',
    description = 'Send a mail to a player. Subject and mail text must be in â€œâ€.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['send mass items'] = {
    gmLevel = 3,
    syntax = '.send mass items #racemask|$racename|alliance|horde|all â€œ#subjectâ€ â€œ#textâ€ itemid1[:count1] itemid2[:count2] â€¦ itemidN[:countN]',
    description = 'Send a mail to players. Subject and mail text must be in â€œâ€. If for itemid not provided related count values then expected 1, if count > max items in stack then items will be send in required amount stacks. All stacks amount in mail limited to 12.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['send mass mail'] = {
    gmLevel = 3,
    syntax = '.send mass mail #racemask|$racename|alliance|horde|all â€œ#subjectâ€ â€œ#textâ€',
    description = 'Send a mail to players. Subject and mail text must be in â€œâ€.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['send mass money'] = {
    gmLevel = 3,
    syntax = '.send mass money #racemask|$racename|alliance|horde|all â€œ#subjectâ€ â€œ#textâ€ #money',
    description = 'Send mail with money to players. Subject and mail text must be in â€œâ€.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['send message'] = {
    gmLevel = 3,
    syntax = '.send message $playername $message',
    description = 'Send screen message to player from ADMINISTRATOR.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['send money'] = {
    gmLevel = 3,
    syntax = '.send money #playername â€œ#subjectâ€ â€œ#textâ€ #money',
    description = 'Send mail with money to a player. Subject and mail text must be in â€œâ€.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['server corpses'] = {
    gmLevel = 2,
    syntax = '.server corpses',
    description = 'Triggering corpses expire check in world.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['server exit'] = {
    gmLevel = 4,
    syntax = '.server exit',
    description = 'Terminate mangosd NOW. Exit code 0.',
    execute = function()
        Print("This requires level 4 access level, and needs to be typed in your server-side terminal. Syntax is: " .. commands['server exit'].syntax)
    end
}

commands['server idlerestart'] = {
    gmLevel = 3,
    syntax = '.server idlerestart #delay',
    description = 'Restart the server after #delay seconds if no active connections are present (no players). Use #exist_code or 2 as program exist code.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['server idlerestart cancel'] = {
    gmLevel = 3,
    syntax = '.server idlerestart cancel',
    description = 'Cancel the restart/shutdown timer if any.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['server idleshutdown'] = {
    gmLevel = 3,
    syntax = '.server idleshutdown #delay [#exist_code]',
    description = 'Shut the server down after #delay seconds if no active connections are present (no players). Use #exist_code or 0 as program exist code.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['server idleshutdown cancel'] = {
    gmLevel = 3,
    syntax = '.server idleshutdown cancel',
    description = 'Cancel the restart/shutdown timer if any.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['server info'] = {
    gmLevel = 0,
    syntax = '.server info',
    description = 'Display server version and the number of connected players.',
    execute = function()
    end
}

commands['server log filter'] = {
    gmLevel = 4,
    syntax = '.server log filter [($filtername|all) (on|off)]',
    description = 'Show or set server log filters. If used â€œallâ€ then all filters will be set to on/off state.',
    execute = function()
        Print("This requires level 4 access level, and needs to be typed in your server-side terminal. Syntax is: " .. commands['server log filter'].syntax)
    end
}

commands['server log level'] = {
    gmLevel = 4,
    syntax = '.server log level [#level]',
    description = 'Show or set server log level (0 â€" errors only, 1 â€" basic, 2 â€" detail, 3 â€" debug).',
    execute = function()
        Print("This requires level 4 access level, and needs to be typed in your server-side terminal. Syntax is: " .. commands['server log level'].syntax)
    end
}

commands['server motd'] = {
    gmLevel = 0,
    syntax = '.server motd',
    description = 'Show server Message of the day.',
    execute = function()
    end
}

commands['server plimit'] = {
    gmLevel = 3,
    syntax = '.server plimit [#num|-1|-2|-3|reset|player|moderator|gamemaster|administrator]',
    description = 'Without arg show current player amount and security level limitations for login to server, with arg set player linit ($num > 0) or securiti limitation ($num < 0 or security leme name. With `reset` sets player limit to the one in the config file',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['server restart'] = {
    gmLevel = 3,
    syntax = '.server restart #delay',
    description = 'Restart the server after #delay seconds. Use #exist_code or 2 as program exist code.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['server restart cancel'] = {
    gmLevel = 3,
    syntax = '.server restart cancel',
    description = 'Cancel the restart/shutdown timer if any.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['server set motd'] = {
    gmLevel = 3,
    syntax = '.server set motd $MOTD',
    description = 'Set server Message of the day.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['server shutdown'] = {
    gmLevel = 3,
    syntax = '.server shutdown #delay [#exit_code]',
    description = 'Shut the server down after #delay seconds. Use #exit_code or 0 as program exit code.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['server shutdown cancel'] = {
    gmLevel = 3,
    syntax = '.server shutdown cancel',
    description = 'Cancel the restart/shutdown timer if any.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['setskill'] = {
    gmLevel = 3,
    syntax = '.setskill #skill #level [#max]',
    description = 'Set a skill of id #skill with a current skill value of #level and a maximum value of #max (or equal current maximum if not provide) for the selected character. If no character is selected, you learn the skill.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['showarea'] = {
    gmLevel = 3,
    syntax = '.showarea #areaid',
    description = 'Reveal the area of #areaid to the selected character. If no character is selected, reveal this area to you.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['stable'] = {
    gmLevel = 3,
    syntax = '.stable',
    description = 'Show your pet stable.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['start'] = {
    gmLevel = 0,
    syntax = '.start',
    description = 'Teleport you to the starting area of your character.',
    execute = function()
    end
}

commands['taxicheat'] = {
    gmLevel = 1,
    syntax = '.taxicheat on/off',
    description = 'Temporary grant access or remove to all taxi routes for the selected character. If no character is selected, hide or reveal all routes to you.; Visited taxi nodes sill accessible after removing access.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['tele'] = {
    gmLevel = 1,
    syntax = '.tele #location',
    description = 'Teleport player to a given location.',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['tele add'] = {
    gmLevel = 3,
    syntax = '.tele add $name',
    description = 'Add current your position to .tele command target locations list with name $name.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['tele del'] = {
    gmLevel = 3,
    syntax = '.tele del $name',
    description = 'Remove location with name $name for .tele command locations list.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['tele group'] = {
    gmLevel = 1,
    syntax = '.tele group#location',
    description = 'Teleport a selected player and his group members to a given location.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['tele name'] = {
    gmLevel = 1,
    syntax = '.tele name [#playername] #location',
    description = 'Teleport the given character to a given location. Character can be offline.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['ticket'] = {
    gmLevel = 2,
    syntax = '.ticket on; .ticket off; .ticket #num; .ticket $character_name; .ticket respond #num $response; .ticket respond $character_name $response',
    description = 'on/off for GMs to show or not a new ticket directly, $character_name to show ticket of this character, #num to show ticket #num.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['titles add'] = {
    gmLevel = 2,
    syntax = '.titles add #title; Add title #title (id or shift-link) to known titles list for selected player.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['titles current'] = {
    gmLevel = 2,
    syntax = '.titles current #title; Set title #title (id or shift-link) as current selected titl for selected player. If title not in known title list for player then it will be added to list.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['titles remove'] = {
    gmLevel = 2,
    syntax = '.titles remove #title; Remove title #title (id or shift-link) from known titles list for selected player.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['titles setmask'] = {
    gmLevel = 2,
    syntax = '.titles setmask #mask',
    description = 'Allows user to use all titles from #mask.; #mask=0 disables the title-choose-field',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['trigger'] = {
    gmLevel = 2,
    syntax = '.trigger [#trigger_id|$trigger_shift-link|$trigger_target_shift-link]',
    description = 'Show detail infor about areatrigger with id #trigger_id or trigger id associated with shift-link. If areatrigger id or shift-link not provided then selected nearest areatrigger at current map.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['trigger active'] = {
    gmLevel = 2,
    syntax = '.trigger active',
    description = 'Show list of areatriggers with activation zone including current character position.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['trigger near'] = {
    gmLevel = 2,
    syntax = '.trigger near [#distance]',
    description = 'Output areatriggers at distance #distance from player. If #distance not provided use 10 as default value.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['unaura'] = {
    gmLevel = 3,
    syntax = '.unaura #spellid',
    description = 'Remove aura due to spell #spellid from the selected Unit.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['unban account'] = {
    gmLevel = 3,
    syntax = '.unban account $Name; Unban accounts for account name pattern.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['unban character'] = {
    gmLevel = 3,
    syntax = '.unban character $Name; Unban accounts for character name pattern.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['unban ip'] = {
    gmLevel = 3,
    syntax = '',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['unlearn'] = {
    gmLevel = 3,
    syntax = '.unlearn #spell [all]',
    description = 'Unlearn for selected player a spell #spell. If â€˜allâ€™ provided then all ranks unlearned.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['unmute'] = {
    gmLevel = 1,
    syntax = '.unmute $playerName',
    description = 'Restore chat messaging for any character from account of character $playerName.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['waterwalk'] = {
    gmLevel = 2,
    syntax = '.waterwalk on/off',
    description = 'Set on/off waterwalk state for selected player.',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['wchange'] = {
    gmLevel = 3,
    syntax = '.wchange #weathertype #status',
    description = 'Set current weather to #weathertype with an intensity of #status.; #weathertype can be 1 for rain, 2 for snow, and 3 for sand. #status can be 0 for disabled, and 1 for enabled.',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['whispers'] = {
    gmLevel = 1,
    syntax = '.whispers on|off; Enable/disable accepting whispers by GM from players. By default use mangosd.conf setting.',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 1 then
            Print("Account access level not high enough")
        end
    end
}

commands['wp add'] = {
    gmLevel = 2,
    syntax = '.wp add [#creature_guid or Select a Creature]',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['wp export'] = {
    gmLevel = 3,
    syntax = '.wp export [#creature_guid or Select a Creature] $filename',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['wp import'] = {
    gmLevel = 3,
    syntax = '.wp import $filename',
    description = 'nan',
    execute = function()
        if commands['account'].gmLevel < 3 then
            Print("Account access level not high enough")
        end
    end
}

commands['wp modify'] = {
    gmLevel = 2,
    syntax = '.wp modify [#creature_guid or Select a Creature]; add â€" Add a waypoint after the selected visual; waittime $time; emote ID; spell ID; text1| text2| text3| text4| text5 ; model1 ID; model2 ID; move(moves wp to player pos); del (deletes the wp)',
    description = 'Only one parameter per time!',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}

commands['wp show'] = {
    gmLevel = 2,
    syntax = '.wp show [#creature_guid or Select a Creature]; on; first; last; off; info',
    description = 'For using info you have to do first show on and than select a Visual-Waypoint and do the show info!',
    execute = function()
        if commands['account'].gmLevel < 2 then
            Print("Account access level not high enough")
        end
    end
}