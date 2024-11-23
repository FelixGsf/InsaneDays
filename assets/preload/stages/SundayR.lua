function onCreate()
	-- background shit
	makeLuaSprite('sky', 'BackGrounds/W1/images/sky', -800, -300);
	makeLuaSprite('behindTrain', 'BackGrounds/W1/images/behindTrain', -560, -300);
	makeLuaSprite('city', 'BackGrounds/W1/images/city', -800, -300);
	setScrollFactor('city',0.8,0.8)
	makeLuaSprite('street', 'BackGrounds/W1/images/street', -900, -500);
	makeAnimatedLuaSprite('rayogf', 'characters/noseLaVerdad',-100, 350);
	addAnimationByPrefix('rayogf', 'idle', 'DanceGod', 24, true);
	addAnimationByPrefix('rayogf', 'clap', 'aplauso', 24, false);
	setObjectOrder('rayogf', getObjectOrder('gf')+ 2)
	makeAnimatedLuaSprite('bom','speakers/bombox',300,450);
	addAnimationByPrefix('bom', 'idle', 'stereo boom', 24, true)
scaleObject('sky',2,1.5 );
scaleObject('behindTrain',1.5,1.5 );
scaleObject('city',1.7,1.7 );
scaleObject('street',2,2 );

	addLuaSprite('sky', false);
	addLuaSprite('city', false);
    addLuaSprite('behindTrain', false);
	addLuaSprite('street', false);
	addLuaSprite('rayogf', false);
	addLuaSprite('bom', false)
	--For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onCreatePost()
	if gfName == 'luisa' then
		setProperty('gf.y',90)
	end
end