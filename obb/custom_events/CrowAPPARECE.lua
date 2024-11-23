function onEvent(name, value1, value2)
    if name == "CrowAPPARECE" then
        makeAnimatedLuaSprite('Crow','BackGrounds/W10/images/bgGhouls',100,980);
        scaleObject('Crow',5,5)
        addAnimationByPrefix('Crow', 'idle', 'BG freaks glitch instance', 24, true)
        addLuaSprite('bg')
        addLuaSprite('speaker',false)
        addLuaSprite('Crow',true);
        setObjectOrder('Crow', getObjectOrder('gfGroup')+ 1) -- change 4 to 1 if you want to make gf icon behind bf and dad icons
     --   setProperty('Crow.visible',value2)
        setProperty('Crow.visible',true)
runTimer('Crow',1.40)

    end
end
function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'Crow' then
		doTweenAlpha('byebye', 'Crow', 0, 0.1, 'linear');
    end
    end
    
    function onTweenCompleted(tag)
    if tag == 'byebye' then
        removeLuaSprite('Crow')
    end
    end
