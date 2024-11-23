
  function onUpdate()
    setProperty('fire2.scale.x',1.4)
  end
  function onCreate()
  makeAnimatedLuaSprite('fire','BackGrounds/W6/images/fireAnim',-0,450)
  setScrollFactor('fire',0.8,0.8)
 addAnimationByPrefix('fire','idle','FIREEE',24,true)
 makeAnimatedLuaSprite('fire2','BackGrounds/W6/images/fireAnim',-0,1600)
 setScrollFactor('fire2',1.1,1.1)
addAnimationByPrefix('fire2','idle','FIREEE',24,true)
  makeLuaSprite('bg','BackGrounds/W6/images/bg',-1200,500)
  setScrollFactor('bg',0.8,0.8)
  makeLuaSprite('floor','BackGrounds/W6/images/floor',-1200,750)
  makeLuaSprite('walls','BackGrounds/W6/images/walls',-1200,690)
  makeLuaSprite('boxes','BackGrounds/W6/images/boxes',-900,760)
  makeAnimatedLuaSprite('bom','speakers/bombox',defaultGirlfriendX - 300,defaultBoyfriendY + 300);
  addAnimationByPrefix('bom', 'idle', 'stereo boom', 24, true)
  scaleLuaSprite('bom', 1.2, 1.2)
  setScrollFactor('boxes',1.2,1.2)
 -- makeLuaSprite('mk','darkStage/mk',-2000,600)
  addLuaSprite('bg',false)
  addLuaSprite('fire', false)
  addLuaSprite('floor',false)
  addLuaSprite('walls',false)
  addLuaSprite('boxes',true)
  addLuaSprite('mk',false)
  addLuaSprite('bom', false)
  addLuaSprite('fire2', true)

--scaleObject('speaker', 1.2, 1.2) 
if songName == 'Otaku' or songName == "Darkangel" then
setProperty('fire.visible',false)
setProperty('fire2.visible',false)
elseif songName == 'Bandit' then
  setProperty('fire.visible',false)
  setProperty('fire2.visible',false)
end
  end 
function onCreatePost()
  if gfName == 'sister' then
    setProperty('gf.y',getProperty("gf.y")-200)
    setProperty('gf.x',1050)
  elseif gfName == 'tilina' then
      setProperty('gf.y',850)
      setProperty('gf.x',1050)
      setProperty('gf.scale.x', 1.20)
      setProperty('gf.scale.y', 1.20) 
  end
  if boyfriendName == 'sisterPlayable' then
    if getWeekCompleted('day11') then
    setProperty("boyfriend.y", 1300)
    setProperty("boyfriend.x", 1500)
    else
      setProperty("gf.visible", false)
  end
elseif boyfriendName == "mariP1" then
  setProperty("boyfriend.y",getProperty("boyfriend.y")+140)
  setProperty("gf.x", getProperty("gf.x")-120)
end
  if songName == "Exmilix" then
    if boyfriendName == "felix" then
    setProperty("dad.y", defaultOpponentY + 120)
    setProperty("dad.x", defaultOpponentX - 440)
    setProperty("gf.scale.x", 1.20)
    setProperty("gf.scale.y", 1.20)
    setProperty("boyfriend.y", defaultBoyfriendY + 410)
    setProperty("gf.y",defaultGirlfriendY +180)
    elseif boyfriendName == "mariP1" then
      setProperty("boyfriend.y", defaultBoyfriendY + 270)
      setProperty("boyfriend.x", defaultBoyfriendX+ 100)
      setProperty("gf.y",defaultGirlfriendY +280)
    --  setProperty("fire2.vis", nil)
      setProperty("boyfriend.scale.x", 1.20)
      setProperty("boyfriend.scale.y", 1.20)
      setProperty("gf.scale.x", 1.20)
      setProperty("gf.scale.y", 1.20)
      setProperty("dad.y", defaultOpponentY + 120)
      setProperty("dad.x", defaultOpponentX - 440)
  end
end
if songName == "Darkangel" then
  setProperty("gf.y", getProperty("gf.y")+160)
  removeLuaSprite("bom",true)
end
end
function onUpdatePost()
  if boyfriendName == 'sisterPlayable' then
    setProperty("iconP1.y", 610)
    setProperty("iconP1.x",getProperty("iconP1.x")-20)
  end
end