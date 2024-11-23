local flashAlpha = 0.80


function onEvent(name,value1,v2)
    if name == 'PoliceEvent' then
       makeLuaSprite('Flash','BackGrounds/W6/images//blue',0,0);
       setObjectCamera('Flash', 'hud')
       addLuaSprite('Flash',true)
     --  setProperty('Flash.alpha',flashAlpha)
       runTimer('Bye',0.2);
    if value1 == 'red' then
        makeLuaSprite('Flash','BackGrounds/W6/images//red',0,0);
        setObjectCamera('Flash', 'hud')
        addLuaSprite('Flash',true)
    --    setProperty('Flash.alpha',flashAlpha)
        runTimer('Bye',0.2);
    end
    function onTimerCompleted(tag, loops, loopsleft)
        if tag == 'Bye' then
        doTweenAlpha('byebye', 'Flash', 0, 0.1, 'linear');
        end
        function onTweenCompleted(tag)
        if tag == 'byebye' then
        removeLuaSprite('Flash', true);
        end
        end
        end
    end
end