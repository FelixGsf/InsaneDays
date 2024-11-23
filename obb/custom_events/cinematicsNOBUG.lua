--Created by RamenDominoes (Please credit if using this, thanks! <3)

function onCreatePost()

    makeLuaSprite('UpperBar(With HUD)2', 'empty', -110, -350)
	makeGraphic('UpperBar(With HUD)2', 1500, 350, '000000')
	setObjectCamera('UpperBar(With HUD)2', 'HUD')
	addLuaSprite('UpperBar(With HUD)2', false)

    makeLuaSprite('LowerBar(With HUD)2', 'empty', -110, 720)
	makeGraphic('LowerBar(With HUD)2', 1500, 350, '000000')
	setObjectCamera('LowerBar(With HUD)2', 'HUD')
	addLuaSprite('LowerBar(With HUD)2', false)

    UpperBar = getProperty('UpperBar(With HUD)2.y')
	LowerBar = getProperty('LowerBar(With HUD)2.y')

    for Notes = 0,7 do 
        StrumY = getPropertyFromGroup('strumLineNotes', Notes, 'y')
    end
end

function onEvent(name, value1, value2)
	
	if name == 'CinematicsNOBUG' then
	
		Speed = tonumber(value1)
		Distance = tonumber(value2)

--ENTRANCES

		if Speed and Distance > 0 then

			doTweenY('With HUD1', 'UpperBar(With HUD)2', UpperBar + Distance, Speed, 'QuadOut')
			doTweenY('With HUD2', 'LowerBar(With HUD)2', LowerBar - Distance, Speed, 'QuadOut')

		end

		if downscroll and Speed and Distance > 0 then
		
			doTweenY('With HUD1', 'UpperBar(With HUD)2', UpperBar + Distance, Speed, 'QuadOut')
			doTweenY('With HUD2', 'LowerBar(With HUD)2', LowerBar - Distance, Speed, 'QuadOut')

		end

		if Distance <= 0 then

			doTweenY('With HUD1', 'UpperBar(With HUD)2', UpperBar, Speed, 'QuadIn')
			doTweenY('With HUD2', 'LowerBar(With HUD)2', LowerBar, Speed, 'QuadIn')

		end	
	end
end
