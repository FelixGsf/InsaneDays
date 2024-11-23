
local path = "BackGrounds/W5/images/"
local alpha = 1;
local tiempo = 0
local velocidad = 2 
function onCreate()
    roles = getPropertyFromClass("ClientPrefs", "myLove",true)
    shaders = getPropertyFromClass("ClientPrefs", "shaders",true)
    makeLuaSprite("bg", "BackGrounds/W5/images/limoSunset",-100, -750);
    scaleObject("bg",1.5,1.5)
    setScrollFactor("bg", 0.9, 0.9)
    add("bg")
    makeAnimatedLuaSprite("car", path.."limoDrive", 170, 500)
    addAnimationByPrefix("car", "idle", "Limo stage",24,true);
    scaleLuaSprite("car", 1.3, 1.3)
    add("car")
    if shaders == true and songName == 'mothers-love' or songName == 'mom-vs-son' then
    makeLuaSprite("carLight2",path.."carLights",170,500)
     scaleObject("carLight2",1.2,1.2)
 setProperty("carLight2.alpha", 0.60)
     add("carLight2",true)
     makeLuaSprite("bg2","BackGrounds/W1/bloom",320, -600);
setObjectOrder("bg2", getObjectOrder("boyfriendGroup")+6);
scaleObject("bg2", 1.5, 1.5);
addLuaSprite("bg2",true);
    end
    spriteAnimated("blow",path.."speed",170,-660);
    addAnimationByPrefix("blow", "idle", "speed idle0",24,true)
    scaleObject("blow", 6,6)
    add("blow",true)
    if songName == "Mom Battle" or songName == "Infinite Love" then
        makeLuaSprite("bg", "BackGrounds/W5/images/limoMoon",-400, -450);
        setProperty('defaultCamZoom', 0.6)
        scaleObject("bg",1.2,1.2)
        setScrollFactor("bg", 0.9, 0.9)
        add("bg")
        makeAnimatedLuaSprite("car", path.."LimoDriveS", 170, 500)
        addAnimationByPrefix("car", "idle", "Limo stage",24,true);
        scaleLuaSprite("car", 1.3, 1.3)
        add("car")
        makeAnimatedLuaSprite("car2", path.."LimoDriveS", 1370, 100)
        addAnimationByPrefix("car2", "idle", "Limo stage",24,true);
        scaleLuaSprite("car2", 0.7, 0.7)
        add("car2")
        spriteAnimated("blow",path.."speed",170,-660);
        addAnimationByPrefix("blow", "idle", "speed idle0",24,true)
        scaleObject("blow", 6,6)
        add("blow",true)
    end
        if shaders == true and songName == "Mom Battle" or songName == "Infinite Love"then
            makeLuaSprite("startLight",path.."starsLight",-400,-450)
            scaleObject("startLight",1.2,1.2)
            setScrollFactor("startLight", 0.9, 0.9)
            add("startLight")
            makeLuaSprite("moonLight",path.."MoonLight",50,-450)
    setScrollFactor("moonLight",0.7,0.7)
            scaleObject("moonLight",1.2,1.2)
          --  setObjectOrder("moonLight", getObjectOrder("car"))
            setProperty("moonLight.alpha", 0.50)
            setScrollFactor("moonLight", 0.9, 0.9)
        setObjectOrder("moonLight",10)
            add("moonLight",true)
            makeLuaSprite("cityLight",path.."cityLights",-400,-450)
             scaleObject("cityLight",1.2,1.2)
             setScrollFactor("cityLight", 0.9, 0.9)
             setProperty("cityLight.alpha", 0.50)
             add("cityLight")
             makeLuaSprite("carLight",path.."carLights",170,500)
             scaleObject("carLight",1.2,1.2)
             setScrollFactor("carLight", 0.9, 0.9)
             setProperty("carLight.alpha", 0.76)
             add("carLight",true)
             makeLuaSprite("car2Light",path.."carLights",1370,100)
             scaleObject("car2Light",0.7,0.7)
             setScrollFactor("car2Light", 0.9, 0.9)
             setProperty("car2Light.alpha", 0.60)
             add("car2Light",false)
        end
        end
function add(tag,front)
    addLuaSprite(tag,front)
end
function spriteAnimated(tag,path,x,y)
     makeAnimatedLuaSprite(tag, path, x, y)
end
function onUpdate(elapsed)
    tiempo = tiempo + elapsed * velocidad 

    -- Ajusta estos valores según lo que necesites
    local minAlpha = 0
    local maxAlpha = 1

    -- Calcula el alpha actual
    local alpha = minAlpha + (maxAlpha - minAlpha) * (math.sin(tiempo) + 0.5) / 2

    -- Ahora puedes usar 'alpha' para ajustar el alpha de tu sprite
    setProperty("startLight.alpha", alpha)
    --setProperty("cityLight.alpha", alpha)
    setProperty('poste.color', getColorFromHex("F73BBB"))
if songName == "mothers-love" or songName == "mom-vs-son" then
    setProperty("boyfriend.color", getColorFromHex("808080"))
    setProperty("gf.color", getColorFromHex("808080"))
    setProperty("dad.color", getColorFromHex("808080"))
end
end

function onCreatePost()
    if songName == "mom-vs-son" or songName == 'mothers-love'then
    playerPosSONG1()
    end
if songName == 'Infinite Love' or songName == 'Mom Battle' then
    setProperty("gf.scale.x", 0.7)
setProperty("gf.scale.y", 0.7)
playerPosSONG2()
end

end
function playerPosSONG1()
    if roles == true and songName == 'mom-vs-son' then
        setProperty("gf.y", 170);
        setProperty("gf.x", 1300);
        setProperty("boyfriend.y", 180)
        setProperty("gf.scale.x", 1)
        setProperty("gf.scale.y", 1)
    end
    if roles == true and  songName == 'mothers-love' then
        setProperty("gf.y", 170);
        setProperty("gf.x", 1300);
        setProperty("boyfriend.y", 180)
        setProperty("gf.scale.x", 1)
        setProperty("gf.scale.y", 1)
    end
    if roles == false and songName == 'mom-vs-son' then
        setProperty("gf.y", 90);
        setProperty("gf.x", 1400);
        setProperty("gf.scale.x", 1)
        setProperty("gf.scale.y", 1)
        setProperty("boyfriend.y", 200)
    end
    if roles == false and songName == 'mothers-love' then
        setProperty("gf.y", 90);
        setProperty("gf.scale.x", 1)
        setProperty("gf.scale.y", 1)
        setProperty("gf.x", 1400);
        setProperty("boyfriend.y", 200)
    end
end


function playerPosSONG2()
    if roles == true and songName == "Mom Battle" then
        setProperty("boyfriend.y", 150)
        setProperty("gf.y",-230)
        setProperty("gf.scale.x", 0.7)
setProperty("gf.scale.y", 0.7)
end
if roles == true and songName == "Infinite Love" then
    setProperty("boyfriend.y", 150)
        setProperty("gf.y",-230)
        setProperty("gf.scale.x", 0.7)
setProperty("gf.scale.y", 0.7)
end
if roles == false and songName == "Mom Battle" then
    setProperty("boyfriend.y", 190)
    setProperty("gf.y",-280)
    setProperty("gf.scale.x", 0.7)
setProperty("gf.scale.y", 0.7)
end
if roles == false and songName == "Infinite Love" then
    setProperty("boyfriend.y", 150)
    setProperty("gf.scale.x", 0.7)
setProperty("gf.scale.y", 0.7)
        setProperty("gf.y",-280)
        setProperty("boyfriend.y",190)
end
end