function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'BackGrounds/W3/images/youhavebeendestroyed', -800, -350);
scaleObject('stageback',1.5,1.4 );
	makeLuaSprite('gore', 'BackGrounds/W3/images//gore', 1500, 500);
makeAnimatedLuaSprite('fire', 'BackGrounds/W3/images//newfireglow',650, -200);
scaleObject('fire',2.0,2.0 );
	makeLuaSprite('furnitureGlow', 'BackGrounds/W3/images//glowyfurniture', -800, -100);
scaleObject('furnitureGlow',1.5,1 );
makeLuaSprite('bom', 'speakers/speaker broken', 600, 370);
	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
makeAnimatedLuaSprite('fire2', 'BackGrounds/W3/images//newfireglow',-800, -400);
scaleObject('fire2',2.3,2.3 );
		makeLuaSprite('furniture', 'BackGrounds/W3/images//overlayingsticks', -800, -350);
		scaleObject('furniture', 1.5, 1.1);
	end
	addLuaSprite('stageback', false);
	addAnimationByPrefix('fire', 'idle', 'Fire', 20, true);
      addLuaSprite('fire', false);
addAnimationByPrefix('fire2', 'idle', 'Fire', 20, true);
      addLuaSprite('fire2', false);
	addLuaSprite('furniture', false);
      addLuaSprite('gore', false);
	  addLuaSprite('bom', false)
      addLuaSprite('furnitureGlow',false)
	--close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
--- @param elapsed float
---
function onUpdate(elapsed)
	setProperty('boyfriend.color',getColorFromHex("8B785E"))
	setProperty('dad.color',getColorFromHex("8B785E"))
	--setProperty('iconP2.color',getColorFromHex("DF9747"))
end