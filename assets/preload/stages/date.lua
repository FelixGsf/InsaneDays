function onCreate()
	makeLuaSprite('stagefront', 'BackGrounds/W0/images/stagefront', 0, 200);
scaleObject('stagefront',1.2,1.2 );
	makeLuaSprite('layer1', 'BackGrounds/W0/images/layer1', -100, -800);
scaleObject('layer1',1.2,1.2 );
makeAnimatedLuaSprite('speaker', 'BackGrounds/W0/images/bombox',1100,-50);
addAnimationByPrefix('speaker','idle','stereo boom',24,true)
	-- sprites that only load if Low Quality is turned off
      addLuaSprite('layer1', false);
      addLuaSprite('stagefront', false);
	  addLuaSprite('speaker',false);
	--  addLuaSprite('gfLayer',false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

