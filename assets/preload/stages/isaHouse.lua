function onCreate()
    makeAnimatedLuaSprite('bg','BackGrounds/W13/isaHouse',-800,-900);
    addAnimationByPrefix('bg', 'idle', 'FireplaceBG', 24, true);
    addLuaSprite('bg');
    scaleObject('bg',1.3,1.2)
end
function onCountdownStarted()
setProperty('dad.scale.x', 1.2)
setProperty('dad.scale.y', 1.2) 
setProperty('boyfriend.scale.x', 1.1)
setProperty('boyfriend.scale.y', 1.1) 
--setProperty('dad.scale.x', 1.3)
--setProperty('dad.scale.y', 1.3) 
end
function onCreatePost()
  setProperty('bom.x',getProperty('gf.x')-200)
  --setProperty('bom.y',getProperty('gf.y'))
  if gfName == 'luisa' then
    setProperty('gf.y',-20)
  end
end