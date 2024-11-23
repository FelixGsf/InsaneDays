-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'sarixVignete' then
		makeLuaSprite(value1, value1, 0, 0)
		setObjectCamera(value1, 'camhud');
		scaleObject(value1, 1, 1)  
		setScrollFactor(value1, value2);
		addLuaSprite(value1, true)
	end
end