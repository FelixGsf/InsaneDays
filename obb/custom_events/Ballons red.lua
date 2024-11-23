BallsrActive = false

local press = 0

function onCreate()
     precacheImage('mechanics-shiet/balloons/red');
     precacheImage('mechanics-shiet/balloons/green');
     precacheSound('ballons/hello');
     precacheSound('ballons/popped');
end

function onEvent(name,value1,value2)
	if name == 'Ballons red' then
               if value1 == '1' then
                  if BallsrActive == false then

               BallsrActive = true
               playSound('ballons/hello', 1);

               makeLuaSprite('ballsr', 'mechanics-shiet/balloons/red', 530, 800);
               setLuaSpriteScrollFactor('ballsr', 1, 1);
               scaleObject('ballsr', 0.25, 0.25)
               setProperty('ballsr.alpha', 0.98);
               setObjectCamera('ballsr', 'Other');
               setObjectOrder('ballsr', 25);
               addLuaSprite('ballsr', false);

               makeLuaSprite('hitboxr', '', 550, 0);
               makeGraphic('hitboxr', 250, 300, 'ffffff')
	       addLuaSprite('hitboxr', true);
               setObjectCamera('hitboxr', 'camOther');
	       setProperty('hitboxr.alpha', 0)

               makeLuaSprite('poppedr', 'mechanics-shiet/popped/popped red', 600, 400);
               setLuaSpriteScrollFactor('poppedr', 1, 1);
               scaleObject('poppedr', 0.30, 0.30)
               setProperty('poppedr.alpha', 0.00001);
               setObjectCamera('poppedr', 'Other');
               setObjectOrder('poppedr', 26);
               addLuaSprite('poppedr', false);

              makeLuaSprite('arrow', 'mira cool', 0, 0);
              setLuaSpriteScrollFactor('arrow', 1, 1);
              scaleLuaSprite('arrow', 0.5, 0.5)
              setGraphicSize('arrow', 950, 950);
              setObjectCamera('arrow', 'camOther');
              setProperty('arrow.alpha', 0.6);
              addLuaSprite('arrow', true)

               doTweenX('ballsScaleTweenXR', 'ballsr.scale', 0.45, 1.2, 'elasticInOut')
               doTweenY('ballsScaleTweenYR', 'ballsr.scale', 0.45, 1.2, 'elasticInOut')

               doTweenY('MoveBALLSR', 'ballsr', 370, 1.5, 'smootherStepOut')
	end
      end
   end
end

function onUpdate(elapsed)
     if BallsrActive then
           if (getMouseX('camHUD') > 700 and getMouseX('camHUD') < 890) and (getMouseY('camHUD') > 180.5 and getMouseY('camHUD') < 550 and mousePressed('left')) then   
              setProperty('ballsr.scale.x', 0.40) 
              setProperty('ballsr.scale.y', 0.40)
              doTweenX('ballsScaleTweenXR', 'ballsr.scale', 0.45, 0.8, 'elasticInOut')
              doTweenY('ballsScaleTweenYR', 'ballsr.scale', 0.45, 0.8, 'elasticInOut')
              press = press + 0.5   
           if press == 40 then  
              BallsrActive = false
              playSound('ballons/popped', 4);
              cameraShake(camHUD, 0.02, 0.1);
              cameraShake(camGame, 0.02, 0.1);
              setProperty('ballsr.alpha', 0.00001);
              setProperty('poppedr.alpha', 0.98);
              setProperty('poppedr.scale.x', 0.55) 
              setProperty('poppedr.scale.y', 0.55)
              doTweenX('poppedScaleTweenXR', 'ballsr.scale', 0.40, 0.45, 'elasticInOut')
              doTweenY('poppedScaleTweenYR', 'ballsr.scale', 0.40, 0.45, 'elasticInOut')
              doTweenAlpha('P1R', 'poppedr', 0.00001, 0.2, 'linear');
              press = 0  
           end
        end
    end    
end

function onUpdatePost(elapsed)
    setProperty('poppedr.y', getProperty('ballsr.y') - 100)
    setProperty('poppedr.x', getProperty('ballsr.x') - 20)
    setProperty('hitboxr.y', getProperty('ballsr.y') + 10)
    setProperty('hitboxr.x', getProperty('ballsr.x') + 140)
end