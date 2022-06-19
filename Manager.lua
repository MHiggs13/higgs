SLASH_MAN1 = "/man";
SLASH_PRINT1 = "/eprint";
SLASH_ECORE1 = "/ecore";
SLASH_EARENA1 = "/earena";
SLASH_ERAID1 = "/eraid";
SLASH_EBG1 = "/ebg";
SLASH_ECAS1 = "/ecas";

local function enableAddOns(addOns)
    for k, v in pairs(addOns) do
        EnableAddOn(v)
    end
end

local function numAddOns()
    local count = GetNumAddOns()

    print(count);
end

local function enableCore()
    print("Enabling core addons")
    local core = {
        "BigDebuffs",
        "Details",
        "Details_ChartViewer",
        "Details_DataStorage",
        "Details_DeathGraphs",
        "Details_Elitism",
        "Details_EncounterDetails",
        "Details_RaidCheck",
        "Details_Streamer",
        "ElvUI",
        "ElvUI_OptionsUI",
        "LiteMount",
        "MikScrollingBattleText",
        "MSBTOptions",
        "Plater",
        "WeakAuras",
        "WeakAurasArchive",
        "WeakAurasCompanion",
        "WeakAurasModelPaths",
        "WeakAurasOptions",
    };
    enableAddOns(core)
    print("Please reload")
end

local function enableRaid()
    print("Enabling raid addons")
    local raid = {
        "DBM-Core",
        "DBM-Party-Shadowlands",
        "DBM-CastleNathria",
        "DBM-SanctumOfDomination",
        "DBM-Sepulcher",
        "DBM-StatusBarTimers",
        "ExRT",
        "MRT",
        "MythicDungeonTools",
        "Omen",
        "OmniCD",
        "SimpleCombatLogger",
        "SimulationCraft",
    };
    enableAddOns(raid)
    print("Please reload")
end

local function enableArena()
    print("Enabling arena addons")
    local arena = {
        "GladiusEx",
        "OmniBar",
        "Reflex"
    };
    enableAddOns(arena)
    print("Please reload")
end

local function enableBG()
    print("Enabling bg addons")
    local bg = {
        "BattleGroundEnemies",
        "OmniBar",
        "Reflex",
    };
    enableAddOns(bg)
    print("Please reload")
end

local function enableCasual()
    print("Enabling casual addons")
    local casual = {
        "AllTheThings",
        "AstralKeys",
        "BetterWardrobe",
        "DejaCharacterStats",
        "HandyNotes",
        "LegendaryStockTracker",
        "RareScanner",
        "Rarity",
        "Rarity_Options",
        "TLDRMissions",
        "TomTom",
        "TradeSkillMaster",
        "TradeSkillMaster_AppHelper"
    };
    enableAddOns(casual)
    print("Please reload")
end

local function printAddOnFromIndex(index)
    print("in enable cas")
    print("index: ", index)
    if (index) then
        local indexNum = tonumber(index)
        if (indexNum >= 0) then
            print("asdfasdfadsf")
            local name, title, notes, enabled = GetAddOnInfo(indexNum)
            local enabledText = "yes"
            if (not enabled) then
                enabledText = "no"
            end
            print("name: " .. name .. " title: " .. title .. " notes: " .. notes .. " enabled: " .. enabledText)
        else
            print("/man ecas {index}")
        end
    end
end

local function SlashCmdHandler(arg1, index)
    print("=======")
    print(arg1)
    print(index)
    print("=======")
    if (arg1 == "num") then
        numAddOns();
    elseif (arg1 == "eall") then
        EnableAllAddOns()
    elseif (arg1 == "dall") then
        DisableAllAddOns();
        EnableAddOn("Higgs")
    elseif (arg1 == "ecas") then
        enableCasual(index)
    else
        print("man: command not recognised.")
        print("num: list number of addons available")
        print("eall: enable all addons")
        print("dall: disable all addons")
        print("eraid: enable raid addons")
        print("earena: disable arena addons")
        print("ebg: enable bg addons")
        print("ecas: enable casual addons")
    end
end

SlashCmdList["MAN"] = SlashCmdHandler;
SlashCmdList["EPRINT"] = printAddOnFromIndex;
SlashCmdList["ECORE"] = enableCore;
SlashCmdList["EARENA"] = enableArena;
SlashCmdList["ERAID"] = enableRaid;
SlashCmdList["EBG"] = enableBG;
SlashCmdList["ECAS"] = enableCasual;
