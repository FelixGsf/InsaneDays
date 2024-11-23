function onEvent(name, value1, value2)

 if name == 'countdown' then
  playSound('intro3', 20)
  setProperty('defaultCamZoom', 1.0)
  runTimer('wait2', crochet/1000)

 end
end

function onTimerCompleted(tag)

 if tag == 'wait2' then

  playSound('intro2', 20)
  setProperty('defaultCamZoom', 1.1)

  makeLuaSprite('countdownready', 'ready',262,178)
  setObjectCamera('countdownready', 'camOther')
  addLuaSprite('countdownready', true)
  doTweenAlpha('readyend','countdownready',0,crochet/1000,'cubeInOut')
  runTimer('wait1', crochet/1000)

 end

 if tag == 'wait1' then

  playSound('intro1', 20)
  setProperty('defaultCamZoom', 1.15)

  makeLuaSprite('countdownset', 'set',289,199)
  setObjectCamera('countdownset', 'camOther')
  addLuaSprite('countdownset', true)
  doTweenAlpha('setend','countdownset',0,crochet/1000,'cubeInOut')
  runTimer('waitgo', crochet/1000)

 end

 if tag == 'waitgo' then

  playSound('introGo', 7)
  setProperty('defaultCamZoom', 0.9)

  makeLuaSprite('countdowngo', 'go',361,145)
  setObjectCamera('countdowngo', 'camOther')
  doTweenAlpha('goend','countdowngo',0,crochet/1000,'cubeInOut')
  doTweenAlpha('fadeout2.5', 'camHUD', 1, 1, 'smootherStepOut')
  addLuaSprite('countdowngo', true)

 end
end