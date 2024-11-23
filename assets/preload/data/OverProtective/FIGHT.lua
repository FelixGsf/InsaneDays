--Coding By BlixerTheGamer
--Helped for the code Deleted_Name687

--Script Config Fade
FadeTime = 0.5
FadeEase = 'CircInOut'

function onCreate() 
--No Sound You Idiot
	setProperty('introSoundsSuffix', '-amogusinirl')
--Images Yo

--Two
                    makeLuaSprite('CountTwo', 'ready-pixel', 0, 0)
	screenCenter('CountTwo', 'xy')
	scaleLuaSprite('CountTwo', 6.0, 6.0)
	setObjectCamera('CountTwo', 'other')
	setProperty('CountTwo.antialiasing', false)
	setProperty('CountTwo.visible', false)
	setProperty('CountTwo.x', 380)
	setProperty('CountTwo.y', getProperty("CountTwo.y")-80)
--One
	makeLuaSprite('CountOne', 'set-pixel', 0, 0)
	screenCenter('CountOne', 'xy')
	setProperty('CountOne.antialiasing', false)
	scaleLuaSprite('CountOne', 6.0, 6.0)
	setObjectCamera('CountOne', 'other')
	setProperty('CountOne.x', 380)
	setProperty('CountOne.y', getProperty("CountTwo.y"))
	setProperty('CountOne.visible', false)
--Go	
	makeLuaSprite('CountGO', 'date-pixel', 0, 0)
	scaleLuaSprite('CountGO', 6.0, 6.0)
	screenCenter('CountGO', 'xy')
	setObjectCamera('CountGO', 'other')
	setProperty('CountGO.visible', false)
--Add Lua Sprites
	addLuaSprite('CountTwo', true)
	addLuaSprite('CountOne', true)
	addLuaSprite('CountGO', true)
end

--Countdown Time

function onCountdownTick(counter)
	if counter == 0 then
		playSound('intro3-p')
	elseif counter == 1 then
		setProperty('CountTwo.visible', true)
		doTweenAlpha('TwoFade', 'CountTwo', 0, FadeTime, FadeEase)
		setProperty('countdownReady.visible', false)
		playSound('intro2-p')	
	elseif counter == 2 then
                                        setProperty('CountOne.visible', true)
		doTweenAlpha('OneFade', 'CountOne', 0, FadeTime, FadeEase)
		setProperty('countdownSet.visible', false)
		playSound('intro1-p')
	elseif counter == 3 then
		setProperty('CountGO.visible', true)
		doTweenAlpha('GoFade', 'CountGO', 0, FadeTime, FadeEase)
		setProperty('countdownGo.visible', false)
		playSound('introGo-p')
	end
end

--Amogus