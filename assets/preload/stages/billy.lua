local bg = {"Silly_floor","Silly_idk_1","Silly_idk_2"}
local currentStage = "";
function onCreatePost()
precacheImage("sillyAnims/Lookalike_Alt")
precacheImage("sillyAnims/unshrink");
    makeLuaSprite('mirror','BackGrounds/W15/silly_mirror',0,0)
    --setObjectCamera('mirror','camHUD')
    addLuaSprite('mirror')

    makeLuaSprite('mirrorBroken','BackGrounds/W15/broken_mirror',0,0)
    setProperty('mirrorBroken.visible',false)
    addLuaSprite('mirrorBroken')

    makeLuaSprite('whiteMirror',nil,getProperty('mirror.x'),getProperty('mirror.y'))
    makeGraphic('whiteMirror',getProperty('mirror.width'),getProperty('mirror.height'),'ffffff')
    setProperty('whiteMirror.alpha',0)
    addLuaSprite('whiteMirror')

    makeLuaSprite('vig','vignette',0,0)
    setObjectCamera('vig','camHUD')
    addLuaSprite('vig')

    makeLuaSprite('bars','bars',0,0)
    setObjectCamera('bars','camHUD')
    addLuaSprite('bars')

    for i = 1,#bg do
        makeAnimatedLuaSprite('bg'..i,'BackGrounds/W15/bgAssets',0,0)
        addAnimationByPrefix('bg'..i,bg[i],bg[i],1,false)
        addLuaSprite('bg'..i)
    end

    makeLuaSprite('blackScreen','')
    makeGraphic('blackScreen',1300,740,'000000')
    setObjectCamera('blackScreen','camHUD')
    setProperty('blackScreen.alpha',0)
    --screenCenter('blackScreen','XY')
    addLuaSprite('blackScreen')

    --makeLuaSprite('blackOther','')
    --makeGraphic('blackOther',1300,740,'000000')
    --setObjectCamera('blackOther','camOther')
    --setProperty('blackOther.alpha',0)
    --screenCenter('blackOther','XY')
    --addLuaSprite('blackOther')
    if (boyfriendName == "mariP1") then
        setProperty("boyfriend.y", getProperty("boyfriend.y") + 90);
    end
end

function onStepHit()
    if curStep == 128 then
        cameraFlash('camHUD','000000',1)
        triggerEvent('Add Camera Zoom',0.2,0.1)
    end
end
function onUpdate()
    if curStep == 3888 then
        doTweenAlpha("blaa", "blackScreen", 0, 0.5, "linear");
        setProperty('dad.visible', true);
        removeLuaSprite("anim1",true)
        removeLuaSprite("anim2",true)
    end
    if (getProperty("boyfriend.color") ~= "7C83C4") then
    setProperty("boyfriend.color", getColorFromHex("7C83C4"))
end
if curStep == 1424 then
    setProperty("dad.visible", true);
    removeLuaSprite("trasform",true);
end
if curStep == 2064 then
    setProperty("dad.visible", true);
    removeLuaSprite("trasform2",true);
end
if curStep > 1424 then
    if luaSpriteExists("trasform") then
        removeLuaSprite("trasform");
    end
end
if curStep > 2064 then
    if luaSpriteExists("trasform2") then
        removeLuaSprite("trasform2");
    end
end
end
function onEvent(name,value1,value2)
    local dadX = getProperty("dad.x")
    local dadY = getProperty("dad.y")
    if name == "Change Character" and value1 == "dad" and value2 == "transLookalike" then
        setProperty("dad.visible", false);
    makeAnimatedLuaSprite("trasform","sillyAnims/Lookalike_Alt",dadX,dadY -530);
    addAnimationByPrefix("trasform", "hola","ElUngrow",24,true);
    addLuaSprite("trasform");
    end
    if name == "Change Character" and value1 == "dad" and value2 == "transLookalike2" then
        setProperty("dad.visible", false);
        makeAnimatedLuaSprite("trasform2","sillyAnims/unshrink",dadX,dadY -680);
        addAnimationByPrefix("trasform2", "hola","ElUnshrink",24,true);
        addLuaSprite("trasform2");
    end
end