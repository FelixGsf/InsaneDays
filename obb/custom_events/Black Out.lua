function onEvent(name, value1, value2)
	if name == 'Black Out' then
		if value1 == 'true' then
		makeLuaSprite('BlackFlash', '', -2000, -700)
		makeGraphic('BlackFlash', 1920, 1080, '000000')
		scaleObject('BlackFlash', 1000, 1000);
		addLuaSprite('BlackFlash', true)
		setProperty('BlackFlash.visible', true);
		elseif value1 == 'false' then
		setProperty('BlackFlash.visible', false)
			end
		end
	end
	function onEndSong()
		removeLuaSprite('BlackFlash')
	end