function onCountdownStarted()
    triggerEvent('Alt Idle Animation',"gf","-alt")
    makeLuaSprite('BlackFlash', 'BlackFlash', -800, -500);
    scaleObject('BlackFlash', 18, 22);
   addLuaSprite('BlackFlash', true)
-- setProperty('BlackFlash.visible', true);
end
function onCreatePost()
    setProperty("iconP4.visible", false)
end