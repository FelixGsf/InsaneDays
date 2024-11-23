local noteHit = false;
function onCreate()
precacheImage("characters/Ron-anims");
makeAnimatedLuaSprite("anims",'characters/Ron-anims',0,0);
setProperty("anims.x", getProperty("dad.x"));
setProperty("anims.y", getProperty("dad.y"));
addAnimationByPrefix("anims", "show", "Ronald show",24,false);
addAnimationByPrefix("anims", "idea", "Ronald idea",24,false);
setProperty("anims.visible", false);
addLuaSprite("anims",true);
end 
function onUpdate(elapsed)
    local anim = getProperty("anims.animation.curAnim.name");
    local animFinished = getProperty("anims.animation.finished");
  
    if curStep == 624 then
        objectPlayAnimation("anims", "idea")
        setProperty("anims.visible", true);
        setProperty("dad.visible", false);
    end
    if anim == "idea" and animFinished then
        setProperty("anims.visible", false);
        setProperty("dad.visible", true);
    end
    if (curStep == 111) then
        objectPlayAnimation("anims", "show");
        setProperty("anims.visible", true);
        setProperty("dad.visible", false);
end
end
function opponentNoteHit()
    local anim = getProperty("anims.animation.curAnim.name");
    if anim == "show" or anim== "idea" then
        setProperty("anims.visible", false);
        setProperty("dad.visible", true);
end
end