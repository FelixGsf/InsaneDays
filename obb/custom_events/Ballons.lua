BallsActive = false
local press = 0
function onCreate()
     precacheImage('mechanics-shiet/balloons/red');
     precacheSound('ballons/hello');
     precacheSound('ballons/popped');
end

function onEvent(name,value1,value2)
	if name == 'Ballons' then
               if value1 == '1' then
                  if BallsActive == false then

               BallsActive = true
               playSound('ballons/hello', 1);

               makeLuaSprite('balls', 'mechanics-shiet/balloons/green', 750, 800);
               setLuaSpriteScrollFactor('balls', 1, 1);
               scaleObject('balls', 0.25, 0.25)
               setProperty('balls.alpha', 0.98);
               setObjectCamera('balls', 'Other');
               setObjectOrder('balls', 25);
               addLuaSprite('balls', false);

               makeLuaSprite('hitbox', '', 550, 0);
               makeGraphic('hitbox', 250, 300, 'ffffff')
	       addLuaSprite('hitbox', true);
               setObjectCamera('hitbox', 'camOther');
	       setProperty('hitbox.alpha', 0)

               makeLuaSprite('poppedg', 'mechanics-shiet/popped/popped green', 540, 400);
               setLuaSpriteScrollFactor('poppedg', 1, 1);
               scaleObject('poppedg', 0.30, 0.30)
               setProperty('poppedg.alpha', 0);
               setObjectCamera('poppedg', 'Other');
               setObjectOrder('poppedg', 26);
               addLuaSprite('poppedg', false);

              makeLuaSprite('arrow', 'mira cool', 0, 0);
              setLuaSpriteScrollFactor('arrow', 1, 1);
              scaleLuaSprite('arrow', 0.5, 0.5)
              setGraphicSize('arrow', 950, 950);
              setObjectCamera('arrow', 'camOther');
              setProperty('arrow.alpha', 0.6);
              addLuaSprite('arrow', true)

               doTweenX('ballsScaleTweenXG', 'balls.scale', 0.45, 1.2, 'elasticInOut')
               doTweenY('ballsScaleTweenYG', 'balls.scale', 0.45, 1.2, 'elasticInOut')

               doTweenY('MoveBALLS', 'balls', 100, 1.5, 'smootherStepOut')
           end
	end
   end
end

function onUpdate(elapsed)
     if BallsActive then
           if (getMouseX('camHUD') > 900 and getMouseX('camHUD') < 1050) and (getMouseY('camHUD') > -150.5 and getMouseY('camHUD') < 350 and mousePressed('left')) then   
              setProperty('balls.scale.x', 0.40) 
              setProperty('balls.scale.y', 0.40)
              doTweenX('ballsScaleTweenXG', 'balls.scale', 0.45, 0.8, 'elasticInOut')
              doTweenY('ballsScaleTweenYG', 'balls.scale', 0.45, 0.8, 'elasticInOut')
              press = press + 0.5   
           if press == 15 then  
              BallsActive = false
              playSound('ballons/popped', 4);
              triggerEvent("GunterSad", "ahora", ""); 
              cameraShake(camHUD, 0.02, 0.1);
              cameraShake(camGame, 0.02, 0.1);
              setProperty('balls.alpha', 0);
              setProperty('poppedg.alpha', 0.98);
              setProperty('poppedg.scale.x', 0.55) 
              setProperty('poppedg.scale.y', 0.55)
              doTweenX('poppedScaleTweenXG', 'balls.scale', 0.40, 0.45, 'elasticInOut')
              doTweenY('poppedScaleTweenYG', 'balls.scale', 0.40, 0.45, 'elasticInOut')
              doTweenAlpha('P1G', 'poppedg', 0, 0.2, 'linear');
              press = 0   
           end
        end
    end
end

function onUpdatePost(elapsed)
    setProperty('poppedg.y', getProperty('balls.y') - 80)
    setProperty('poppedg.x', getProperty('balls.x') - 20)
    setProperty('hitbox.y', getProperty('balls.y') + 10)
    setProperty('hitbox.x', getProperty('balls.x') + 140)
end