-- -- script by Archie

 local allowCountdown = false

 function onStartCountdown()
blueBalls = getPropertyFromClass("PlayState", "deathCounter")
     if not allowCountdown  and blueBalls < 1 then -- Block the first countdown
         startVideo('intro'); -- your Video's name | video (must be 1280x720) paste into "videos" folder 
         allowCountdown = true;
         return Function_Stop;
         
     end

     return Function_Continue;

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