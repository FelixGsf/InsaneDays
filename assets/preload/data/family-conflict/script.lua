function onSongStart()
if boyfriendName == 'felixChrima' then
	playSound('voicesF_bf', 1.0, 'bv');
elseif boyfriendName == 'namyp1' then
	playSound('voicesF_gf', 1.0, 'gv');
end
end

function onPause()
pauseSound('bv')

pauseSound('gv')
end

function onResume()
resumeSound('bv')

resumeSound('gv')
end

function onGameOver()
stopSound('bv')

stopSound('gv')
end

function noteMissPress(direction)
soundFadeIn('bv', 0.5, 0, 1)

soundFadeIn('gv', 0.5, 0, 1)
end

function noteMiss(id, direction, noteType, isSustainNote)
soundFadeIn('bv', 0.5, 0, 1)

soundFadeIn('gv', 0.5, 0, 1)
end