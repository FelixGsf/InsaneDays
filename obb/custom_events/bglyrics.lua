function onCreate()
	makeLuaText('text2', '', 1500, 0, 610)
	setTextAlignment('text2', 'Center')
	setObjectCamera('text2', 'other');	
	setTextFont('text2', 'Times_New_Roman.ttf');	
	addLuaText('text2')
	setTextSize('text2', 100)
	screenCenter('text2', 'x');	
end
function onEvent(name, value1, value2)
	if name == 'bglyrics' then
		setTextString('text2', value1);	
		setProperty('text2.alpha', 0.5);
		doTweenAlpha('text', 'text2', 0, 0.5);
	end
end