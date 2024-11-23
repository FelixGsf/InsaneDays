

--- @param elapsed float
---
function onUpdatePost(elapsed)
    setProperty('boyfriend.color',getColorFromHex('FFDC5C'))
    setProperty('gf.color',getColorFromHex('FFDC5C'))
end
---@pr
function onCreatePost()
    if difficultyName == "hard" then
        addLuaScript("data/"..songName.."/".."logro/achievements")
    end
    end