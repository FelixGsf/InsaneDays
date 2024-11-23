function onCreate()
    local path = "Backgrounds/W13/"
    if songName ~= 'isaBM' then
        makeAnimatedLuaSprite("bg",path.."isaHouse",0,0);
        addAnimationByPrefix("bg", "idle", "FireplaceBG",24,true)
        addLuaSprite("bg")
    else
    makeLuaSprite("bg",path.."motherBG",-500,-870);
    setScrollFactor("bg", 0.0, 0.0);
    addLuaSprite("bg")
    makeLuaSprite("floor",path.."motherFG",0,-250);
    setProperty("floor.scale.x", 1.2)
    setProperty("floor.scale.y", 1.2)
    addLuaSprite("floor")
    makeLuaSprite("arboles",path.."plants",-160,0);
    setScrollFactor("arboles", 0.8, 0.8)
    addLuaSprite("arboles",true)
    if shadersEnabled then
        addLuaScript("data/reflection")
    end
   
              setProperty("boyfriend.shader", getProperty("bg.shader"))
   -- debugPrint(getProperty("boyfriend.shader"))
end
end
    function onUpdate()
        setProperty("arboles.color", getProperty("boyfriend.color"))
        if songName ~= 'isaBM' then
            setProperty("boyfriend.color", getColorFromHex("ff9c63"))
            setProperty("dad.color", getColorFromHex("ff9c63"))
            setProperty("gf.color", getColorFromHex("ff9c63"))
        end
    end
    function onCreatePost()
        if isFemale then
            setProperty("boyfriend.y", getProperty("boyfriend.y")+120)
            setProperty("boyfriend.x", getProperty("boyfriend.x")+180)
            setProperty("gf.y", getProperty("gf.y")+70)
            setProperty("gfPhantom.y", getProperty("gfPhantom.y")+60)
            setProperty("bfPhantom.x", getProperty("boyfriend.x")+0)
            setProperty("bfPhantom.y", getProperty("boyfriend.y")+1050)
        end
        runHaxeCode([[
            colorSwap.saturation = 0; // Ajustar según sea necesario
       colorSwap.brightness = 0; // Ajustar según sea necesa
       ]])
    end