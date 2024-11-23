--by ryansdjr

function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
	
    precacheImage('spacebar');
	precacheSound('Dodged');
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent" then
    --Get Dodge time
    DodgeTime = (value1);

    --Make Dodge Sprite
	makeAnimatedLuaSprite('spacebar', 'spacebar', 400, 200);
    makeLuaSprite('poste', 'HD LIMO/street_pole', -1150, 110 );
    makeLuaSprite('warning', 'HD LIMO/warningNote', 30, 400)
    luaSpriteAddAnimationByPrefix('spacebar', 'spacebar', 'spacebar', 25, true);
	luaSpritePlayAnimation('spacebar', 'spacebar');
	setObjectCamera('spacebar', 'other');
    setObjectCamera('warning', 'other');
	scaleLuaSprite('spacebar', 0.50, 0.50); 
    scaleLuaSprite('warning', 0.50, 0.50); 
    addLuaSprite('spacebar', true); 
    addLuaSprite('poste', true);
    addLuaSprite('warning', true);
	
	--Set values so you can dodge
	canDodge = true;
	runTimer('Died', DodgeTime);
    runTimer('PT', 0.1);
    playSound('warning', 0.7);
	
	end
end

function onUpdate()
   if canDodge == true and keyJustPressed('space') then
   
   Dodged = true;
   playSound('Dodged', 0.7);
   characterPlayAnim('boyfriend', 'dodge', true);
   setProperty('boyfriend.specialAnim', true);
   removeLuaSprite('spacebar');
   removeLuaSprite('warning');
   canDodge = false
   
   end
end


function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   setProperty('health', 0);
   
   elseif tag == 'Died' and Dodged == true then
   Dodged = false
   end
   if tag == 'PT' then
    setProperty('poste.x', -1150)
    doTweenX('poste.x', 'poste', 3650, 1.35,'sineIn')
    runTimer('PT2',0.3)
    
    if t == 'PT2' then
        setProperty('poste.x', -1150)
    end
end
end
