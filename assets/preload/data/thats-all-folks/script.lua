function onCreate()
    precacheImage("characters/TAFTransformationScene_assets")
end
function onEvent(name,value1,value2)
    if name == "Change Character" and value1 == "dad" and value2 == "cc-transformation" then
        setProperty("dad.visible", false);
        makeAnimatedLuaSprite("cc","characters/TAFTransformationScene_assets",defaultOpponentX,defaultOpponentY + 160);
        addAnimationByPrefix("cc", "idle", "TAFtransformation",24,false)
        addLuaSprite("cc")
        objectPlayAnimation("cc", "idle")
    end
    if name == "Change Character" and value1 == "dad" and value2 == "cc-phase-3" then
        setProperty("dad.visible", true);
        removeLuaText("cc",true)
    end
end
function onCreatePost()
    makeLuaSprite('Health', 'CChealth2 - copia',0,0)
	setObjectCamera('Health', 'hud')
	addLuaSprite('Health', true)
	scaleObject('Health', 0.33,0.3)
	setObjectOrder('Health', getObjectOrder('healthBar') + 3)
	setProperty('healthBar.visible', true)
 end
 function onUpdatePost()
	setProperty("Health.y", getProperty("healthBar.y")-65)
	setProperty("Health.x", getProperty("healthBar.x")-40)
end