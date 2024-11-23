function onCreate()
    local roles = getPropertyFromClass("ClientPrefs", "myLove",false);
    local felixY = getProperty("gf.y")
    local felixX = getProperty("gf.x")
    makeLuaSprite('bg','BackGrounds/W7/images/sky',-200,100);
    makeLuaSprite('city','BackGrounds/W7/images/city',-200,300)
    setScrollFactor('city', 0.8, 0.8)
    makeLuaSprite('street','BackGrounds/W7/images/street',-200,-50);

    makeAnimatedLuaSprite('bopper','BackGrounds/W7/images/boppers',-100,420);
    addAnimationByPrefix('bopper', 'idle', 'FullBopper', 24, true);
    makeLuaSprite('cloud','BackGrounds/W7/images/cloud',0,0);
    makeAnimatedLuaSprite('train','BackGrounds/W7/images/train',-2200,490)
addAnimationByIndices('train','closed','train','0',0)
addAnimationByIndices('train','open','train','0,1,2,3,4,5,6,7',24)
addAnimationByIndices('train','close','train','8,9,10,11,12,13,14',24)
addAnimationByIndices('train','opened','train','8',0)

--addLuaSprite('train')
--setScrollFactor('train',0.6,0.6)
runTimer('trainCome',4)
    addLuaSprite('bg')
    addLuaSprite('city')
    addLuaSprite('cloud')
    addLuaSprite('train')
    addLuaSprite('bopper')
    addLuaSprite('street')
    addLuaSprite('mari', false)
    scaleObject('bopper',2,2)
    scaleLuaSprite('bg', 2, 1.7)
    scaleLuaSprite('city', 2, 1.2)
    scaleLuaSprite('street', 1.2, 1.2)
end
function onTimerCompleted(t,l,ll)

	if t == 'trainCome' then
		setProperty('train.x', -2200)
		doTweenX('ee','train',-126.25,4,'sineOut')
		runTimer('trainOpen',   4)
	end

	if t == 'trainOpen' then
		objectPlayAnimation('train','open')
		runTimer('trainClose',10)
		
	end

	if t == 'trainClose' then
		objectPlayAnimation('train','close')
		runTimer('trainRide',4)
		
	end

	if t == 'trainRide' then
		doTweenX('ee','train',2300,4,'sineIn')
		runTimer('trainCome',20)
		
	end
end
function onCreatePost()
    if boyfriendName == 'felixSa' then
        setProperty("gf.scale.x", 1.3)
        setProperty("gf.scale.y", 1.3)
    else
        setProperty("gf.scale.x", 1.3)
        setProperty("gf.scale.y", 1.3)
        setProperty("boyfriend.y", 500)
        setProperty("gf.scale.x", 1.4)
        setProperty("gf.scale.y", 1.4)
        setProperty("gf.y", 530)

    end
end
function onUpdate()
if keyboardPressed("F") then
    endSong()
    end
end