function onEvent(name, value1, value2)
   local path =  "BackGrounds/W11/"
    if name == "XD" and value1 == "felix" then
        precacheImage("BackGrounds/W11/felix_good",true)
        makeAnimatedLuaSprite('fx','BackGrounds/W11/felix_good',3350,1350);
        addAnimationByPrefix('fx', 'idle', 'BF HEY!!0', 24, true)
        addLuaSprite('fx',false);
  end
if name == "XD" and value1 == "exmix" then
    makeAnimatedLuaSprite('exmix','BackGrounds/W11/Amenaza',2750,1400)
addAnimationByPrefix('exmix','idle','Exmix',24,true)
setObjectOrder("exmix", getObjectOrder("bom"))
addLuaSprite('exmix',false)
end
if name == "XD" and value1 == "satan" then
    setProperty("satanNote.visible", false);
    makeAnimatedLuaSprite("dialogue",path.."SatanDialogues",1700,1150)
    addAnimationByPrefix("dialogue", "idle", "Satan_dialogue",24,true);
    objectPlayAnimation("dialogue", "idle")
    addLuaSprite("dialogue")
elseif name == "XD" and value1 == "sing" then
    setProperty("satanNote.visible", true);
    objectPlayAnimation("satanNote", "idle")
   removeLuaSprite("dialogue",true)
elseif name == "XD" and value1 == "visible" then
    setProperty("iconP3.visible", true);
end
end