function onCreate()
	
	makeLuaSprite('motherBG','Russia/motherBG',-900,-500)
	addLuaSprite('motherBG',false)
	scaleObject('motherBG',1.7,1.5)
	setScrollFactor('motherBG',1.1,1.1)

	makeLuaSprite('plants','Russia/plants',-1500,-1000)
	addLuaSprite('plants',true)
	scaleObject('plants',2,2)
	setScrollFactor('plants',1.2,1.2)
	makeLuaSprite('motherFG', 'Russia/motherFG',-700,-1100)
	addLuaSprite('motherFG',false)
	scaleObject('motherFG',1.4,1.9)
	makeAnimatedLuaSprite('bom','speakers/bombox',600,1200);
	addAnimationByPrefix('bom', 'idle', 'stereo boom', 24, true);
	addLuaSprite('bom', false)
	makeAnimatedLuaSprite('bom2','speakers/bombox',0,0);
	addAnimationByPrefix('bom2', 'idle', 'stereo boom', 24, true);
	addLuaSprite('bom2', false)

end
function onCreatePost()
	if gfName == 'luisa' then
		setProperty('gf.y',850)
	else
		setProperty('gf.y',890)
	end
end