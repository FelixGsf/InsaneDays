function onCreate()
    --crear sprites
    makeLuaSprite('sky','PicoStage/sky',0,0);
    makeLuaSprite('city','PicoStage/city',0,0);
    setScrollFactor('city',0.8,1);
    makeLuaSprite('carFloor','PicoStage/behindTrain',0,0)
	setProperty('carFloor.scale.x',2)
	setScrollFactor('carFloor', 0.8, 1)
    makeLuaSprite('train','PicoStage/train',2000,320)
makeLuaSprite('street','PicoStage/street',0,0);
    makeAnimatedLuaSprite('bfLayer','PicoStage/BfLayer',250,360)
addAnimationByPrefix('bfLayer', 'idle', 'bf swag', 24, true)
scaleObject('bfLayer', 0.7, 0.7, true)
setProperty('bfLayer.flipX', true)
makeAnimatedLuaSprite('bom', 'speakers/bombox', 500, 400)
addAnimationByPrefix('bom', 'idle','stereo boom', 24, true)
scaleObject('bom', 0.8, 0.8)

--añadir
addLuaSprite('sky')
addLuaSprite('city')
addLuaSprite('carFloor')
addLuaSprite('train',false)
addLuaSprite('street');
addLuaSprite('bfLayer')
addLuaSprite('bom', false)
runTimer('trainsound',4)
end
function onTimerCompleted(t,l,ll)
	if t == 'trainsound' then
	    runTimer('trainCome',4)
        playSound('train_passes2');
	end
	if t == 'trainCome' then
		setProperty('train.x', 1150)
		doTweenX('train','train',-1150,0.4,'sineOut')
		triggerEvent('Play Animation','hairBlow',2) 
		runTimer('trainCome2',0.4)
	end
	if t == 'trainCome2' then
		setProperty('train.x', 1150)
		doTweenX('train','train',-1150,0.4,'sineOut')
		triggerEvent('Play Animation','hairBlow',2)
		runTimer('trainCome3',0.4)
	end
		if t == 'trainCome3' then
		setProperty('train.x', 1150)
		doTweenX('train','train',-1150,0.4,'sineOut')
		triggerEvent('Play Animation','hairBlow',2)
		runTimer('trainCome4',0.4)
		end
		if t == 'trainCome4' then
		setProperty('train.x', 1150)
		doTweenX('train','train',-1150,0.4,'sineOut')
		triggerEvent('Play Animation','hairBlow',2)
		runTimer('trainCome5',0.4)
		end
		if t == 'trainCome5' then
		setProperty('train.x', 1150)
		doTweenX('train','train',-1150,0.4,'sineOut')
		triggerEvent('Play Animation','hairBlow',2)
		runTimer('trainCome6',0.4)
		end
		if t == 'trainCome6' then
		setProperty('train.x', 1150)
		doTweenX('train','train',-1150,0.4,'sineOut')
		triggerEvent('Play Animation','hairBlow',2)
		runTimer('trainCome7',0.4)
		end
	if t == 'trainCome7' then
	doTweenX('train','train',-4000,0.5,'sineOut')
	triggerEvent('Play Animation','danceLeft',2)
	if gfName == 'tilina' then
		triggerEvent('Play Animation','idle',2)
	end
	runTimer('trainRide',1)

	end
	if t == 'trainRide' then
  
	setProperty('train.x', 2000)
	runTimer('trainsound',8)

	end
end
function onEvent(name,value1,value2)
	if name == 'Blammed Lights' then
		setProperty('gf.visible',true)
setProperty('felix2.visible',false)
setProperty('bf2.visible',false)
setProperty('dadPhantom.visible',false)
setProperty('bfPhantom.visible',false)
setProperty('felixS.visible',false)
	end
	if value1 == '0' then
		setProperty('gf.visible',true)
		setProperty('felix2.visible',true)
setProperty('bf2.visible',true)
setProperty('dadPhantom.visible',true)
setProperty('bfPhantom.visible',true)
setProperty('felixS.visible',true)
	end
	end

	


