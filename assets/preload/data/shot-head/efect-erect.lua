function onCreate()
  
    makeAnimatedLuaSprite('edc', 'EF/blam 1', -400, 410)
    addAnimationByPrefix('edc','EF/blam 1','param 1 instancia 1',60,true)
    scaleObject('edc', 2, 2)
    addLuaSprite('edc',true)
    setScrollFactor('edc', 0, 0.9);
    setProperty('edc', 0)

end

function onUpdate()
    precacheImage('EF/blam 1');
    precacheImage('EF/blam2');
    if curStep == 0 then
        doTweenAlpha('edc','edc', 0, stepCrochet*0.0000001, 'linear')
    end
    if curStep == 3 then
        doTweenAlpha('edc','edc', 0.5, stepCrochet*0.01, 'linear')
    end
    if curStep == 127 then
        doTweenAlpha('edc','edc', 0, stepCrochet*0.01, 'linear')
    end
    if curStep == 512 then
        doTweenAlpha('edc','edc', 0.5, stepCrochet*0.01, 'linear')
    end
    if curStep == 768 then
        doTweenAlpha('edc','edc', 0, stepCrochet*0.005, 'linear')
    end
end