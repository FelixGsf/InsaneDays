hasCreeps = false;
function onCreate()
	makeLuaSprite('sky', 'weeb/weebSky', 0, 0);
	setScrollFactor('sky', 0.1, 0.1);
	setProperty('sky.antialiasing', false);
	widShit = math.floor(getProperty('sky.width') * 6);
	scaleObject('sky', 6, 6);
	addLuaSprite('sky', false);

	repositionShit = -200;
	makeLuaSprite('school', 'weeb/weebSchool', repositionShit, 0);
	setScrollFactor('school', 0.6, 0.9);
	setProperty('school.antialiasing', false);
	scaleObject('school', 6, 6);
	addLuaSprite('school', false);
	
	makeLuaSprite('street', 'weeb/weebStreet', repositionShit, 0);
	setScrollFactor('street', 0.95, 0.95);
	setProperty('street.antialiasing', false);
	scaleObject('street', 6, 6);
	addLuaSprite('street', false);
	makeAnimatedLuaSprite('speaker','speakers/gfPixel',350, 200);
	addAnimationByPrefix('speaker', 'idle', 'GF IDLE', 24, true)
	setProperty('speaker.antialiasing', false);
addLuaSprite('speaker',false)
scaleObject('speaker', 6,6)
setObjectOrder('speaker',getObjectOrder('school')+ 2)

	if not lowQuality then
		makeLuaSprite('treesBack', 'weeb/weebTreesBack', repositionShit + 170, 130);
		setScrollFactor('treesBack', 0.9, 0.9);
		setProperty('treesBack.antialiasing', false);
		setGraphicSize('treesBack', math.floor(widShit * 0.8));
		--addLuaSprite('treesBack', false);
	end
	
	makeAnimatedLuaSprite('trees', 'weeb/weebTrees', repositionShit - 380, -800, 'packer');
	addAnimation('trees', 'treeLoop', {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}, 12, true);
	setScrollFactor('trees', 0.85, 0.85);
	setProperty('trees.antialiasing', false);
	setGraphicSize('trees', math.floor(widShit * 1.4));
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
		setObjectOrder('bgGirls',getObjectOrder('school')+ 2)
		swapDanceType();
		hasCreeps = true;
	end
end
function onCreatePost()
	
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
		luaSpriteAddAnimationByIndices('bgGirls', 'danceRight', 'BG girls group', '15,16,17,18,19,20,21,22,23,24,25,26,27,28,29', 24);
		luaSpriteAddAnimationByIndices('bgGirls', 'danceLeft', 'BG girls group', '0,1,2,3,4,5,6,7,8,9,10,11,12,13', 24);
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

function onEndSong()

		doTweenAlpha('CamE', 'camHUD', 1 , 2, 'linear')
end
function onCreatePost()
	setProperty("dad.x", defaultOpponentX + 160)
	if boyfriendName == "mariPixelP1" then
		setProperty("boyfriend.y", defaultBoyfriendY + 300)
	end
	if boyfriendName == "mariPixelP1" then
	setProperty("boyfriend.scale.x", 6);
	setProperty("boyfriend.scale.y", 6);
	else
		setProperty("boyfriend.scale.x", 6.10);
	setProperty("boyfriend.scale.y", 6.10);
end
end