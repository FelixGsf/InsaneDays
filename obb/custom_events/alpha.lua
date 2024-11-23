
function onEvent(name, value1,value2)
	if name == 'alpha' then
	runTimer('BlackFlash',1.30)

end
end
function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'BlackFlash' then
		doTweenAlpha('byebye', 'BlackFlash', 0, 0.1, 'linear');
    end
    end
    
    function onTweenCompleted(tag)
    if tag == 'byebye' then
        removeLuaSprite('BlackFlash')
    end
    end
