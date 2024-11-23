hasCreeps = false;
function onCreate()
	
	makeLuaSprite('sky', 'weeb/weebSky', 0, 0);
	setScrollFactor('sky', 0.1, 0.1);
	setProperty('sky.antialiasing', false);
	widShit = math.floor(getProperty('sky.width') * 6);
	scaleObject('sky', 6, 6);
	addLuaSprite('sky', false);

	repositionShit = -200;
	makeLuaSprite('school', 'weeb/weebSchool', -300, 0);
	setScrollFactor('school', 0.6, 0.9);
	setProperty('school.antialiasing', false);
	scaleObject('school', 6, 6);
	addLuaSprite('school', false);
	
	makeLuaSprite('street', 'weeb/weebStreet', repositionShit, -100);
	setScrollFactor('street', 0.95, 0.95);
	setProperty('street.antialiasing', false);
	scaleObject('street', 6,7);
	addLuaSprite('street', false);
	makeAnimatedLuaSprite('speaker','speakers/gfPixel',350, 200);
addAnimationByPrefix('speaker', 'idle', 'GF IDLE', 24, true)
addLuaSprite('speaker',false)
scaleObject('speaker', 6,6)
setProperty('speaker.antialiasing', false);
setObjectOrder('speaker',getObjectOrder('school2')+ 4)




	if not lowQuality then
		makeLuaSprite('treesBack', 'weeb/weebTreesBack', repositionShit + 170, 130);
		setScrollFactor('treesBack', 0.9, 0.9);
		setProperty('treesBack.antialiasing', false);
		setGraphicSize('treesBack', math.floor(widShit * 0.8));
	--	addLuaSprite('treesBack', false);
	end
	
	makeAnimatedLuaSprite('trees', 'weeb/weebTrees', repositionShit - 650, -1200, 'packer');
	addAnimation('trees', 'treeLoop', {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}, 12, true);
	setScrollFactor('trees', 0.85, 0.85);
	setProperty('trees.antialiasing', false);
	setGraphicSize('trees', math.floor(widShit * 1.8));
	addLuaSprite('trees', false);

	-- background things that only load if you have low quality option turned off
	if not lowQuality then
		makeAnimatedLuaSprite('petals', 'weeb/petals', repositionShit, -40);
		addAnimationByPrefix('petals', 'idle', 'PETALS ALL', 24, true);
		setScrollFactor('petals', 0.85, 0.85);
		setProperty('petals.antialiasing', false);
		setGraphicSize('petals', widShit);
		addLuaSprite('petals', false);

		makeAnimatedLuaSprite('bgGirls', 'weeb/bgFreaks', 30, 200);
		scaleObject('bgGirls', 6, 6);
		setScrollFactor('bgGirls', 0.9, 0.9);
		setProperty('bgGirls.antialiasing', false);
		addLuaSprite('bgGirls', false);
		setObjectOrder('bgGirls',getObjectOrder('school2')+ 4)

		swapDanceType();
		hasCreeps = true;
		--scaleObject('speaker', 6,6)
	end

	-- death screen properties
	setPropertyFromClass('GameOverSubstate', 'characterName', 'pixelDead');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx-pixel');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-pixel');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd-pixel');
end

danceDir = false;
function onBeatHit()
	if hasCreeps then
		creepsDance();
	end
   if dadName == 'suma-pixel-sad' then
	triggerEvent('BG Freaks Expression', '2', '')
--	triggerEvent('Alt Idle Animation', '-alt', 'gf')

	end
end

function onStepHit()

    if curStep == 1408 then

		setProperty('camHUD.alpha',0)
    end


end

function opponentNoteHit()

      health = getProperty('health')
    if getProperty('health') > 0.3 then
       setProperty('health', health- 0.008);

    end
end

function onEvent(name, value1, value2)
	if name == 'BG Freaks Expression' then
		if hasCreeps then
		luaSpriteAddAnimationByIndices('bgGirls', 'danceRight', 'BG fangirls dissuaded', '15,16,17,18,19,20,21,22,23,24,25,26,27,28,29', 24);
		luaSpriteAddAnimationByIndices('bgGirls', 'danceLeft', 'BG fangirls dissuaded', '0,1,2,3,4,5,6,7,8,9,10,11,12,13', 24);		end
	end
end

isPissed = true;
function swapDanceType()
	isPissed = not isPissed;
	if not isPissed then
		luaSpriteAddAnimationByIndices('bgGirls', 'danceRight', 'BG fangirls dissuaded', '15,16,17,18,19,20,21,22,23,24,25,26,27,28,29', 24);
		luaSpriteAddAnimationByIndices('bgGirls', 'danceLeft', 'BG fangirls dissuaded', '0,1,2,3,4,5,6,7,8,9,10,11,12,13', 24);
	else
		luaSpriteAddAnimationByIndices('bgGirls', 'danceRight', 'BG fangirls dissuaded', '15,16,17,18,19,20,21,22,23,24,25,26,27,28,29', 24);
		luaSpriteAddAnimationByIndices('bgGirls', 'danceLeft', 'BG fangirls dissuaded', '0,1,2,3,4,5,6,7,8,9,10,11,12,13', 24);
	end
	creepsDance();
end

function creepsDance()
	danceDir = not danceDir;
	if danceDir then
		playAnim('bgGirls', 'danceRight', true);
	else
		playAnim('bgGirls', 'danceLeft', true);
	end
end
function onCreatePost()
	if boyfriendName == "mariPixelP1" then
		setProperty("boyfriend.y", defaultBoyfriendY + 300)
	end
	setProperty("boyfriend.scale.x", 6.20);
	setProperty("boyfriend.scale.y", 6.20);
end
function onUpdate()
	if keyboardJustPressed("E") then
	endSong()
	end  
end