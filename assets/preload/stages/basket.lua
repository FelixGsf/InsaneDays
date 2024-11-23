function onCreate()
	-- background shit

	local bloomAlpha = 0.80
	local bloom2Alpha = 0.60
	local bloom3Alpha = 0.50
	local bgPost1= -560
	local bgPost2 = -400
	makeLuaSprite('bg', 'BackGrounds/W2/images/SkyN', -560, -700);
	setScrollFactor('bg',0.6,0.6)
scaleObject('bg',1.3,1.3 );
addLuaSprite('bg')
makeLuaSprite('fg', 'BackGrounds/W2/images/floorN', -560, -300);
scaleObject('fg',1.5,1.5 );
addLuaSprite('fg')
makeAnimatedLuaSprite('gang', 'BackGrounds/W2/images/gangN',800, 1300);
addAnimationByPrefix('gang', 'idle', 'VaperGangDa', 24, true);
addLuaSprite('gang', false); 
if not lowQuality then
makeLuaSprite('bloom', 'BackGrounds/W2/images/bloom', -700, -900);
scaleObject('bloom',1.7,1.7 );
addLuaSprite('bloom',true)
setProperty('bloom.alpha',bloomAlpha)
setScrollFactor('bloom',0.7,0.7)
makeLuaSprite('bloom2', 'BackGrounds/W2/images/blueBloom',-560,-700 );
setScrollFactor('bloom2',0.6,0.6)
scaleObject('bloom2',1.3,1.3 );
addLuaSprite('bloom2',true)
setProperty('bloom2.alpha',bloom2Alpha)
setScrollFactor('bloom2',0.7,0.7)
makeLuaSprite('bloom3', 'BackGrounds/W2/images/blue2', -860, -700);
scaleObject('bloom3',1.5,1.5 );
addLuaSprite('bloom3',true)
setProperty('bloom3.alpha',bloom3Alpha)
setScrollFactor('bloom3',0.6,0.6)
--setObjectOrder('bloom3',getObjectOrder('layer')+4)

	--close(true); --For performance reasons, close thi	
	-- sprites that only load if Low Quality is turned off
end
end
function onCreatePost()
	if gfName == 'luisaN2' then
        setProperty('gf.y',1200)
    end
end

