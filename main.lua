SLASH_HELLO1 = "/helloworld";
SLASH_HELLO2 = "/msg";

local function showGreeting(name)
    local greeting = "Hello " .. name;

    message(greeting);
end

local function SlashCmdHandler(name)
    if (string.len(name) > 0) then
        print("using name" .. name)
        showGreeting(name)
    else
        local playerName = UnitName("player");
        print("using playerName" .. playerName)
        showGreeting(playerName)
    end
end

SlashCmdList["HELLO"] = SlashCmdHandler;
