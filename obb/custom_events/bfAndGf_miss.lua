function onEvent(name,value1,value2)
    if name == "bfAndGf_miss" and value1 == "bf" then
        makeLuaSprite("lost","BackGrounds/W12/turnaroundead",0,0);
        setObjectCamera("lost",'other')
        setProperty("lost.alpha",0.50)
        addLuaSprite("lost",true)
        runTimer("remove",6.4)
    end
if name == "bfAndGf_miss" and value1 == "jump" then
    makeLuaSprite("lost","jumpscare",0,0);
        setObjectCamera("lost",'other')
        addLuaSprite("lost",true)
        runTimer("remove",6.4)
end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "remove" then
        triggerEvent("Flash Camera", "1", "")
        removeLuaSprite("lost")
    end
end