function onCreatePost()	
	makeLuaSprite('fade', '', -1000, -500)
        makeGraphic('fade',screenWidth,screenHeight,'000000')
        scaleObject('fade', 4, 4)
	addLuaSprite('fade', true)
        setProperty('fade.alpha', 0.00001)
        setObjectOrder('fade', 100);
	setObjectCamera('fade', 'camHUD')

	makeLuaSprite('fade2', '', 0, 0)
        makeGraphic('fade2',screenWidth,screenHeight,'000000')
        scaleObject('fade2', 4, 4)
	addLuaSprite('fade2', true)
        setObjectOrder('fade2', 100);
	setObjectCamera('fade2', 'camOther')

	makeLuaSprite('somewhere', 'somewhere', 30, 220, screenHeight / 2 + -100)
        scaleObject('somewhere', 0.4, 0.4)
	addLuaSprite('somewhere', true)
        setObjectOrder('somewhere', 106);
        setProperty('somewhere.alpha', 0)
	setObjectCamera('somewhere', 'camOther')

        makeLuaText('caption', 'AND IM SUPPOSED TO BE THE CLOWN!', 1000, 150, 280)
        setTextFont('caption', 'Impacted.ttf')
        setTextColor('rojo', 0xE8FC0A2A)
        setTextSize('caption', 75);
        addLuaText('caption')
        setProperty('caption.alpha', 0.00001)
        setObjectOrder('caption', 101);
	setObjectCamera('caption', 'camHUD');
        setTextAlignment('caption', 'center')

        makeLuaText('captionaf', 'AND IM SUPPOSED TO BE THE CLOWN!', 1000, 150, 280)
        setTextFont('captionaf', 'Impacted.ttf')
        setTextSize('captionaf', 75);
        addLuaText('captionaf')
        setProperty('captionaf.alpha', 0.00001)
        setObjectOrder('captionaf', 101);
	setObjectCamera('captionaf', 'camHUD');
        setTextAlignment('captionaf', 'center')

        makeLuaText('caption2', 'AND NOW....', 1000, 150, 280)
        setTextFont('caption2', 'Impacted.ttf')
        setTextColor('caption2', FF0000)
        setTextSize('caption2', 75);
        addLuaText('caption2')
        setProperty('caption2.alpha', 0.00001)
        setObjectOrder('caption2', 101);
	setObjectCamera('caption2', 'camHUD');
        setTextAlignment('caption2', 'center')

        makeLuaText('captionf', 'AS MY FINAL ACT....', 1000, 150, 280)
        setTextFont('captionf', 'Impacted.ttf')
        setTextColor('captionf', FF0000)
        setTextSize('captionf', 75);
        addLuaText('captionf')
        setProperty('captionf.alpha', 0.00001)
        setObjectOrder('captionf', 101);
	setObjectCamera('captionf', 'camHUD');
        setTextAlignment('captionf', 'center')

        makeLuaText('caption3', 'AS MY FINAL ACT....', 1000, 150, 280)
        setTextFont('caption3', 'Impacted.ttf')
        setTextColor('caption3', 0xE8FC0A2A)
        setTextSize('caption3', 75);
        addLuaText('caption3')
        setProperty('caption3.alpha', 0.00001)
        setObjectOrder('caption3', 101);
	setObjectCamera('caption3', 'camHUD');
        setTextAlignment('caption3', 'center')

        doTweenAlpha('holasomewhere', 'somewhere', 1, 2.5, 'smootherStepOut')
        triggerEvent('Camera Follow Pos', 1200, -150)
        setProperty('camHUD.alpha', 0.00001)
        doTweenZoom('camzAMN','camGame', 4.0, 0.2, 'smootherStepOut')
end

function onUpdatePost()
        setStringAngle = math.random(-7, 7)
        setProperty('captionf.angle', setStringAngle)
end

function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	doTweenAlpha('fadeoutt', 'fade2', 0, 19, 'smootherStepOut')
end

function onTweenCompleted(tag)
     if tag == ('camzAMN') then
     doTweenZoom('camzAMN2','camGame', 0.6, 15, 'smootherStepOut')
     end
     if tag == ('holasomewhere') then
     doTweenAlpha('adiossomewhere','somewhere', 0, 2.2, 'smootherStepOut')
     end
    if tag == 'adiossomewhere' then
        removeLuaSprite('somewhere', true)
    end
    if tag == 'fadeoutt' then
        removeLuaSprite('fade2', true)
    end
    if tag == 'adios' then
        removeLuaText('caption', true)
    end
    if tag == 'adio' then
        removeLuaText('captionaf', true)
    end
    if tag == 'CHAO2' then
        removeLuaText('caption2', true)
        removeLuaText('caption3', true)
    end
