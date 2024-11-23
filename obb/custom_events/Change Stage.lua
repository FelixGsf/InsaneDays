local path = "BackGrounds/W12/"
curDestroy = false;
moveCD = false;
local xd = false;
function onCreate()
    precacheImage(path.."cdbg")
    precacheImage(path.."clounds")
    precacheImage(path.."bg")
    precacheImage(path.."buildings")
    precacheImage(path.."cityBG")
    precacheImage(path.."fg")
    precacheImage(path.."wall")
end
    function onEvent(name,value1,value2)
        if name == "Change Stage" and value1 == "destroy" then
            curDestroy = true;
        removeLuaSprite("bg",true)
        removeLuaSprite("floor",true)
        makeLuaSprite("bg2",path.."bg",-980,-600)
        scaleObject("bg2", 1.6, 1.6)
        moveCD = false;
        setScrollFactor("bg2", 0.8, 0.8)
        setProperty("boyfriend.y", getProperty("boyfriend.y")+50)
        setProperty("dad.y", getProperty("dad.y")+50)
        addLuaSprite("bg2")
        makeLuaSprite("sky",path.."clounds",-980,-400)
        setScrollFactor("sky", 0.8, 0.8)
        addLuaSprite("sky",false)
        makeLuaSprite("city",path.."cityBG",-980,0)
        setScrollFactor("city", 0.8, 0.8)
        addLuaSprite("city")
        makeLuaSprite("buildings",path.."buildings",-900,0)
        setScrollFactor("buildings", 0.8, 0.8)
        addLuaSprite("buildings")
        makeLuaSprite("fg",path.."fg",-1100,400)
        addLuaSprite("fg")
        makeLuaSprite("wall",path.."wall",0,700)
        addLuaSprite("wall",true)
        elseif name == "Change Stage" and value1 == "dog" then
            removeLuaSprite("bg2")
            removeLuaSprite("sky")
            removeLuaSprite("city")
            removeLuaSprite("buildings")
            removeLuaSprite("fg")
            removeLuaSprite("wall")
            makeLuaSprite("b3",path.."cdbg",-530,0)
            scaleObject("b3", 1.3,1)
            addLuaSprite("b3")
            curDestroy = false
            setProperty("boyfriend.scale.x", 1)
            setProperty('boyfriend.color', 16777215);
            setProperty("boyfriend.scale.y", 1)
    end
    if name == "Change Character" and value1 == "dad" and value2 == "cc-phase-3" then
        setProperty("boyfriend.scale.x", 0.5)
        curDestroy = true;
        setProperty("boyfriend.scale.y", 0.5)
        setProperty("boyfriend.color", getColorFromHex("FF7D7D"))
    end
    if  name == "Change Stage" and value1 == "dog" then
        moveCD = true;
setProperty("boyfriend.x",100);
setProperty("boyfriend.y",getProperty("boyfriend.y")+280);
curDestroy = false;
setProperty("boyfriend.flipX",true);
setProperty("boyfriend.cameraPosition[0]", -300)
setProperty("dad.cameraPosition[0]", 0)
    end
    if (name == "Change Character" and value1 == "dad" and value2 == "CC_felixForm") then
        denuevoElStageDestruido()
    end
    if (name == "Change Character"  and value1 == "gf" and value2 == "CD_mariForm") then
        setProperty("gf.scale.x", 0.4)
        setProperty("gf.x", getProperty("gf.x")-380)
        setProperty("gf.scale.y", 0.4)
        setProperty("gf.color", getColorFromHex("FF7D7D"))
    end
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
 idleoffsets = {'-5', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'5', '6'}
downoffsets = {'-10', '-13'}
upoffsets = {'-36', '30'}
rightoffsets = {'-20', '-5'}
if curDestroy == true then
    if noteData == 0 then
        setProperty('boyfriend.offset.x', leftoffsets[1]);
        setProperty('boyfriend.offset.y', leftoffsets[2]);
    elseif noteData == 1 then
        setProperty('boyfriend.offset.x', downoffsets[1]);
        setProperty('boyfriend.offset.y', downoffsets[2])
    elseif noteData == 2 then
        setProperty('boyfriend.offset.x', upoffsets[1]);
        setProperty('boyfriend.offset.y', upoffsets[2])
    elseif noteData == 3 then
        setProperty('boyfriend.offset.x', rightoffsets[1]);
        setProperty('boyfriend.offset.y', rightoffsets[2]);
        end
    end
if curDestroy == false and moveCD == true then
    if noteData == 0 then
        setProperty('boyfriend.offset.x', -12);
        setProperty('boyfriend.offset.y', 14);
    elseif noteData == 1 then
        setProperty('boyfriend.offset.x', -7);
        setProperty('boyfriend.offset.y', -27)
    elseif noteData == 2 then
        setProperty('boyfriend.offset.x', 18);
        setProperty('boyfriend.offset.y', 55)
    elseif noteData == 3 then
        setProperty('boyfriend.offset.x', 5);
        setProperty('boyfriend.offset.y', -11);
        end
end
end
function onUpdatePost()
    if curDestroy == false and moveCD == true then
        setProperty("dad.x",900);
        setProperty("dad.y",630)
    end
end--matenme porfa
function denuevoElStageDestruido()
    moveCD = false;
    curDestroy = true;
    xd = true;
    setProperty("defaultCamZoom",1.2)
    setProperty("boyfriend.flipX",false);
    setProperty("boyfriend.scale.x", 0.5)
    setProperty("boyfriend.scale.y", 0.5)
    setProperty("dad.scale.x", 0.5)
    setProperty("dad.scale.y", 0.5)
   
    setProperty("boyfriend.cameraPosition[0]", 0)
    setProperty("boyfriend.color", getColorFromHex("FF7D7D"))
    setProperty("dad.color", getColorFromHex("FF7D7D"))
    setProperty("boyfriend.x", getProperty("boyfriend.x")+200)
    setProperty("dad.x", getProperty("boyfriend.x")-480)
    setProperty("dad.y", getProperty("dad.y")+90)
    setProperty("boyfriend.y", getProperty("boyfriend.y")-350)
end
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if xd == true and curDestroy == true then
        if noteData == 0 then
            setProperty('dad.offset.x',23);
            setProperty('dad.offset.y', 23);
        elseif noteData == 1 then
            setProperty('dad.offset.x', 0);
            setProperty('dad.offset.y', -25)
        elseif noteData == 2 then
            setProperty('dad.offset.x', -19);
            setProperty('dad.offset.y', 38)
        elseif noteData == 3 then
            setProperty('dad.offset.x', -14);
            setProperty('dad.offset.y', 11);
            end
        end
end