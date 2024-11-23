
nuevo_alfa = 1
function onCreate()
     roles = getPropertyFromClass("ClientPrefs", "myLove",true)
    local speakersX = getProperty("speaker.y")
    local speakersY = getProperty("speaker.x")
    local rtx = getPropertyFromClass("ClientPrefs", "shaders",true)
    makeLuaSprite("stageback","BackGrounds/W3/normal_stage",0,0);
    addLuaSprite("stageback");
    makeLuaSprite("furniture","BackGrounds/W3/sumtable",-200,-200);
    setScrollFactor("furniture", 0.8, 0.8)
    addLuaSprite("furniture",true);
    makeAnimatedLuaSprite("speaker","speakers/bombox",defaultGirlfriendX - 200,600);
    addAnimationByPrefix("speaker", "idle", "stereo boom",24,true);
    addLuaSprite("speaker")
    if rtx == true then
        addLuaScript("data/reflection")
        makeAnimatedLuaSprite("speaker2","speakers/bombox",defaultGirlfriendX - 200,950);
    addAnimationByPrefix("speaker2", "idle", "stereo boom",24,true);
    addLuaSprite("speaker2")
    setProperty("speaker2.alpha", 0.30)
    setProperty("speaker2.flipY", true);
    end
    if roles then
       if roles == true and  songName == "betrayal distance"or songName == "ex-gf" then
       
        makeAnimatedLuaSprite("felix","characters/felixAssets",defaultBoyfriendX +100,600)
        addAnimationByPrefix("felix", "idle", "bf idle0",24,true);
        addLuaSprite("felix",false)
        setObjectOrder("felix", getObjectOrder("boyfriendGroup")+1)
    end
end
    if songName == "Esquizofrenia" then
        makeLuaSprite("stageback","BackGrounds/W3/youhavebeendestroyed",0,-200);
        addLuaSprite("stageback");
        makeLuaSprite("furniture","BackGrounds/W3/overlayingsticks",-300,-200);
        setScrollFactor("furniture", 0.8, 0.8)
        addLuaSprite("furniture",true);
        makeAnimatedLuaSprite("fire","BackGrounds/W3/newfireglow",200,-100);
        scaleLuaSprite("fire", 1.7, 1.7)
        addAnimationByPrefix("fire", "idle", "FireStage",24,true);
        addLuaSprite("fire")
        makeAnimatedLuaSprite("fire2","BackGrounds/W3/newfireglow",1200,-100);
        scaleLuaSprite("fire2", 1.7, 1.7)
        addAnimationByPrefix("fire2", "idle", "FireStage",24,true);
        addLuaSprite("fire2")
        makeLuaSprite("furniture","BackGrounds/W3/glowyfurniture",0,-200);
        addLuaSprite("furniture");
        if roles == false and boyfriendName == "felix_chained" then
            makeLuaSprite("gore","BackGrounds/W3/gore",defaultBoyfriendX + 150,500);
            addLuaSprite("gore");
        end
       if roles == true then
            makeAnimatedLuaSprite("felix","characters/felix-chained",defaultBoyfriendX + 150,430);
            addAnimationByPrefix("felix", "idle", "bf convo chained0016",24,false);
            addAnimationByPrefix("felix", "aliv", "bf breath chained",24,true);
            addAnimationByPrefix("felix", "angry","bf convo chained",24,false);
            addAnimationByPrefix("felix", "xd","bf idle chained alt",24,true);
            addAnimationByPrefix("felix", "normal","bf idle chained0",24,true);
            removeLuaSprite("gore",true)
            addLuaSprite("felix",true);
          --setObjectOrder("felix", 10)
            setProperty("felix.alpha", 1);
            objectPlayAnimation("felix", "idle")
    end
end
end
function noteMiss(membersIndex, noteData, noteType, isSustainNote)
 if songName == "Esquizofrenia" and boyfriendName == "mariW3_Playable" then
    if noteData >= 0.2 and noteData <= 3 then
        nuevo_alfa = nuevo_alfa - 0.1
        setProperty("felix.alpha", nuevo_alfa)
    end
    end
end
function onUpdatePost(elapsed)
    objectPlayAnimation("speaker2", "idle")
    if songName == "Esquizofrenia" and boyfriendName == "mariW3_Playable" and difficultyName == "chill" then
    if nuevo_alfa <= 0.1 then
        setProperty("health",-2)
    end
    if songName == "ex-gf" or songName == "betrayal distance" then
        setObjectOrder("furniture", getObjectOrder("felix")+10)
    end
end
if songName == "ex-gf" or songName == "betrayal distance" then
setProperty("gfPhantom.y",defaultGirlfriendY + 1350)
end
if songName == "Esquizofrenia" then
setProperty("gfPhantom.color",getColorFromHex("000000"))
setProperty("bfPhantom.color",getColorFromHex("000000"))
setProperty("dadPhantom.color",getColorFromHex("000000"))
setProperty("boyfriend.color",getColorFromHex("CD9340"))
setProperty("dad.color",getColorFromHex("FFC97B"))
setProperty("felix.color", getProperty("boyfriend.color"))
setProperty("icon.visible", getProperty("gf.visible"))
end
if nuevo_alfa >= 1 then
else
    addLuaScript("no")
end
if getProperty("gf.visible") == true then
    doTweenAlpha("bye", "gore", 0, 1, "linear")
end
end
--- @param membersIndex int
--- @param noteData int
--- @param noteType string
--- @param isSustainNote boolean
---
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if roles then
        if noteType == 'medHeal Note' and boyfriendName == "mariW3_Playable" and roles == true then
            if noteData >= 0.2 and noteData <= 3 then
                nuevo_alfa = math.min(nuevo_alfa + 0.3, 1)
                setProperty("felix.alpha", nuevo_alfa)
            end
        end
            if roles then
                if noteType == 'fullHeal Note' and boyfriendName == "mariW3_Playable" and roles == true then
                    if noteData >= 0.2 and noteData <= 3 then
                        nuevo_alfa = math.min(nuevo_alfa + 1, 1)
                        setProperty("felix.alpha", nuevo_alfa)
                    end
        end
    end
end
end
function onCreatePost()
    if roles then
    if songName == "ex-gf" or songName == "betrayal distance" and roles == true then
        setProperty("boyfriend.y", 480)
        setProperty("bfPhantom.y", getProperty("boyfriend.y")*3.2)
        setProperty("gf.visible", false)
        setProperty("gfPhantom.visible", false)
    else
        setProperty("boyfriend.y", 520)
        setProperty("bfPhantom.y", getProperty("boyfriend.y")*3)
        setProperty("gf.visible", true)
    end
    end
    if songName == "Esquizofrenia" and roles == true then
        setProperty("boyfriend.y",330)
        setProperty("gf.visible", false)
    end
end
function onEndSong()
    if nuevo_alfa >= 1 and difficultyName == "chill" and roles == true then
        addLuaScript("data/esquizofrenia/logros/achievements2")
    end
end