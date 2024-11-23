function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'BackGrounds/W3/images/normal_stage', -800, -300);
scaleObject('stageback',1.4,1.2 );
	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('furniture', 'BackGrounds/W3/images//sumtable', -800, -300);
		scaleObject('furniture', 1.5, 1.1);
		setScrollFactor('furniture',0.8,0.8)
makeAnimatedLuaSprite('bombox','speakers/bombox',600,500);
addAnimationByPrefix('bombox', 'idle', 'stereo boom', 24, true);

	addLuaSprite('stageback', false);
	addLuaSprite('furniture', true);	
	addLuaSprite('bombox')
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
end

