local healthflipped = false;

function onUpdatePost()
	local currentBeat = (getSongPosition()/1000)*(curBpm/60)

	if (curStep >= 288 and curStep < 1568) and not (curStep >= 799 and curStep < 1056) then
        if mustHitSection then
            setProperty('defaultCamZoom', 1.2)
        else
            setProperty('defaultCamZoom', 0.6)
        end
	end

    if curBeat >= 912 and curBeat < 976 then
        for i=0,3 do 
            setPropertyFromGroup('opponentStrums', i, 'y', _G['defaultOpponentStrumY'..i] - 25 * math.sin((currentBeat + i*0.25) * math.pi))
			setPropertyFromGroup('playerStrums', i, 'y', _G['defaultPlayerStrumY'..i] - 25 * math.sin((currentBeat + (i+3)*0.25) * math.pi))
        end
    end

	if curBeat >= 600 and curBeat < 684 then
		for i=0,3 do
			setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultPlayerStrumX'..i] + 32 * math.sin(currentBeat + i*7))
			setPropertyFromGroup('playerStrums', i, 'x', _G['defaultOpponentStrumX'..i] + 32 * math.sin(currentBeat + (i+4)*7))
		end
	end

	if healthflipped == true then
   
		   P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
   
		   P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
   
		   setProperty('iconP1.x',P1Mult - 110)
   
		   setProperty('iconP1.origin.x',240)
   
		   setProperty('iconP1.flipX',true)
   
		   setProperty('iconP2.x',P2Mult + 110)
   
		   setProperty('iconP2.origin.x',-100)
   
		   setProperty('iconP2.flipX',true)
   
		   setProperty('healthBar.flipX',true)
   end
   
	if healthflipped == false then
   
		   P1Mult = getProperty('healthBar.x') - ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
   
		   P2Mult = getProperty('healthBar.x') - ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
   
		   setProperty('iconP2.origin.x',0)
   
		   setProperty('iconP2.flipX',false)
   
		   setProperty('iconP1.origin.x',0)
   
		   setProperty('iconP1.flipX',false)
   
		   setProperty('healthBar.flipX',false)
	end
end

function onCreate()
	setProperty('skipArrowIntroTween', true)
end

function onSongStart()
	doTweenZoom('startZoomShit', 'camGame', 0.8, 9.0)
end

function onCreatePost()
	for i=0,3 do 
        setPropertyFromGroup('opponentStrums', i, 'alpha', 0.00001)
		setPropertyFromGroup('playerStrums', i, 'alpha', 0.00001)
    end
	setProperty('CCBar1.alpha', 0.00001)
	setProperty('CCBar2.alpha', 0.00001)
	setProperty('healthBar.alpha', 0.00001)
	setProperty('iconP1.alpha', 0.00001)
	setProperty('iconP2.alpha', 0.00001)
	setProperty('scoreTxt.alpha', 0.00001)
	setProperty('timeBarBG.visible', false)
	setProperty('timeBar.visible', false)
	setProperty('timeTxt.visible', false)
	
	makeLuaSprite("vignette", "BackGrounds/W12/cc_go", 0, 0)
	setObjectCamera('vignette', 'hud')
	addLuaSprite('vignette', false)

	setProperty('boyfriend.alpha', 0.00001)
	setProperty('dad.alpha', 0.00001)
	triggerEvent('Camera Follow Pos', '675', '500')
end

