local path = "Backgrounds/W15R/"
function onCreate()
    makeLuaSprite("bg",path.."BG",-800,-600);
    scaleObject("bg", 3.0, 3.0)
    addLuaSprite("bg");
    makeAnimatedLuaSprite("crown",path.."Crowd1",-100,200);
    addAnimationByPrefix("crown", "idle", "Crowd1",24,true);
    objectPlayAnimation("crown", "idle");
    addLuaSprite("crown");
    if songName == "Popayano" then
        makeAnimatedLuaSprite("quin",path.."skip",defaultGirlfriendX + 620,400);
        addAnimationByPrefix("quin", "idle", "idleskip",24,true);
        addLuaSprite("quin")
    end
    makeAnimatedLuaSprite("crownFront",path.."FrontCrowd",-500,400);
    addAnimationByPrefix("crownFront", "idle", "FrontCrowd_Cheer",24,true);
    scaleLuaSprite("crownFront", 0.8, 0.8)
    addLuaSprite("crownFront",true);
    if songName == "Popayano" then
        setProperty("crownFront.y", 6000);
    end
    if songName == "Ratero" then
        setProperty("crown.x", 3500);
        setProperty("crownFront.visible", false);
    end
end
function onUpdate()
    if songName == "Double Trouble" then
    if curStep == 800 then
        setProperty("defaultCamZoom",0.65);
        doTweenY("cra", "crownFront", 600, 0.2, "linear")
    end
end
if songName == "Popayano" and curStep == 256 then
    doTweenY("cra", "crownFront", 500, 7.4, "linear");
end
if songName == "Ratero" and curStep == 420 then
    doTweenX("a", "crown", -100, 5.6, "circInOut");
end
end
function onCreatePost()
    if dadName == "Quin" or dadName == "quin" then
    setProperty("dad.y", getProperty("dad.y") + 40)
    end
    if songName == "Spookeez" then
        setProperty("dad.y", getProperty("dad.y") + 80)
        setProperty("dad.x", getProperty("dad.x") + 80)
end
if boyfriendName == "mariP1" then
    setProperty("boyfriend.y", getProperty("boyfriend.y") + 150)
    setProperty("gf.y", getProperty("gf.y") + 90)
end
end