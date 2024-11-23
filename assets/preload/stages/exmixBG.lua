function onCreate()
    local shaders = getPropertyFromClass("ClientPrefs", "shaders")
    roles = getPropertyFromClass("ClientPrefs", "myLove")
    makeLuaSprite("bg","BackGrounds/W2/SkyN",0,0);
    setScrollFactor("bg", 0.8, 0.8);
    addLuaSprite("bg")
    makeLuaSprite("floor","BackGrounds/W2/floorN",0,300);
    addLuaSprite("floor");
    makeAnimatedLuaSprite("crown","BackGrounds/W2/gangN",600,1200);
    addAnimationByPrefix("crown", "idle", "VaperGangDay",24,true);
    addLuaSprite("crown")
    if shaders and songName == "Vaper" or songName == "Egocentric" or songName == "Egocentrics" or songName == "No Vaper" or songName == "ExMari" then
        makeLuaSprite("bloom","BackGrounds/W2/bloom",-200,-300);
        setScrollFactor("bloom", 0.8, 0.8);
        addLuaSprite("bloom",true);
        scaleObject("bloom", 1.2, 1.2)
        setProperty("bloom.alpha", 0.67)
    end
    if shaders and songName == "Vaper" or songName == "Egocentric" or songName == "Egocentrics" or songName == "No Vaper" then
        addLuaScript("data/reflection")
    end
    if songName == "Ex Addict" then
        makeLuaSprite("bg","BackGrounds/W2/city_shit",0,0);
        setScrollFactor("bg", 0.8, 0.8);
        addLuaSprite("bg")
        makeLuaSprite("floor","BackGrounds/W2/floor",0,300);
        addLuaSprite("floor");
        makeAnimatedLuaSprite("crown","BackGrounds/W2/VapeGang",600,1200);
        addAnimationByPrefix("crown", "idle", "VaperGangDay",24,true);
        addLuaSprite("crown")
end
end
function onUpdate()
    if  songName == "Vaper" or songName == "Egocentric" or songName == "Egocentrics" or songName == "No Vaper" then
        setProperty("bfPhantom.color",getColorFromHex("000000"))
        setProperty("dadPhantom.color",getColorFromHex("000000"))
        setProperty("gfPhantom.color",getColorFromHex("000000"))
    end
    if  songName == "Vaper" or songName == "Egocentric" or songName == "Egocentrics" or songName == "No Vaper" or songName == "ExMari" then
        setProperty("boyfriend.color", getColorFromHex("7085FF"))
        setProperty("gf.color", getColorFromHex("7085FF"))
    end
end
    function onCreatePost()
            if roles == true or boyfriendName == "mariP1" then
                setProperty("boyfriend.y", 1360)
                setProperty("bfPhantom.y", getProperty("boyfriend.y")*1.76)
            end
        if gfName == "sister" then
            setProperty("gf.y", getProperty("gf.y")-180)
        end
        if gfName == "rayoSpeaker" then
        if getWeekCompleted('day11') then
            setProperty("gf.visible", true)
        else
            setProperty("gf.visible", false)
        end
    end
setProperty("gfPhantom.visible", getProperty("gf.visible"))
    end