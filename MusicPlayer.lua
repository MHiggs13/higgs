local soundType = {
    SOUND = 1,
    GAME_MUSIC = 2,
    CUSTOM = 3
}

local sounds = {
    ["murloc"] = {
        ["sound"] = 416,
        ["description"] = "Mglrlrlrlrlrl!",
        ["type"] = soundType.SOUND
    },
    ["ding"] = {
        ["sound"] = 888,
        ["description"] = "Grats!",
        ["type"] = soundType.SOUND
    },
    ["crab"] = {
        ["sound"] = 4328478,
        ["description"] = "Halondrus",
        ["type"] = soundType.SOUND
    },
    ["sepulcher"] = {
        ["sound"] = 4423250,
        ["description"] = "Sepulcher Music",
        ["type"] = soundType.GAME_MUSIC
    },
}

local function displaySoundList()
    print("----------------------------")
    for command in pairs(sounds) do
        local description = sounds[command].description
        print("Command: /playsound " .. command .. " - Description: " .. description)
    end
    print("----------------------------")
end

local customSoundId

local function playTrack(track)
    print(track.description)

    if (track.type == soundType.GAME_MUSIC) then
        PlayMusic(track.sound)

        print("To stop the music type /stopsound")
    elseif (track.type == soundType.SOUND) then
        PlaySound(track.sound)
    elseif (track.type == soundType.CUSTOM) then
        stopSoundHandler()
        customSoundId = select(2, PlaySoundFile(track.sound))
    end
end

-- SLASH
-- SLASH
-- SLASH

SLASH_SOUND1 = "/playsound"
SLASH_STOPSOUND1 = "/stopsound"

local function playSoundHandler(trackId)
    if (string.len(trackId) > 0) then
        local matchesKnownTrack = sounds[trackId] ~= nil

        if (matchesKnownTrack) then
            local track = sounds[trackId]

            playTrack(track)
        else
            displaySoundList()

            print(trackId .. " - Doesn't match a known track.")
        end
    else
        displaySoundList()
    end
end

local function stopSoundHandler()
    StopMusic()

    if (customSoundId ~= nil) then
        StopSound(customSoundId)
        customSoundId = nil
    end
end

SlashCmdList["SOUND"] = playSoundHandler;
SlashCmdList["STOPSOUND"] = stopSoundHandler;
