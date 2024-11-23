function onCreate()
	-- background shit
	makeLuaSprite('arrayanes', 'BackGrounds/W2/images/city_shit', -560, -300);
scaleObject('arrayanes',1.5,1.5 );
makeLuaSprite('floor', 'BackGrounds/W2/images/floor', -560, -300);
scaleObject('floor',1.5,1.5 );
makeAnimatedLuaSprite('gang', 'BackGrounds/W2/images/VapeGang',800, 1300);
	addLuaSprite('arrayanes', false);
        addLuaSprite('floor', false);
	addAnimationByPrefix('gang', 'idle', 'VaperGangDa', 24, true);
	addLuaSprite('gang', false); 
	--addLuaSprite('speaker')
	
	--close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
function onCreatePost()
	if gfName == 'luisa' then
        setProperty('gf.y',1200)
        setProperty('gf.x',1800)
    elseif gfName == 'namy' then
        setProperty('gf.x',1800)
    end
end
	-- sprites that only load if Low Quality is turned off

