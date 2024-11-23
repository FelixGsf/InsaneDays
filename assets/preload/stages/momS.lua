local bloomAlpha = 0.80
function onCreate()
  gfX = getProperty("gf.x")
  makeLuaSprite('bg','BackGrounds/W5/images/limoMoon',-1500,-850)
  setScrollFactor('bg',0.8,0.8)
makeAnimatedLuaSprite('exmix','BackGrounds/W5/images/exmixS',1550,-50)
  addAnimationByPrefix('exmix','idle','idle',24,true)
setProperty('exmix.flipX', true)
  scaleObject('bg',1.5,1.7)
  makeLuaSprite('limo2','BackGrounds/W5/images/limo',1000,-200)
  scaleObject('limo2',1,1)
 makeAnimatedLuaSprite('limoDrive','BackGrounds/W5/images/limoDriveS',-1000,300)
  scaleObject('limoDrive',2,2)
  addAnimationByPrefix('limoDrive','idle','Limo',24,true)
  makeAnimatedLuaSprite('bom', 'speakers/SpeakersChrima', 1600, -520)
  addAnimationByPrefix('bom', 'idle', 'speaker', 24, true)

  if not lowQuality then
  
    makeLuaSprite('Bloom', 'BackGrounds/W5/images/Bloom', -1500, -950)
  setProperty('Bloom.alpha', bloomAlpha)
  scaleLuaSprite('Bloom', 1.5, 1.5)
  setScrollFactor('Bloom', 1.5, 1.5)
    addLuaSprite('Bloom',true)
makeAnimatedLuaSprite('speed','BackGrounds/W5/images/speed',-800,-900)
  scaleObject('speed',5,5)
  addAnimationByPrefix('speed','idle','spee',24,true)
  objectPlayAnimation('speed','idle',true)
  addLuaSprite('bg',false)
  addLuaSprite('limo2',false)
  addLuaSprite('limoDrive',false)
  addLuaSprite('exmix',false)
  addLuaSprite('bom', false)
addLuaSprite('speed',true)
  end
end
--- @param elapsed float
---
function onUpdate(elapsed)
  setProperty('bom.color',getColorFromHex("D86CAA"))
end