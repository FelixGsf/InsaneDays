
function onEvent(name, value1,value2)
	if name == 'death' then
	setPropertyFromClass('GameOverSubstate', 'characterName', value1); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', value2); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/

	 if songName == 'no more drogs' then
		setPropertyFromClass('GameOverSubstate', 'characterName', value1); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', value2); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'rayogameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'rayogameOverEnd'); --put in mods/music/
	end
end
end