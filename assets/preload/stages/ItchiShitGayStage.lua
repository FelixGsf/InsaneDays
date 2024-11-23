local path = "BackGrounds/W8/"
function onCreate()
    local shaders = getPropertyFromClass("ClientPrefs", "shaders",true)
    makeLuaSprite("bg1", path.."BG", 0, 0)
    addLuaSprite("bg1");
    makeLuaSprite("mesa", path.."Eatingtable", 0, 0)
    addLuaSprite("mesa");
    makeLuaSprite("mesas", path.."tables", 0, -50);
    addLuaSprite("mesas",true);
    setScrollFactor("mesas", 0.8, 0.8)
    makeLuaSprite("unDiaNormalEnElSolferino", path.."arealfamilyguy", 1700, 550);
    addLuaSprite("unDiaNormalEnElSolferino")
    if shaders == true then
        makeLuaSprite("luzVerder", path.."overlayMexicano", 0, 0)
        addLuaSprite("luzVerder",true)
        setProperty("luzVerder.alpha", 0.40)
        scaleObject("luzVerder", 1.3,1.3)
    end
    if songName == "SolfeFunk" then
        makeAnimatedLuaSprite("shit1", path.."PlaneAud1", 200, 560);
        addAnimationByPrefix("shit1", "idle", "Pl",24,true);
        addLuaSprite("shit1",true)
        setObjectOrder("shit1", getObjectOrder("luzVerder"))
        setObjectOrder("mesas", getObjectOrder("shit1")-1)
        setScrollFactor("shit1", 0.8, 0.8)
        makeAnimatedLuaSprite("shit2", path.."PlaneAud2", 960, 760);
        addAnimationByPrefix("shit2", "idle", "Pl",24,true);
        addLuaSprite("shit2")
        setScrollFactor("shit2", 0.8, 0.8)
        setObjectOrder("shit2", getObjectOrder("shit1"))
    end
    if songName == "Assault" then
        makeAnimatedLuaSprite("shit1", path.."PlaneAud1", 200, 560);
        addAnimationByPrefix("shit1", "idle", "Pl",24,true);
        addLuaSprite("shit1",true)
        setObjectOrder("shit1", getObjectOrder("luzVerder"))
        setObjectOrder("mesas", getObjectOrder("shit1")-1)
        setScrollFactor("shit1", 0.8, 0.8)
        makeAnimatedLuaSprite("shit2", path.."PlaneAud2", 760, 760);
        addAnimationByPrefix("shit2", "idle", "Pl",24,true);
        addLuaSprite("shit2")
        setScrollFactor("shit2", 0.8, 0.8)
        setObjectOrder("shit2", getObjectOrder("shit1"))
        makeAnimatedLuaSprite("shit4", path.."PlaneAud3", 1400, 760);
        addAnimationByPrefix("shit4", "idle", "Pl",24,true);
        addLuaSprite("shit4",true)
        makeAnimatedLuaSprite("shit3", path.."PlaneAud4", 1900, 760);
        addAnimationByPrefix("shit3", "idle", "Pl",24,true);
        addLuaSprite("shit3",true)
end
end
function onBeatHit()
    if curBeat %2 == 0 then
        objectPlayAnimation("shit1", "idle")
        objectPlayAnimation("shit2", "idle")
    end 
end
function onCreatePost()
    if boyfriendName == 'mariP1' then
        setProperty("boyfriend.y", 380)
        setProperty("gf.x", getProperty("gf.x")-90)
    end
end