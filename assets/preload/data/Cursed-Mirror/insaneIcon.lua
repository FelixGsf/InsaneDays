local frame = 154;
function onCreatePost()
    precacheImage("icons/billyicon")
    makeAnimatedLuaSprite('a','', 0,0)
    loadGraphic('a','icons/billyicon', frame,129)
setObjectCamera("a",'hud')
setProperty("a.visible", true)
setProperty("a.alpha", 1)
addAnimation('a','icons/billyicon', {0, 1, 2, 3, 4}, 0)
addLuaSprite('a');
setProperty('a.animation.curAnim.curFrame', 1)
end
function onUpdatePost()
    setProperty("iconP2.visible", false)
    setObjectOrder('a', getObjectOrder("iconP1")-1)
    setProperty("a.scale.x", getProperty("iconP2.scale.x"))
    setProperty("a.scale.y", getProperty("iconP2.scale.y"))
    setProperty("a.angle", getProperty("iconP2.angle"))
    setProperty("a.x", getProperty("iconP2.x")-40)
    setProperty("a.y", getProperty("iconP2.y")-20)
    if curStep == 1424 then
        setProperty('a.animation.curAnim.curFrame', 2)
    end
    if curStep == 2064 then
        setProperty('a.animation.curAnim.curFrame', 0)
    end
    if curStep == 2832 then
        setProperty('a.animation.curAnim.curFrame', 3)
    end
    if curStep == 3088 then
        setProperty('a.animation.curAnim.curFrame', 4)
    end
    setProperty("a.alpha",getProperty("bar.alpha"))
end