function onStepHit()
	if curStep == 1 then
		noteTweenAlpha('noteFadeIn0', 0, 1, 0.5, 'quadInOut')
	end
	if curStep == 16 then
		noteTweenAlpha('noteFadeIn1', 1, 1, 0.5, 'quadInOut')
	end
	if curStep == 32 then
		noteTweenAlpha('noteFadeIn2', 2, 1, 0.5, 'quadInOut')
	end
	if curStep == 48 then
		noteTweenAlpha('noteFadeIn3', 3, 1, 0.5, 'quadInOut')
	end
	if curStep == 64 then
		noteTweenAlpha('noteFadeIn7', 7, 1, 0.5, 'quadInOut')
	end
	if curStep == 80 then
		noteTweenAlpha('noteFadeIn6', 6, 1, 0.5, 'quadInOut')
	end
	if curStep == 96 then
		noteTweenAlpha('noteFadeIn5', 5, 1, 0.5, 'quadInOut')
	end
	if curStep == 112 then
		noteTweenAlpha('noteFadeIn3', 4, 1, 0.5, 'quadInOut')
		doTweenAlpha('STIN', 'ST', 1, 1)
	end
	if curStep == 128 then
		for i=0,3 do --just to be safe
			setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
			setPropertyFromGroup('playerStrums', i, 'alpha', 1)
		end
		setProperty('vignette.alpha', 0.5)
		setProperty('boyfriend.alpha', 1)
		setProperty('dad.alpha', 1)
		setProperty('ST.alpha', 0.00001)
	end
	if curStep == 264 then 
		for i=0,3 do
			noteTweenY('noteDown'..i, i, defaultOpponentStrumY0 + 200, 1 + (i * 0.2), 'quadInOut')
			noteTweenAlpha('noteFade'..i, i, 0.00001, 1 + (i * 0.2), 'quadInOut')
		end
	end
	if curStep == 288 then
		for i=0,3 do
			setPropertyFromGroup('opponentStrums', i, 'y', _G['defaultOpponentStrumY'..i])
		end
        setProperty('CCBar2.alpha', 1)
        setProperty('CCBar1.alpha', 1)
		setProperty('healthBar.alpha', 1)
		setProperty('iconP1.alpha', 1)
		setProperty('iconP2.alpha', 1)
		setProperty('scoreTxt.alpha', 1)
		setProperty('timeBarBG.visible', true)
		setProperty('timeBar.visible', true)
		setProperty('timeTxt.visible', true)
		setProperty('vignette.alpha', 0.00001)
		cameraFlash('game', '0xFFFF0000', 1.5, true)
		cameraFlash('other', '0xFFFF0000', 1.5, true)
	end
	if curStep == 1584 then 
		healthflipped = true
		for i=0,3 do
			setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultPlayerStrumX'..i])
			setPropertyFromGroup('opponentStrums', i, 'y', _G['defaultOpponentStrumY'..i])
			setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
			setPropertyFromGroup('playerStrums', i, 'x', _G['defaultOpponentStrumX'..i])
		end
	end
	if curStep == 2736 or curStep == 3648 then 
		healthflipped = false
		for i=0,3 do
			setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultOpponentStrumX'..i])
			setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
			setPropertyFromGroup('playerStrums', i, 'x', _G['defaultPlayerStrumX'..i])
		end
		setProperty('CCBar1.alpha', 1)
		setProperty('CCBar2.alpha', 1)
	end
	if curStep == 3328 then
		noteTweenX('Movement X 0', 0, - 1000, 0.9)
		noteTweenX('Movement X 1', 1, - 1000, 0.9)
		noteTweenX('Movement X 2', 2, - 1000, 0.9)
		noteTweenX('Movement X 3', 3, - 1000, 0.9)

		noteTweenX('Movement X 4', 4, 415, 0.9)
		noteTweenX('Movement X 5', 5, 525, 0.9)
		noteTweenX('Movement X 6', 6, 635, 0.9)
		noteTweenX('Movement X 7', 7, 745, 0.9)

		setProperty('CCBar1.alpha', 0)
		setProperty('CCBar2.alpha', 0)
	end
	if curStep == 3904 then
		for i=0,3 do
			setPropertyFromGroup('opponentStrums', i, 'y', _G['defaultOpponentStrumY'..i])
			setPropertyFromGroup('playerStrums', i, 'y', _G['defaultPlayerStrumY'..i])
		end
	end
end