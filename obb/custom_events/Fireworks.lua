function onSongStart()
    onNoLag()
end
function onEvent(name, value1, value2)
    if name == 'Fireworks' then
        makeAnimatedLuaSprite('FireWorks','BackGrounds/W5/images/fireworks',900,-1000)
        setScrollFactor('FireWorks', 1.4, 1.4)
        addAnimationByPrefix('FireWorks','blue','FireworkBlue',24,false);
        addAnimationByPrefix('FireWorks','green','FireworkGreen',24,false);
        addAnimationByPrefix('FireWorks','red','FireworkRed',24,false);
        addAnimationByPrefix('FireWorks','pink','FireworkPink',24,false);
        precacheImage('Fireworks', true)
        setProperty('FireWorks.visible', true)
        addLuaSprite('FireWorks',false);
        runTimer('Die', 0.50)
        
    if value2 == 'blue' then
        objectPlayAnimation('FireWorks', 'blue', true);
    elseif value2 == 'green' then
        objectPlayAnimation('FireWorks', 'green', true);
    elseif value2 == 'red' then
        objectPlayAnimation('FireWorks', 'red', true);
    elseif value2 == 'pink' then
        objectPlayAnimation('FireWorks', 'pink', true);
        
    end
end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'Die' then
        doTweenAlpha('byebye', 'Fireworks', 0, 0.1, 'linear');
    end 
end
function onTweenCompleted(tag)
    if tag == 'byebye' then
        removeLuaSprite('FireWorks')
    end
    end
--recreation by felixGSF
function onNoLag()
    precacheImage('fireworks', true);
    makeAnimatedLuaSprite('FireWorks','BackGrounds/W5/images/fireworks',value1,-1000)
    setScrollFactor('FireWorks', 1.4, 1.4)
    addAnimationByPrefix('FireWorks','blue','FireworkBlue',24,false);
    addLuaSprite('fireWorks',false)
    setProperty('FireWorks.visible', false);
end
