function onCreate()	
	makeAnimatedLuaSprite('bg', 'BackGrounds/W10/sister/weebStage', -3500, -2000)
	scaleObject('bg', 7, 7)
	setLuaSpriteScrollFactor('bg', 1, 1);
	addAnimationByPrefix('bg', 'bg', 'glitchBG 1', 21, true)
	objectPlayAnimation('bg', 'bg', true)

	makeAnimatedLuaSprite('fg', 'BackGrounds/W10/sister/weebFloor', -2650, -1800)
	scaleObject('fg', 7, 7)
	setLuaSpriteScrollFactor('fg', 1, 1);
	addAnimationByPrefix('fg', 'fg', 'glitchFG 1', 21, true)
	objectPlayAnimation('fg', 'fg', true)
	
	addLuaSprite('bg', false)
	setProperty('bg.antialiasing',false)
	addLuaSprite('fg', false)
	setProperty('fg.antialiasing',false)

	setProperty('camGame.alpha',0)
	setProperty('camHUD.alpha',0)
		runTimer('CamGoned', 5.8);

	-- death screen properties
	--setPropertyFromClass('GameOverSubstate', 'characterName', 'bfAndGf-dead');
	--setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx-pixel');
	--setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-pixel');
	--setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd-pixel');
end

function onTimerCompleted(timerTag, ye, this)
	if timerTag == 'CamGoned' then -- Timer completed, play dialogue
		doTweenAlpha('HudHERE', 'camHUD', 1 , 5, 'linear')

	end
end
function onCreatePost()

	setProperty('gf.visible',false)
end

function opponentNoteHit()
	--for every beat
		doTweenAlpha('sas', 'bg', 0.63 , 2, 'linear')
      health = getProperty('health')
    if getProperty('health') > 0.4 then
       setProperty('health', health- 0.02);
       setProperty('defaultCamZoom',0.5)
            doTweenZoom('camz','camGame',0.6,1,'sineInOut')
           
	doTweenX('hud1', 'healthBar', 219 * 3, 10.02, 'backOut')
	doTweenX('hud2', 'healthBarBG', 219 * 3, 10.02, 'backOut')
	end

end
function onBeatHit()
		doTweenAlpha('sas', 'bg', 0.23 , 1.5, 'linear')

    if curBeat % 63 == 0 and curStep > 141 then
		setProperty('scoreTxt.y',10)
		setProperty('botplayTxt.y',370)

		noteMove2()	
end
    if curBeat % 39 == 0 and curStep > 11 then
		setProperty('scoreTxt.y',689)
		setProperty('botplayTxt.y',90)
		noteMove1()	
end

    if getProperty('health') > 1.7 then

	doTweenX('hud1', 'healthBar', 119 , 8.12, 'backOut')
	doTweenX('hud2', 'healthBarBG', 119, 8.12, 'backOut')

	end
    if getProperty('health') > 0.5 then

		doTweenX('aa', 'healthBar', 319 , 31.23, 'backOut')
		doTweenX('aaa', 'healthBarBG', 319 , 31.23, 'backOut')
	end

       health = getProperty('health')
    if curBeat % 14 == 0 and curStep > 1 then
	setProperty('defaultCamZoom',1.03)       

end
    if curBeat % 9 == 0 and curStep > 1 then
    if getProperty('health') < 0.5 then

       setProperty('health', health+ 0.253);
		end
	end
end

function onStepHit()

    if curStep == 25 then
		doTweenX('scoreX', 'scoreTxt', 376 , 22.53, 'backOut')
		doTweenY('scoreY', 'scoreTxt', 689 , 22.53, 'backOut')
    end
    if curStep == 248 then
		doTweenAlpha('CamHERE', 'camGame', 1 , 2, 'linear')
end

    if curStep == 1795 then

            doTweenZoom('camz','camGame',0.7,1,'sineInOut')
		doTweenAlpha('SumaGone', 'dad', 0 , 2, 'linear')
		doTweenAlpha('SumaIcoGone', 'iconP2', 0 , 2, 'linear')
    end
    if curStep == 1856 then

		setProperty('camHUD.alpha',0)
    end

end

function onUpdatePost()
    setTextString('botplayTxt', "What?");

 for i = 0,3 do
	setPropertyFromGroup('opponentStrums',i,'alpha',0.5)
	noteTweenAngle('WEEE'..i, i, 45, 4.5, 'backOut')
end

end
	
function noteMove1()		

local incs = true
local move= 320
local move2= 750
local move3= -350

local vel= 1
		noteTweenX('1',0,move3,vel+1.01,'backOut')
		noteTweenX('2',1,move3+10,vel+1.41,'backOut')
		noteTweenX('3',2,move3+20,vel+2.01,'backOut')
		noteTweenX('4',3,move3+30,vel+3.01,'backOut')

		noteTweenX('a',4,move,vel+1.01,'backOut')
		noteTweenX('b',5,move+110,vel+1.41,'backOut')
		noteTweenX('c',6,move2+20,vel+2.01,'backOut')
		noteTweenX('d',7,move2+130,vel+3.01,'backOut')


	end
--		noteTweenX('a',4,defaultPlayerStrumX0-squish-10,vel+3.01,'backOut')
--    noteTweenDirection('opponentStrumsZ1', 4, direc2, vel+0.01, 'circOut');
--    noteTweenDirection('playerStrumY1', 5, direc2, vel+0.01, 'circOut');
--    noteTweenDirection('playerStrumY2', 6, direc, vel+0.01, 'circOut');
--    noteTweenDirection('playerStrumY3', 7, direc, vel+0.01, 'circOut');
--if not middlescroll
	function noteMove2()		

local incs = true
local move= 410
local move2= 650
local move3= -350

local vel= 1
		noteTweenX('1',0,move3,vel+1.01,'backOut')
		noteTweenX('2',1,move3+10,vel+1.41,'backOut')
		noteTweenX('3',2,move3+20,vel+2.01,'backOut')
		noteTweenX('4',3,move3+30,vel+3.01,'backOut')

		noteTweenX('a',4,move,vel+1.01,'backOut')
		noteTweenX('b',5,move+110,vel+1.41,'backOut')
		noteTweenX('c',6,move2+20,vel+2.01,'backOut')
		noteTweenX('d',7,move2+130,vel+3.01,'backOut')

	end