function onCountdownStarted()
setProperty('boyfriend.scale.x', 5.80)
setProperty('boyfriend.scale.y', 5.80) 
end
function onCreatePost()
    if difficultyName == "chill" then
        addLuaScript("data/"..songName.."/".."logro/achievements")
    end
    end
