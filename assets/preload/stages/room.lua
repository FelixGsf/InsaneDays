function onCreate()
	roles = getPropertyFromClass("ClientPrefs", "myLove",true)
	-- background shit
makeLuaSprite('stageback', 'BackGrounds/W4/images/BGDay', -300, -540);
scaleObject('stageback',1.2,1.2 );
if songName == 'furryphobia' then
	makeLuaSprite('stageback', 'BackGrounds/W4/images/BGDark', -300, -540);
scaleObject('stageback',1.2,1.2 );
end
	if not lowQuality then
	makeAnimatedLuaSprite('Sound', 'BackGrounds/W4/images/Sonido',860,-100)
	scaleObject('Sound', 1, 0.7, true)
	addLuaSprite('Sound', false)
	addLuaSprite('stageback', false);

end
	--close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
function onCreatePost()
	if gfName == "rayoSpeaker" then
		setProperty("boyfriend.y", getProperty("boyfriend.y")+180)
		setProperty("gf.y", getProperty("gf.y")+40)
		if getWeekCompleted('day11') then
			setProperty("gf.visible", true)
		else
			setProperty("gf.visible", false)
		end
	end
	if boyfriendName == "mariW3_Playable" then
		setProperty("gf.visible", false)
		setProperty("boyfriend.y", getProperty("boyfriend.y")+ 200)
		elseif boyfriendName == "felixWeek3" then
			setProperty("boyfriend.y", getProperty("boyfriend.y")+ 20)
	end
	if boyfriendName == "mariW3_Playable" then
		makeAnimatedLuaSprite("felix","characters/felixAssets",defaultBoyfriendX +100,250)
		addAnimationByPrefix("felix", "idle", "bf idle0",24,true);
		addLuaSprite("felix",false)
		setObjectOrder("felix", getObjectOrder("boyfriendGroup")+1)
	elseif boyfriendName == "rayo-player" then
		setProperty("boyfriend.y", getProperty("boyfriend.y")+120)
		setProperty("gf.y", getProperty("gf.y")-40)
	end
end
function onSongStart()
end
function onUpdate()
	if songName == 'furryphobia' then
	setProperty('boyfriend.color',getColorFromHex("101031"))
	setProperty('gf.color',getColorFromHex("101031"))
	setProperty('dad.color',getColorFromHex("3B3883"))
end
end
function onBeatHit()
	addAnimationByPrefix('Sound', 'idle', 'Sonido idle', 24, true)
	objectPlayAnimation('Sound', 'idle', false, 0)
end