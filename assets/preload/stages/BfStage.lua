function onCreate()
    makeLuaSprite('stageBack','BackGrounds/W14/stageback',0,0)
    makeLuaSprite('courtines','stagecurtains',150,200)
   -- scaleObject('courtines',1.1,1.1)
    setScrollFactor('courtines',1.2,1.2)
    makeLuaSprite('front','stagefront',50,1000)
    setProperty('deadfx.visible',true)
    makeLuaSprite('bg2','BackGrounds/W14/layer-0',0,0)
    addLuaSprite('bg2')
    makeAnimatedLuaSprite('deadfx','BackGrounds/W14/deadLayer', 1300, 630);
    addAnimationByPrefix('deadfx','idle','BF',20,true)
    addLuaSprite('deadfx')
    setProperty('deadfx.flipX',true)
    makeAnimatedLuaSprite('deadbf','BackGrounds/W14/dead02Layer', 900, 630);
    addAnimationByPrefix('deadbf','idle','BF',20,true)
    makeAnimatedLuaSprite('bom','speakers/bombox',1100,710)
    addAnimationByPrefix('bom', 'idle', 'stereo boom', 24, true)
    makeAnimatedLuaSprite('crow','BackGrounds/W14/CrowBG',200,960);
    addAnimationByPrefix('crow', 'idle', 'idle', 24, true)
    scaleLuaSprite('crow', 2.5, 2.5)
    makeAnimatedLuaSprite('gfB','BackGrounds/W14/GFlayer',600,560)
    addAnimationByPrefix('gfB', 'danceLeft', "GFlayer idle",24, true)
    scaleLuaSprite('gfB', 1.5, 1.5)
   -- addAnimationByIndices('gfB', 'danceRight', "GFlayer idle", "10,11,12,13,14,15,16,17,18,19", 24, false)
    objectPlayAnimation('gfB', 'danceLeft', true, 0)
    addLuaSprite('deadbf')
    addLuaSprite('stageBack')
    addLuaSprite('front')
    addLuaSprite('gfB', false)
    addLuaSprite('bom')
    addLuaSprite('courtines',true)
    addLuaSprite('crow', true)
   -- setProperty('deadfx.flipX',true)
    --setObjectOrder('front',getObjectOrder('courtines')-1)
   
    if songName == "Lights Out" then
       removeLuaSprite('stageBack')
       setProperty('gf.visible',false)
       removeLuaSprite('courtines')
       removeLuaSprite('front')
       removeLuaSprite('bom')
       removeLuaSprite('gfB', true)

    end
    if songName == "battle-of-rappers" then
        removeLuaSprite('bg2')
        removeLuaSprite('deadfx')
        removeLuaSprite('deadbf')
    end
    end
function onCreatePost()
    if gfName == 'namy' then
        setProperty('gf.y',400)
    end
end