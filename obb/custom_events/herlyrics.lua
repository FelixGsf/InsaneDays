function onCreatePost()
	makeLuaText('hertextbg', '', 1500, 0, 630)
	setTextAlignment('hertextbg', 'Center')
	setObjectCamera('hertextbg', 'other');
	setTextFont('hertextbg', 'Saira-Bold.otf');
    setProperty('hertextbg.color', getColorFromHex('000000'));
	addLuaText('hertextbg')
	setTextSize('hertextbg', 41)
	screenCenter('hertextbg', 'x');
	makeLuaText('hertext', '', 1500, 0, 630)
	setTextAlignment('hertext', 'Center')
	setObjectCamera('hertext', 'other');	
	setTextFont('hertext', 'Saira-Bold.otf');	
    setProperty('hertext.color', getColorFromHex('5b0013'));
	addLuaText('hertext')
	setTextSize('hertext', 40)
	screenCenter('hertext', 'x');	
    setProperty('hertext.alpha', 0.5);
    setProperty('hertextbg.alpha', 0.5);	
end
function onEvent(name, value1, value2)
	if name == 'herlyrics' then
		setTextString('hertext', value1);
		setTextString('hertextbg', value1);	
		setProperty('hertext.y', 630);
		setProperty('hertextbg.y', 633);		
	   if value2 == '2' then	
		setProperty('hertext.y', 660);
		setProperty('hertextbg.y', 663);		
        end			   
	end
end