function onEvent(name, value1, value2)
	if name == 'BlackOut2' then
		if value1 == 'true' then
		makeLuaSprite('BlackFlash2', 'BlackFlash', -800, -500);
		scaleObject('BlackFlash2', 18, 22);
		addLuaSprite('BlackFlash2', true)
		setProperty('BlackFlash2.visible', true);
		elseif value1 == 'false' then
		setProperty('BlackFlash2.visible', false)
			end
		end
	end