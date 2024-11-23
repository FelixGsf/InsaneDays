function onCreatePost()
    makeAnimatedLuaSprite("iconP3","icons/mariIcon",0,0);
    addAnimationByPrefix("iconP3", "normal", "mariIcon normal",24,true);
    addAnimationByPrefix("iconP3", "loss", "mariIcon lose",24,true);
addAnimationByPrefix("iconP3", "win", "mariIcon win",24,true);
    setObjectCamera("iconP3","hud")
    addLuaSprite("iconP3",true);
    setProperty("iconP3.flipX",true)

end
--- @param elapsed float
---
function onUpdatePost(elapsed)
    local health = getProperty("health")
    setProperty("iconP3.x", getProperty("iconP1.x"));
    setProperty("iconP3.y", getProperty("iconP1.y")-80)
    setProperty("iconP3.angle", getProperty("iconP1.angle"))
    setProperty("iconP3.scale.x", getProperty("iconP1.scale.x"))
    setProperty("iconP3.scale.y", getProperty("iconP1.scale.y"))
    if health > 1.6 then
        objectPlayAnimation("iconP3", "win")
    elseif health > .375 then
    
        objectPlayAnimation("iconP3", "normal")
    else
        objectPlayAnimation("iconP3", "loss")
    end
end