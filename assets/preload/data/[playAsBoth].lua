local initFocus = nil
local isSet = false
local sing = {'LEFT', 'DOWN', 'UP', 'RIGHT'}

function onMoveCamera(focus)
 if not isSet then initFocus=focus; isSet=true end
end

function onCreatePost()
 setProperty('camZooming', true)
 setProperty('boyfriend.hasMissAnimations', false)
 for i = 0, getProperty('opponentStrums.length')-1 do
  setPropertyFromGroup('opponentStrums', i, 'visible', false)
 end

 if not middlescroll then
  if initFocus == 'dad' then
   daTweenDir(4, 92) daTweenDir(5, 204)
   daTweenDir(6, 316) daTweenDir(7, 428)
  end
 end

 for i = 0, getProperty('unspawnNotes.length') do
  mustPress = getPropertyFromGroup('unspawnNotes', i, 'mustPress')
  if not mustPress then
   setPropertyFromGroup('unspawnNotes', i, 'noteType', 'dadSing')
   setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
   setPropertyFromGroup('unspawnNotes', i, 'hitHealth', -0.023)
   setPropertyFromGroup('unspawnNotes', i, 'missHealth', -0.048)
  end
  setPropertyFromGroup('unspawnNotes', i, 'mustPress', true)
 end
end

function goodNoteHit(i,d,t,s)
 setProperty('dad.color', getColorFromHex('FFFFFF'))
 if t == 'dadSing' then
  characterPlayAnim('dad', 'sing'..sing[d+1], true)
  setProperty('dad.holdTimer', 0)
  if altAnim == true then
   characterPlayAnim('dad', 'sing'..sing[d+1]..'-alt', true)
  end
 else
  runTimer('bfdance', (getProperty('boyfriend.singDuration')*stepCrochet)/1000)
 end
end

function noteMiss(i,d,t,s)
 if t == 'dadSing' then
--triggerEvent('Play Animation', 'sing'..sing[d+1]..'miss', 'dad')
  characterPlayAnim('dad', 'sing'..sing[d+1], true)
  setProperty('dad.holdTimer', 0)
  runTimer('bu', (getProperty('dad.singDuration')*stepCrochet)/1000)
  setProperty('dad.color', getColorFromHex('FFFFFF'))
  runTimer('becamePurple', 0.024)
  setProperty('health', getProperty('health')+0.096)
  setProperty('boyfriend.hasMissAnimations', false)
 else
  characterPlayAnim('boyfriend', 'sing'..sing[d+1]..'miss', true)
  runTimer('bfdance', (getProperty('boyfriend.singDuration')*stepCrochet)/1000)
 end
end

function noteMissPress()
 if not mustHitSection then
  setProperty('health', getProperty('health')+0.096)
 end
end

function onBeatHit()
 if curBeat %4==0 then
  if not middlescroll then
   if not mustHitSection then
    daTweenDir(4, 92) daTweenDir(5, 204)
    daTweenDir(6, 316) daTweenDir(7, 428)
   else
    daTweenDir(4, 732) daTweenDir(5, 844)
    daTweenDir(6, 956) daTweenDir(7, 1068)
   end
  end
 end
end

function onTimerCompleted(t)
 if t == 'bfdance' then
--  characterDance('boyfriend')
  characterPlayAnim('boyfriend', 'idle')
 end
 if t == 'becamePurple' then
  setProperty('dad.color', getColorFromHex('AF00FF'))
 end
 if t == 'bu' then
  setProperty('dad.color', getColorFromHex('FFFFFF')) 
 end
end

function onGameOver()
 return Function_Stop
end

function daTweenDir(s,d)
 noteTweenX('wii'..s+d, s, d, stepCrochet*0.008, 'circOut')
end

function onUpdatePost()
 if getProperty('health') < 0 then setProperty('health', 0) end
end