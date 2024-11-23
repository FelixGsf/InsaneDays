function onCreatePost()
    makeAnimatedLuaSprite("iconP4","icons/Icon-satan",0,0);
    addAnimationByPrefix("iconP4", "normal", "Normal",24,true);
    addAnimationByPrefix("iconP4", "loss", "Loss",24,true);
   -- addAnimationByPrefix("iconP4", "win", "PixelIcon mariIcon win",24,true);
    setObjectCamera("iconP4","hud")
    addLuaSprite("iconP4",true);
    setProperty("iconP4.flipX",false)

end
--- @param elapsed float
---
function onUpdatePost(elapsed)
    local health = getProperty("health")
    setProperty("iconP4.x", getProperty("iconP2.x")-90);
    setProperty("iconP4.y", getProperty("iconP2.y")-80)
    setProperty("iconP4.angle", getProperty("iconP2.angle"))
    setProperty("iconP4.scale.x", getProperty("iconP2.scale.x"))
    setProperty("iconP4.scale.y", getProperty("iconP2.scale.y"))
    if health > 1.6 then
        objectPlayAnimation("iconP4", "loss")
       -- objectPlayAnimation("iconP4", "normal")
    elseif health > .375 then
    
       -- objectPlayAnimation("iconP4", "loss")
        objectPlayAnimation("iconP4", "normal")
    else
        objectPlayAnimation("iconP4", "normal")
       -- objectPlayAnimation("iconP4", "loss")
    end
end