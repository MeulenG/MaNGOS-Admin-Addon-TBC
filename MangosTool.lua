local MT = AceLibrary("AceLocale-2.2"):new("MangosTool");

local function MangosTool_Toggle()
    if (MangosTool:IsVisible()) then
        MangosTool:Hide()
    else
        MangosTool:Show()
    end
end

-- Slash Commands
SLASH_TOGGLETPUI1 = "/mangostool"
SLASH_RELOADUI1 = "/rl";
-- Parse Commands
SlashCmdList.RELOADUI = ReloadUI;
SlashCmdList["TOGGLETPUI"] = MangosTool_Toggle

function Print(text)
	DEFAULT_CHAT_FRAME:AddMessage(text)
end

function MangosTool_OnCloseButton()
	--Hide the item frame
	MangosTool:Hide();
end

function MangosTool_ShowTab(tabId)
    if tabId == 1 then
        -- Show the TeleportFrame and hide the main MangosTool frame
        MangosToolTeleportFrame:Show()
        MangosTool:Hide()
    end
    if tabId == 2 then
        MangosToolAddItemsFrame:Show()
        MangosTool:Hide()
    end
    if tabId == 3 then
        MangosToolGMCommandsFrame:Show()
        MangosTool:Hide()
    end
end

MT:RegisterTranslations("enUS", function() return {
    Tab1 = "Teleport",
    Tab2 = "Add Items",
    Tab3 = "GM Commands",
    Search = "Search",
} end)

local function OnAddonLoaded(self, event, addonName)
    if addonName == "MangosTool" then
        if MangosToolTeleportFrame then
            Print("Teleport Frame is loaded.")
        else
            Print("Teleport Frame is nil.")
        end
        if MangosToolGMCommandsFrame then
            Print("GMCommands Frame is loaded.")
        else
            Print("GMCommands Frame is nil.")
        end
        if MangosToolAddItemsFrame then
            Print("AddItems Frame is loaded.")
        else
            Print("AddItems Frame is nil.")
        end
    end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", OnAddonLoaded)