local trainCome
local trainCome1
local bloomAlpha = 0.50
function onCreate()
	makeLuaSprite('sky','BackGrounds/W1/images/skyDark', -1200, -300);
	setScrollFactor('sky',0.8,0.8)
	makeLuaSprite('city','BackGrounds/W1/images/cityDark', -1100, -50);
	setScrollFactor('city',0.8,0.8)
	makeLuaSprite('street','BackGrounds/W1/images/streetDark', -1300, -150);
	makeLuaSprite('trainBe','BackGroundsW1/images/behindTrainDark', -1300,-100);
	makeAnimatedLuaSprite('rayogf', 'characters/noseLaVerdadN',-800, 370);
	scaleObject('rayogf',0.90,0.90)
	makeAnimatedLuaSprite('bom','speakers/speakersN',-350,450);
	addAnimationByPrefix('bom', 'idle', 'stereo boom', 24, true)
	addAnimationByPrefix('rayogf', 'idle', 'DanceGod', 24, true);
	addAnimationByPrefix('rayogf', 'clap', 'aplauso', 24, false);
	setObjectOrder('rayogf', getObjectOrder('gf')+ 2)
	scaleObject('sky',1.5,1.3 );
	scaleObject('trainBe',1.4,1.4)
	scaleObject('bloom',4,4)
scaleObject('city',1.3,1.2 );
scaleObject('street',1.4,1.4 );
scaleObject('win0',1.3,1.2);
	addLuaSprite('sky', false);
	addLuaSprite('city', false);
	--addLuaSprite('trainBe', false);
	addLuaSprite('street', false);
	setObjectOrder('bom2',getObjectOrder('gf')-2)
	addLuaSprite('bom', false)
if not lowQuality then
	makeAnimatedLuaSprite('win0','BackGrounds/rayoStage/win1', -1080, -50);
	addAnimationByPrefix('win0','idle','win',20,true)
	setScrollFactor('win0',0.8,0.8)
	makeLuaSprite('bloom','BackGrounds/W1/images/bloom',-650,0)
	addLuaSprite('win0', false);
	setObjectOrder('win0', getObjectOrder('win0') -2)
	setProperty('bloom.alpha', bloomAlpha)
	setScrollFactor('bloom',0.6,0.6)
scaleObject('win0',1.2,1.2)
--Scales

end
if songName == "shot head" then
	removeLuaSprite('rayogf')
	removeLuaSprite('gf2',true)
	
end
if songName == "shot head remix" then
	makeAnimatedLuaSprite('rayogf', 'characters/noseLaVerdadN',580, 430);
	addAnimationByPrefix('rayogf', 'idle', 'DanceGod', 24, true);
	addAnimationByPrefix('rayogf', 'clap', 'aplauso', 24, false);
setObjectOrder('rayogf', getObjectOrder('gf')+ 6)
	addLuaSprite('rayogf',false)
removeLuaSprite('gficon')
	
end
end
function onCountdownStarted()
	setProperty('dad.scale.x', 0.90)
	setProperty('dad.scale.y', 0.90) 
	setProperty('gf.scale.x', 0.90)
	setProperty('gf.scale.y', 0.90) 
	setProperty('dad.scale.x', 0.90)
	setProperty('dad.scale.y', 0.90) 
	end
	function onCreatePost()
		setObjectOrder('bloom', 40)
		if gfName == 'luisaN' then
            setProperty('gf.y',110)
        elseif gfName == 'namyN' then
            setProperty('gf.x',-130)
        end
    end