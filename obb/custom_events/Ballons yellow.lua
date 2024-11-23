BallsyActive = false
local pressy = 0

function onCreate()
     precacheImage('mechanics-shiet/balloons/yellow');
     precacheSound('ballons/hello');
     precacheSound('ballons/popped');
end

function onEvent(name,value1,value2)
	if name == 'Ballons yellow' then
               if value1 == '1' then
                  if BallsyActive == false then

               BallsyActive = true
               playSound('ballons/hello', 1);

               makeLuaSprite('ballsy', 'mechanics-shiet/balloons/yellow', -100, 800);
               setLuaSpriteScrollFactor('ballsy', 1, 1);
               scaleObject('ballsy', 0.25, 0.25)
               setProperty('ballsy.alpha', 0.98);
               setObjectCamera('ballsy', 'Other');
               setObjectOrder('ballsy', 25);
               addLuaSprite('ballsy', false);

               makeLuaSprite('hitboxy', '', 550, 0);
               makeGraphic('hitboxy', 250, 300, 'ffffff')
	       addLuaSprite('hitboxy', true);
               setObjectCamera('hitboxy', 'camOther');
	       setProperty('hitboxy.alpha', 0)

               makeLuaSprite('poppedy', 'mechanics-shiet/popped/popped yellow', 600, 400);
               setLuaSpriteScrollFactor('poppedy', 1, 1);
               scaleObject('poppedy', 0.30, 0.30)
               setProperty('poppedy.alpha', 0);
               setObjectCamera('poppedy', 'Other');
               setObjectOrder('poppedy', 26);
               addLuaSprite('poppedy', false);

               makeLuaSprite('arrow', 'mira cool', 0, 0);
               setLuaSpriteScrollFactor('arrow', 1, 1);
               scaleLuaSprite('arrow', 0.5, 0.5)
               setGraphicSize('arrow', 950, 950);
               setObjectCamera('arrow', 'camOther');
               setProperty('arrow.alpha', 0.6);
               addLuaSprite('arrow', true)

               doTweenX('ballsScaleTweenXY', 'ballsy.scale', 0.45, 1.2, 'elasticInOut')
               doTweenY('ballsScaleTweenYY', 'ballsy.scale', 0.45, 1.2, 'elasticInOut')

               doTweenY('MoveBALLSY', 'ballsy', 150, 1.5, 'smootherStepOut')
           end
	end
   end
end

function onUpdate(elapsed)
     if BallsyActive then
           if (getMouseX('camHUD') > -50 and getMouseX('camHUD') < 200) and (getMouseY('camHUD') > -100.5 and getMouseY('camHUD') < 350 and mousePressed('left')) then   
              setProperty('ballsy.scale.x', 0.40) 
              setProperty('ballsy.scale.y', 0.40)
              doTweenX('ballsScaleTweenXY', 'ballsy.scale', 0.45, 0.8, 'elasticInOut')
              doTweenY('ballsScaleTweenYY', 'ballsy.scale', 0.45, 0.8, 'elasticInOut')
              pressy = pressy + 1   
           if pressy == 19 then  
              BallsyActive = false
              playSound('ballons/popped', 4);
              cameraShake(camHUD, 0.02, 0.1);
              cameraShake(camGame, 0.02, 0.1);
              setProperty('ballsy.alpha', 0.00001);
              setProperty('poppedy.alpha', 0.98);
              setProperty('poppedy.scale.x', 0.55) 
              setProperty('poppedy.scale.y', 0.55)
              doTweenX('poppedScaleTweenXY', 'ballsy.scale', 0.40, 0.45, 'elasticInOut')
              doTweenY('poppedScaleTweenYY', 'ballsy.scale', 0.40, 0.45, 'elasticInOut')
              doTweenAlpha('P1Y', 'poppedy', 0.00001, 0.2, 'linear');
              pressy = 0   
           end
        end
    end
end

function onUpdatePost(elapsed)
    setProperty('poppedy.y', getProperty('ballsy.y') - 100)
    setProperty('poppedy.x', getProperty('ballsy.x') - 20)
    setProperty('hitboxy.y', getProperty('ballsy.y') + 10)
    setProperty('hitboxy.x', getProperty('ballsy.x') + 140)
end