 function onCreate()
    makeLuaSprite('bg','BackGrounds/W11/images/mallBg',-640,-650);
    setScrollFactor('bg', 0.8, 0.8)
    makeLuaSprite('floor','BackGrounds/W11/images/mallFloor',-640,550)
    makeLuaSprite('vignette','BackGrounds/W11/images/cc_go',0,0)
    addLuaSprite('vignette',true)
    setObjectCamera('vignette','HUD')
    makeAnimatedLuaSprite('bom', 'speakers/bombox', 300, 450)
    addAnimationByPrefix('bom', 'idle', 'stereo boom', 24, true)
 addLuaSprite('bg')
 addLuaSprite('floor')
 addLuaSprite('dog')
 addLuaSprite('bom', false)
 if songName == 'Reruns' then
    makeAnimatedLuaSprite('dog','BackGrounds/W11/images/cd',900,200)
    addAnimationByPrefix('dog','idle','CD Remake idle',24,true)
    addLuaSprite('dog')
    scaleObject('dog',1.2,1.2)
    setObjectOrder('dog', getObjectOrder('bom')+ 2)
 end
end
function onCreatePost()
  -- addLuaScript('gf_icons/NamyIcon', true)
   if gfName == 'luisa' then
      setProperty('gf.y',100)
      end
end
