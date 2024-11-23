local path = "BackGrounds/W11/"
function onCreate()
    precacheImage(path.."abyss",true)
    precacheImage(path.."hellhole in question",true)
    precacheImage(path.."jaws",true)
    precacheImage(path.."platform",true)

    makeLuaSprite("bg",path.."abyss",-400,0);
    scaleObject("bg",3.5,3.5)
    setScrollFactor("bg", 0.8, 0.8)
    makeLuaSprite("hole", path.."hellhole in question", 300, 300)
    scaleObject("hole",3.5,3.5)
    makeLuaSprite("no se", path.."jaws", 0, 650);
    scaleObject("no se",3,3)
   -- scaleObject("no se",0.6, 0.6)
    makeLuaSprite("floor", path.."infernogroundp1", 400, 260);
    scaleObject("floor",2.2,2)
    makeAnimatedLuaSprite("bom","speakers/bombox",2100,1490);
    addAnimationByPrefix("bom", "idle", "stereo",24,true);
    if songName == "no more drogs" then
    makeAnimatedLuaSprite("satan",path.."Satan",1200,480)
    addAnimationByPrefix("satan", "idle", "Satan idle",24,true);
    scaleLuaSprite("satan",2.6,2.6)
    makeAnimatedLuaSprite('exmix','BackGrounds/W11/Amenaza',2750,1400)
    addAnimationByPrefix('exmix','idle','Exmix',24,true)
   -- setObjectOrder('exmix', getObjectOrder('bom')+1) 
    end
    addLuaSprite("bg")
    addLuaSprite("hole")
    addLuaSprite("no se")
    addLuaSprite("satan")
    addLuaSprite("floor")
    addLuaSprite('exmix',false)
    addLuaSprite("bom")
end
    
function onCreatePost()
   -- setObjectOrder("satan", getObjectOrder("floor"))
    if songName == "no more drogs" then
        createIcon('rayo',true)
        setProperty("gf.x", defaultGirlfriendX - 300)
        setProperty("gf.y", defaultGirlfriendY - 80)
    elseif gfName == "mari" then
        setProperty("gf.x", defaultGirlfriendX + 200)
        setProperty("gf.y", defaultGirlfriendY + 90)
    end
    if gfName == "felixSpeakers" then
        setProperty("gf.x", defaultGirlfriendX + 200)
        setProperty("gf.y", defaultGirlfriendY + 190)
        setProperty("boyfriend.x", defaultBoyfriendX - 100)
        setProperty("boyfriend.y", defaultBoyfriendY + 290)
    end
    if dadName == "karate" then
        setProperty("dad.y", defaultOpponentY + 174) 
    end
    if practice == true then
   setProperty("health", 2)
end
end
function onEvent(name,value1,value2)
    if name == "Change Character" and value1 == "bf" and value2 == "rayo-player"  then
        setProperty("boyfriend.x", defaultBoyfriendX - 400)
        setProperty("boyfriend.y", defaultBoyfriendY + 350)
        doTweenAlpha("sex", "icon", 0, 2, "linear")
        removeLuaSprite("iconP3")
    end
    if name == "Change Character" and value1 == "bf" and value2 == "felixAndMari" then
        setProperty("boyfriend.x", defaultBoyfriendX - 100)
      --  setObjectOrder("exmix", getObjectOrder("bom")-2)
        setProperty("boyfriend.y", defaultBoyfriendY + 330)
    end
    if name == "Change Character" and value1 == "gf" and value2 == "rayoSpeaker" then
        setProperty("gf.x", defaultGirlfriendX - 300)
        setProperty("gf.y", defaultGirlfriendY - 90)
        createIcon('rayo',true)
end
end



































function createIcon(icon,front)
    if getPropertyFromClass("ClientPrefs", "gfIcon") == true then
    globalIcon = icon;
    makeAnimatedLuaSprite("icon","icons/gfs/"..icon,0,0);
    addAnimationByPrefix("icon", "normal", "idle",24 ,true);
    addAnimationByPrefix("icon", "lose", "LOSE",24,true);
    addAnimationByPrefix("icon", "win", "win",24,true);
    addAnimationByPrefix("icon", "sad", "sad",24,true);
    addAnimationByPrefix("icon", "miss", "miss",24,false);
    addAnimationByPrefix("icon", "happy", "happy",24,false);
    setObjectCamera("icon",'hud');
    setProperty("icon.x", getProperty("healthBar.x") + 230);
    if downscroll == false then
    setProperty("icon.y", getProperty("healthBar.y") -100);
    else
        setProperty("icon.y", getProperty("healthBar.y") -80);
    end
    addLuaSprite("icon",front);
    if front == false then
        setObjectOrder("icon", getObjectOrder("iconP1")+2)
    end
end
    end