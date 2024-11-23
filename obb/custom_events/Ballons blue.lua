BallsbActive = false
local press = 0

function onCreate()
     precacheImage('mechanics-shiet/balloons/blue');
     precacheSound('ballons/hello');
     precacheSound('ballons/popped');
end

function onEvent(name,value1,value2)
	if name == 'Ballons blue' then
               if value1 == '1' then
                 if BallsbActive == false then

               BallsbActive = true
               playSound('ballons/hello', 1);

               makeLuaSprite('ballsb', 'mechanics-shiet/balloons/blue', 90, 800);
               setLuaSpriteScrollFactor('ballsb', 1, 1);
               scaleObject('ballsb', 1.1, 1.1)
               setProperty('ballsb.alpha', 0.98);
               --setGraphicSize('ballsb', 1080, 920);
               setObjectCamera('ballsb', 'camOther');
               setObjectOrder('ballsb', 25);
               addLuaSprite('ballsb', false);

               makeLuaSprite('hitboxb', '', 620, 100);
               makeGraphic('hitboxb', 150, 200, 'ffffff')
	       addLuaSprite('hitboxb', true);
               setProperty('hitboxb.alpha', 0);
               setObjectCamera('hitboxb', 'camHUD');

               makeLuaSprite('poppedb', 'mechanics-shiet/popped/popped', 600, 400);
               setLuaSpriteScrollFactor('poppedb', 1, 1);
               scaleObject('poppedb', 0.30, 0.30)
               setProperty('poppedb.alpha', 0);
               setObjectCamera('poppedb', 'Other');
               setObjectOrder('poppedb', 26);
               addLuaSprite('poppedb', false);

              makeLuaSprite('arrow', 'mira cool', 0, 0);
              setLuaSpriteScrollFactor('arrow', 1, 1);
              scaleLuaSprite('arrow', 0.5, 0.5)
              setGraphicSize('arrow', 950, 950);
              setObjectCamera('arrow', 'camOther');
              setProperty('arrow.alpha', 0.6);
              addLuaSprite('arrow', true)

               doTweenX('ballsScaleTweenXB', 'ballsb.scale', 0.85, 1.1, 'elasticInOut')
               doTweenY('ballsScaleTweenYB', 'ballsb.scale', 0.85, 1.1, 'elasticInOut')

               doTweenY('MoveBALLSB', 'ballsb', -300, 1.5, 'smootherStepOut')
           end
	end
   end
end

function onUpdate(elapsed)
     if BallsbActive then
           if (getMouseX('camHUD') > 580 and getMouseX('camHUD') < 700) and (getMouseY('camHUD') > 50.5 and getMouseY('camHUD') < 150 and mousePressed('left')) then 
              setProperty('ballsb.scale.x', 1.1) 
              setProperty('ballsb.scale.y', 1.1)
              doTweenX('ballsScaleTweenXB', 'ballsb.scale', 0.85, 0.8, 'elasticInOut')
              doTweenY('ballsScaleTweenYB', 'ballsb.scale', 0.85, 0.8, 'elasticInOut')
              press = press + 0.5   
           if press == 20 then  
              BallsbActive = false
              playSound('ballons/popped', 4);
              cameraShake(camHUD, 0.02, 0.1);
              cameraShake(camGame, 0.02, 0.1);
              setProperty('ballsb.alpha', 0.00001);
              setProperty('poppedb.alpha', 0.98);
              setProperty('poppedb.scale.x', 0.55) 
              setProperty('poppedb.scale.y', 0.55)
              doTweenX('poppedScaleTweenXB', 'poppedb.scale', 0.40, 0.45, 'elasticInOut')
              doTweenY('poppedScaleTweenYB', 'poppedb.scale', 0.40, 0.45, 'elasticInOut')
              doTweenAlpha('P1B', 'poppedb', 0.00001, 0.2, 'linear');
              press = 0 
           end
        end
    end
end

function onUpdatePost(elapsed)
    setProperty('poppedb.y', getProperty('ballsb.y') + 300)
    setProperty('poppedb.x', getProperty('ballsb.x') + 280)
end