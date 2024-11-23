local felixOffssets = {}
local mariOffsets = {300,500}
function onCreate()
    roles = getPropertyFromClass("ClientPrefs", "myLove",true)
    local shaders = getPropertyFromClass("ClientPrefs", "shaders",false);
    makeLuaSprite("bg","BackGrounds/W1/skyShade",-350,0);
    scaleObject("bg", 1.3, 1.3);
    addLuaSprite("bg");
    makeLuaSprite("city","BackGrounds/W1/cityShade",-300,0);
    setScrollFactor("city", 0.8, 0.8);
    scaleObject("bg", 1.3, 1.3);
    addLuaSprite("city");
    makeLuaSprite("lights","BackGrounds/W1/lightsShade",-300,-150);
    scaleObject("lights", 1.2, 1.2,true)
    addLuaSprite("lights")
    makeLuaSprite("street","BackGrounds/W1/streetShade",-300,-160);
    scaleObject("street", 1.3, 1.3);
    addLuaSprite("street");
    if shaders == true and songName == "shot head" or songName == "Shot Head" or songName == "insane" or songName == "Insane Remix" then
makeLuaSprite("bg2","BackGrounds/W1/bloom",-300,0);
setObjectOrder("bg2", getObjectOrder("boyfriendGroup")+6);
addLuaScript("data/reflection")
scaleObject("bg2", 1.3, 1.3);
addLuaSprite("bg2",true);
    end
    if songName == "anorexic" then
        makeLuaSprite("bg","BackGrounds/W1/sky",-300,0);
        scaleObject("bg", 1.3, 1.3);
        addLuaSprite("bg");
        makeLuaSprite("city","BackGrounds/W1/city",-300,0);
        setScrollFactor("city", 0.8, 0.8);
        scaleObject("bg", 1.3, 1.3);
        addLuaSprite("city");
        makeLuaSprite("lights","BackGrounds/W1/behindTrain",-300,-150);
        scaleObject("lights", 1.2, 1.2,true)
        addLuaSprite("lights")
        makeLuaSprite("street","BackGrounds/W1/street",-300,-160);
        scaleObject("street", 1.3, 1.3);
        addLuaSprite("street");
    end
end
function onEvent(name, value1, value2)
if name == "Philly Glow Recreation" then
    if value1 == "0" then
        setObjectOrder("bg2", getObjectOrder("boyfriendGroup")+6); --esto arregla el error del bloom se hace atras de los personajes
end
end
end
function onCreatePost()
    if roles then
    if songName == "anorexic" or roles == true then
    setProperty("boyfriend.y", 280)
    setProperty("dad.y",280)
    setProperty("gf.y",280)

    end
    if songName == "insane" or songName == "shot head" and roles == true then
        setProperty("boyfriend.y", 280)
        setProperty("bfPhantom.y", 1300)
        setProperty("dad.y", 280)
        setProperty("dadPhantom.y", 1300)
        setProperty("gf.y", 270)
        setProperty("gfPhantom.y", 1200)
end
end
end