PressActive = false

function onCreate()
precacheImage('BackGrounds/W16/Auditor Castle');
precacheImage('events/unstoppable/deimosDside');
addCharacterToList('Pico-D', 'boyfriend')
end

function onCreatePost()

	makeLuaSprite('stageback', 'BackGrounds/W16/Auditor Castle', -550, -500);
	setScrollFactor('stageback', 1.0, 1.0);
        scaleObject('stageback', 1.8, 1.8);
	
	makeLuaSprite('ligths', 'BackGrounds/W16/Sun-light', -550, -900);
	setScrollFactor('ligths', 1.0, 1.0);
        setObjectOrder('lights', 27);
        setProperty('ligths.alpha', 0.7);
	scaleObject('ligths', 1.8, 1.8);

        if songName == "Madness" then
	if not lowQuality then
        makeAnimatedLuaSprite( 'auditor', 'BackGrounds/W16/auditor', 450, -220)
	addAnimationByPrefix('auditor','idle','idle', 24, true)
        setProperty("auditor.scale.x", 0.50);
        setProperty("auditor.scale.y", 0.50);
	setLuaSpriteScrollFactor('auditor', 1.0, 1.0)
end
end
        makeAnimatedLuaSprite('hankmos', 'events/unstoppable/deimosDside', getProperty('dad.x') + 300, getProperty('dad.y') - 1090);
        addAnimationByIndices('hankmos', 'fall', 'fall instancia 1', '0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25', 24);
        luaSpritePlayAnimation('hankmos', 'fall');
        setProperty('hankmos.color', "000000")
        setObjectCamera('hankmos', 'camGame');
        setProperty('hankmos.alpha', 0.00001);
        scaleLuaSprite('hankmos', 0.75, 0.75);
        if songName == "Madness" then
        makeLuaText("skip", "PRESS [SPACE] TO SKIP", 1300, 0, 70)
        setTextSize("skip", 40)
        setObjectCamera('skip', 'camOther');
        setTextFont('skip', 'impacted.ttf')
        setTextColor('skip', 'ff0000');
        setProperty('skip.alpha', 0.00001)   
        addLuaText("skip");
        end
	addLuaSprite('stageback', false);
        addLuaSprite('hankmos', false);
	addLuaSprite('ligths', true);
        addLuaSprite('auditor', false);

        runTimer("canPress", 2)
        runTimer("NOTcanPress", 10)

        setProperty('timeBar.color', getColorFromHex('654789'))
        setPropertyFromClass('lime.app.Application', 'current.window.title', "You will not escape from the jester, the jester will catch you")
        if boyfriendName == "mariP1" then
                setProperty("boyfriend.y", getProperty("boyfriend.y")+ 130)
        end
end

function onUpdatePost()
        if songName == "Madness" then
   if PressActive then
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE')then
       setPropertyFromClass('Conductor', 'songPosition', 12000)
       setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
       setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
       PressActive = false
       doTweenAlpha('ChaoSkipo', 'skip', 0, 1.0, 'smootherStepOut')
--Skip effects
       cancelTween('camzAMN2')
       --setProperty('defaultCamZoom', 0.7)
       doTweenZoom('ZOOMback','camGame', 0.7, 0.9, 'smootherStepOut')
       setProperty('fade2.visible', false)
       triggerEvent('Camera Follow Pos', '', '')
       setProperty('camHUD.alpha', 1)
       setProperty('cameraSpeed', 1.5)
end
end
 if difficulty == 1 then
       setPropertyFromClass('Conductor', 'songPosition', 10000)
       setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
       setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
       PressActive = false
       doTweenAlpha('ChaoSkipo', 'skip', 0, 1.0, 'smootherStepOut')

       doTweenAlpha('chao', 'fade', 0, 2.0, 'smootherStepOut')
      setProperty('fade.visible', false)
       doTweenZoom('camzAMN2','camGame', 0.75, 1, 'smootherStepOut')
       doTweenY('gobyesomewhere', 'somewhere.scale', 0, 0.8, 'elasticInOut')
       doTweenAlpha('mentiracam', 'camHUD', 1, 1, 'smootherStepOut')
           end
        end
    end

function onEvent(name, value1, value2)
	if name == 'finalACT' and value1 == 'fall' then
            setProperty('hankmos.alpha', 1);
            runTimer("isthathank", 0.2)
            luaSpritePlayAnimation('hankmos', 'fall');
            runTimer('playerTIMER', 0.12)
   end

	if name == 'finalACT' and value1 == 'Shoot' then
            cameraFlash('camOther','0xFFff000a',0.2)
            setProperty('camGame.alpha', 0);
   end
	if name == 'legacy' and value1 == 'intro' then

	makeLuaSprite('fade', 'Black', -1000, -500)
        scaleObject('fade', 4, 4)
        setProperty('fade.alpha', 0.00001)
	addLuaSprite('fade', true)
        setObjectOrder('fade', 100);
	setObjectCamera('fade', 'camOther')

	makeLuaSprite('somewhere', 'somewhere', 30, 220, screenHeight / 2 + -100)
        scaleObject('somewhere', 0.4, 0.4)
	addLuaSprite('somewhere', true)
        setObjectOrder('somewhere', 106);
        setProperty('somewhere.alpha', 0.00001)
	setObjectCamera('somewhere', 'camOther')

        doTweenAlpha('hola', 'fade', 0.85, 3.5, 'smootherStepOut')
        doTweenAlpha('byebyecam', 'camHUD', 0.00001, 1.9, 'smootherStepOut')

        runTimer("holasomewhere", 1)
   end
	if name == 'legacy' and value1 == 'final' then
        doTweenAlpha('byebyecamahorasi', 'camHUD', 0.00001, 1.0, 'smootherStepOut')
   end
end

function onTweenCompleted(tag)
     if tag == ('holasom') then
     doTweenAlpha('chao', 'fade', 0, 2.0, 'smootherStepOut')
     doTweenZoom('camzAMN2','camGame', 0.75, 1, 'smootherStepOut')
     doTweenY('gobyesomewhere', 'somewhere.scale', 0, 0.8, 'elasticInOut')
     doTweenAlpha('mentiracam', 'camHUD', 1, 1, 'smootherStepOut')
end
end
function onTimerCompleted(tag)  
if tag =='holasomewhere' then
        doTweenAlpha('holasom', 'somewhere', 1, 5.5, 'smootherStepOut')
        doTweenZoom('camzamnes','camGame', 0.85, 5.5 ,'sineInOut')
   end 
if tag =='isthathank' then
           doTweenColor('deimosReveal', 'hankmos', 'FFFFFF', 0.3, 'smootherStepOut');
   end 
if tag =='canPress' then
           PressActive = true
           doTweenAlpha('FundidoSkipo', 'skip', 1, 1.0, 'smootherStepOut')
     end
if tag =='NOTcanPress' then
           PressActive = false
           doTweenAlpha('ChaoSkipo', 'skip', 0, 1.0, 'smootherStepOut')
     end
if tag =='playerTIMER' then
           triggerEvent("Alt Idle Animation", "BF", "-miss");
   end
end