end

function onStepHit()
 if curStep == 1 then
       setProperty('cameraSpeed', 0.1)
       triggerEvent('Camera Follow Pos', 1200, 1000)
   end
 if curStep == 128 then
        doTweenAlpha("Aparecimiento", 'camHUD', 1, 4, "smootherStepOut")
        setProperty('defaultCamZoom', 0.7)
	triggerEvent('Camera Follow Pos', '', '')
        setProperty('cameraSpeed', 1.5)
	runHaxeCode([[
	   FlxTween.cancelTweensOf(FlxG.camera.target);
           FlxTween.cancelTweensOf(FlxG.camera);
				]])
   end

 if curStep == 1024 then
       triggerEvent('Camera Follow Pos', '1050', '800')
   end
if curStep == 1088 then
       triggerEvent('Camera Follow Pos', '', '')
   end
 if curStep == 1168 then
        noteTweenAlpha("Note0", 0, 0.7, 1, ".cubeInOut")
        noteTweenAlpha("Note1", 1, 0.7, 1, ".cubeInOut")
        noteTweenAlpha("Note2", 2, 0.7, 1, ".cubeInOut")
        noteTweenAlpha("Note3", 3, 0.7, 1, ".cubeInOut")
        triggerEvent('Camera Follow Pos', 700, 1050)
        setProperty('defaultCamZoom', 0.85)
        doTweenAlpha("difuminacion", 'camHUD', 0.8, 0.2, "smootherStepOut")
   end
 if curStep == 1213 then
        triggerEvent('Camera Follow Pos', '', '')
        noteTweenAlpha("Note0.5", 0, 1, 1, ".cubeInOut")
        noteTweenAlpha("Note1.5", 1, 1, 1, ".cubeInOut")
        noteTweenAlpha("Note2.5", 2, 1, 1, ".cubeInOut")
        noteTweenAlpha("Note3.5", 3, 1, 1, ".cubeInOut")
        doTweenAlpha("difuminacion", 'camHUD', 1, 0.2, "smootherStepOut")
   end               
 if curStep == 1853 then
        doTweenAlpha("holaotra", 'fade', 1, 0.4, "smootherStepOut")
   end
 if curStep == 1856 then
        doTweenAlpha("holaotrave", 'caption', 1, 0.2, "smootherStepOut")
   end
 if curStep == 1881 then
        setProperty('captionaf.color', getColorFromHex('FF0000'))
        setProperty('captionaf.alpha', 0.3)
        setProperty('caption.color', getColorFromHex('FF0000'))
   end        
 if curStep == 1888 then
        doTweenAlpha("adio", 'captionaf', 0, 0.5, "smootherStepOut")
        doTweenAlpha("adios", 'caption', 0, 0.5, "smootherStepOut")
        doTweenAlpha("adiostrave", 'fade', 0, 0.5, "smootherStepOut")
   end
 if curStep == 1966 then
        triggerEvent('Camera Follow Pos', 780, 1050)
        doTweenAlpha("difuminacion", 'camHUD', 0.5, 0.7, "smootherStepOut")
   end
 if curStep == 1983 then
        triggerEvent('Camera Follow Pos', '', '')
        doTweenAlpha("difuminacion", 'camHUD', 1, 1, "smootherStepOut")
   end 
 if curStep == 2380 then
        setProperty('caption2.color', getColorFromHex('FF0000'))
        doTweenAlpha("holaotra", 'fade', 1, 0.4, "smootherStepOut")
        doTweenAlpha("HOLAAA", 'caption2', 1, 0.4, "smootherStepOut")
   end   
 if curStep == 2398 then
        setProperty('caption3.color', getColorFromHex('FF0000'))
       setProperty('captionf.color', getColorFromHex('FF0000'))
        doTweenAlpha("HOLAAA", 'caption2', 0, 0.8, "smootherStepOut")
        doTweenAlpha("HOLAAA2", 'caption3', 1, 1.2, "smootherStepOut")
        doTweenAlpha("HOLAAA3", 'captionf', 0.3, 1.2, "smootherStepOut")
   end   
 if curStep == 2432 then
        doTweenAlpha("CHAO2", 'camHUD', 0, 0.2, "smootherStepOut")
   end  
end
