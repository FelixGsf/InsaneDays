pause = false
function onEvent(name,value1,value2)
    if name == "pause"  then
        pause = true
        CreateWarning()
    end
    if pause == true  then 
        if keyJustPressed('space') then
            playSound('clickText',1)
         --   runTimer("bugFix",1) --esto ayuda a que el sonido no se reproduzca en el transcurso de las canciones por alguna u otra razon
end
end
end
function CreateWarning()
    makeLuaSprite("warn","mecanics/"..week,0,0);
    playSound("tea-time",1,"sound1")
    addLuaSprite("warn")
    setObjectCamera("warn","other");
end
function onUpdate()
    if pause == true then
        setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition')-16) -- it is counted by milliseconds, 1000 = 1 second
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
		setProperty('vocals.volume', 0)
    end
 if keyJustPressed("space") then
    pause = false
    stopSound("sound1")
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
		setProperty('vocals.volume', 1)	
        removeLuaSprite("warn")	
    end
end
--porfavor no modifiques nada de este script... casi que no logro que funcione correctamente..