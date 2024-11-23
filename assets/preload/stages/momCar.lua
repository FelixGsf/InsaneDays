function onCreate()
  makeLuaSprite('bg','BackGrounds/W5/images/limoSunset',-1050,-1200)
  scaleObject('bg',2,2)
  setScrollFactor('bg',0.8,0.8)
  makeAnimatedLuaSprite('bom','speakers/SpeakersChrima',530,70);
  addAnimationByPrefix('bom', 'idle', 'speaker', 24, true)
makeAnimatedLuaSprite('exmix','BackGrounds/W5/images/exmixN',1600,-90)
  addAnimationByPrefix('exmix','idle','idle',24,true)
setProperty('exmix.flipX', true)
  makeAnimatedLuaSprite('limoDrive','BackGrounds/W5/images/limoDrive',-1000,300)
  scaleObject('limoDrive',2,2)
  addAnimationByPrefix('limoDrive','idle','Limo',24,true)
  objectPlayAnimation('limoDrive','idle',true)
 makeLuaSprite('cloud','BackGrounds/W5/images/cloud',-1000,-2000)
  scaleObject('cloud',4,4)
makeAnimatedLuaSprite('speed','BackGrounds/W5/images/speed',-700,-900)
  scaleObject('speed',5,5)
  addAnimationByPrefix('speed','idle','spee',24,true)
  objectPlayAnimation('speed','idle',true)
  addLuaSprite('bg',false)
 addLuaSprite('exmix',true)

  addLuaSprite('limoDrive',false)
  addLuaSprite('cloud',true)
  addLuaSprite('bom', false)
addLuaSprite('speed',true)

  end
--- @param elapsed float
---
function onUpdate(elapsed)
  setProperty('bom.color',getColorFromHex("6C707A"))
  
end