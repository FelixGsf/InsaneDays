local press = false
function onUpdatePost()
    if getPropertyFromClass("PlayState", "deathCounter") >= 1 then
    if  press == false then
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
        press = true
      --  debugPrint('time skip!')
    setPropertyFromClass('Conductor', 'songPosition',11000)
       setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
       setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
       doTweenAlpha("se", "skip", 0, 2, "linear")
end
end
end
end
function onCreate()
    if getPropertyFromClass("PlayState", "deathCounter") >= 1 then
    makeLuaText('skip','Preiona (espacio) para \n saltar la intro!',screenHeight,300,400);
    runTimer("bye",4);
    --setProperty('skip.y', nil)
    setTextSize('skip',25);
    addLuaText('skip')
end
end
function onTimerCompleted(tag)
    if tag == "bye" then
        doTweenAlpha("se", "skip", 0, 2, "linear")
    end
end