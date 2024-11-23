function onCreatePost()
    makeAnimatedLuaSprite("iconP4","icons/PixelIcon",0,0);
    addAnimationByPrefix("iconP4", "normal", "PixelIcon mariIcon normal",24,true);
    addAnimationByPrefix("iconP4", "loss", "PixelIcon mariIcon lose",24,true);
    addAnimationByPrefix("iconP4", "win", "PixelIcon mariIcon win",24,true);
    setObjectCamera("iconP4","hud")
    addLuaSprite("iconP4",true);
    setProperty("iconP4.flipX",true)

end
--- @param elapsed float
---
function onUpdatePost(elapsed)
    local health = getProperty("health")
    setProperty("iconP4.x", getProperty("iconP1.x"));
    setProperty("iconP4.y", getProperty("iconP1.y")-80)
    setProperty("iconP4.angle", getProperty("iconP1.angle"))
    setProperty("iconP4.scale.x", getProperty("iconP1.scale.x"))
    setProperty("iconP4.scale.y", getProperty("iconP1.scale.y"))
    if health > 1.6 then
        objectPlayAnimation("iconP4", "win")
    elseif health > .375 then
        objectPlayAnimation("iconP4", "normal")
    else
        objectPlayAnimation("iconP4", "loss")
    end
end