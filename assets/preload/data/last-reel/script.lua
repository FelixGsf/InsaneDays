function onCreate()
    addLuaScript('extra_scripts/PiperStrickerScript')
    callScript('extra_scripts/PiperStrickerScript','enableAttack',{true})
    if (not lowQuality) then
        addLuaScript('scripts/bendyScripts/InkRain')
    end
    
end
function onBeatHit()
    if (curStep > 1664 and curStep < 1792) then
        if (getProperty('health') > 0.05 and curStep < 1792) then
            setProperty('health',getProperty('health') - 0.005)
        end
    end
end

function onSectionHit()
    if curSection == 104 then
     --   callScript('extra_scripts/PiperStrickerScript','enableAttack',{false})
        callScript('scripts/bendyScripts/InkRain','active',{true})
    elseif curSection == 112 then
        callScript('scripts/bendyScripts/InkRain','active',{false})
    end
end

function onTweenCompleted(tag)
    if tag == 'byeInkRain' then
        for ink = 1,3 do
            removeLuaSprite('InkedShit'..ink,true)
        end
        removeLuaSprite('InkedRain',true)
        removeLuaScript('extra_scripts/InkRain')

    end
end