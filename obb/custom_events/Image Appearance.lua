function onEvent(name, value1, value2)
	if name == "Image Appearance" then
		makeLuaSprite('image', value1, 100, -200);
		scaleObject('image',1,1)
		addLuaSprite('image', true);
		doTweenColor('hello', 'image', 'FFFFFFFF', 0.5, 'quartIn');
		
	end
end
function onUpdate()
	setObjectOrder('image', getObjectOrder('image')+ 3) -- change 4 to 1 if you want to make gf icon behind bf and dad icons
   setObjectOrder('Familia/mallP', getObjectOrder('Familia/mallP')+ 0)
	setObjectOrder('grove', getObjectOrder('grove')+ 0)
end