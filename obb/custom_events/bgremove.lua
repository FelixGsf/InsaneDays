function onEvent(name, value1, value2)
   if name == 'bgremove' then
    removeLuaSprite(value1);
    if songName == "no more drogs" and value1 == "BlackFlash" then
        setProperty("iconP4.visible", true)    
    end
end
end
