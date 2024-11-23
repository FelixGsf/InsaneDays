function onCreate()
  makeLuaSprite('bg','Sammy/SammyS',-1800,-1200)
  scaleObject('bg',2,2)
  makeAnimatedLuaSprite('MusicBox','Sammy/MusicBox',600,150)
  scaleObject('MusicBox',1,1)
  addAnimationByPrefix('MusicBox','idle','Musi',13,true)
  objectPlayAnimation('MusicBox','idle',true)
  makeAnimatedLuaSprite('candles2','Sammy/light',-600,-600)
  --scaleObject('candles2',2,2)
  addAnimationByPrefix('candles2','idle','fezt instance 1',24,true)
  objectPlayAnimation('candles2','idle',true)
  addLuaSprite('bg',false)
  addLuaSprite('MusicBox',false)
  addLuaSprite('candles2',true)
  end
  function onCreatePost()
    if boyfriendName == "mariP1" then
      setProperty("gf.x", defaultGirlfriendX - 200)
      setProperty("gf.y", defaultGirlfriendY + 70)
      setProperty("boyfriend.x", defaultBoyfriendX)
      setProperty("boyfriend.y", defaultBoyfriendY + 220)
    end
    makeLuaSprite("black","",0,0);
    makeGraphic("black",screenWidth,screenHeight,'000000');
    setObjectCamera("black",'hud');
    addLuaSprite("black")
  end
---
--- @param swagCounter int
---
function onCountdownTick(swagCounter)
  if swagCounter == 2 then
    doTweenAlpha("blackfff", "black", 0, 4, "linear")
  end
end
function onUpdate()
  if curStep == 1299 then
    doTweenAlpha("b", "black", 1, 4, "linear")
  end
  end