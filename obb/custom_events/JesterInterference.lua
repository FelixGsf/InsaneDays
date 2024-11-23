function onCreate()
precacheImage('mechanics-shiet/mask');
precacheImage('mechanics-shiet/estatica');
precacheSound('d-side/JESTER/joseEstatica')
end

function onEvent(name,value1,value2)
	if name == 'JesterInterference' then  
		if value1 == '' then

                        makeLuaSprite('Static', 'mechanics-shiet/estatica', 0, 0);
	                setGraphicSize('Static',1280, 720);
	                setObjectCamera('Static','camHUD');
	                setProperty('Static.alpha', 1);
                        addLuaSprite('Static', false);

                        makeAnimatedLuaSprite('jumpscare', 'mechanics-shiet/mask', 360, -100);
                        addAnimationByIndices('jumpscare', 'miedo', 'jumpscare', '0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18', 24);
                        setObjectCamera('jumpscare', 'camHUD');
                        setProperty('jumpscare.alpha', 1);
                        scaleLuaSprite('jumpscare', 0.65, 0.65); 
                        addLuaSprite('jumpscare', false);

                        setProperty('Static.alpha', 1);

                        cameraShake(camGame, 0.015, 0.2);
                        cameraShake(camHUD, 0.015, 0.15);
 
                        health = getProperty('health')
                        if getProperty('health') > 1.05 then
                        setProperty('health', health- 1.05);
                     end

                        playSound('d-side/JESTER/joseEstatica', 4, 'estatica');
                    end
           end
end

function onSoundFinished(tag)
	if tag == 'estatica' then
	   doTweenAlpha('StaticTWEEN','Static', 0.00001, 1, 'linear')
           --doTweenAlpha('MaskTWEEN','jumpscare', 0.00001, 1, 'linear')
    end
end

function onUpdatePost(elapsed)
  if getProperty('jumpscare.animation.curAnim.name') == 'miedo' then
   if getProperty('jumpscare.animation.curAnim.finished') then
      setProperty('jumpscare.alpha', 0.00001)
     end
   end
end
			