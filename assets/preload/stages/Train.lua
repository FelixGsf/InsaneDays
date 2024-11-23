local path = "Backgrounds/W17/"
local beatActive = false;
function onCreate()
    makeLuaSprite("bg", path.."background", -200, -200);
    setScrollFactor("bg", 0.6, 0.6);
    addLuaSprite("bg");
    makeAnimatedLuaSprite("layer1", path.."boppers_left", 400, 430);
    setScrollFactor("layer1", 0.6, 0.6)
    addAnimationByPrefix("layer1", "beat", "bop",24,true);
    addLuaSprite("layer1",false);
    makeAnimatedLuaSprite("layer2", path.."boppers_right", 1200, 400);
    setScrollFactor("layer2", 0.6, 0.6)
    addAnimationByPrefix("layer2", "beat", "bop",24,true);
    addLuaSprite("layer2",false);
    makeLuaSprite("font", path.."floorground", 0, 0);
    addLuaSprite("font");
    makeAnimatedLuaSprite('bom','speakers/bombox',defaultGirlfriendX - 130,defaultGirlfriendY + 410);
			addAnimationByPrefix('bom', 'idle', 'stereo boom', 24, true);
			addLuaSprite('bom',false)
end
function onUpdate()
    if mustHitSection == false then
        setProperty('defaultCamZoom',0.77)
    else
        setProperty('defaultCamZoom',0.96)
    end
    if beatActive == true and curStep == 448 then
    beatActive = false;
end
end
function onBeatHit()
   objectPlayAnimation("layer1", "beat"); 
   objectPlayAnimation("layer2", "beat"); 
end
--- @param membersIndex int
--- @param noteData int
--- @param noteType string
--- @param isSustainNote bool
---
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if songName == "DISTRUST" then
    if curStep >= 320 and curStep < 448 then
        beatActive = true
        if beatActive == true then
        triggerEvent("Screen Shake", "0.2,0.03", "");
        else
            print("sex");
    end
end
end
end
function onCreatePost()
    if (boyfriendName == "sisterPlayable") then
        setProperty("boyfriend.y", getProperty("boyfriend.y") + 80)
        setProperty("gf.y", getProperty("gf.y") + 110)
    end
    if songName == "Monetary Killer" then
        setProperty("bg.color", getColorFromHex("9194aa"));
        setProperty("font.color", getColorFromHex("575862"));
        setProperty("dad.color", getColorFromHex("34374e"));
        setProperty("boyfriend.color", getColorFromHex("34374e"));
        setProperty("layer1.color", getColorFromHex("565c8c"));
        setProperty("layer2.color", getColorFromHex("565c8c"));
        setProperty("gf.color", getColorFromHex("34374e"));
        setProperty("bom.color", getColorFromHex("34374e"));
    end
end