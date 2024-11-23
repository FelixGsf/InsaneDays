--omg is minecraft stage en fnf guauuuu
function onCreate()
makeLuaSprite('sky','BackGrounds/W10/images/weebSky',0,200)
setScrollFactor('sky',0.8,0.8)
setProperty('sky.antialiasing', false)
makeLuaSprite('dojo','BackGrounds/W10/images/weebTreesBack',0,100)
makeLuaSprite('street','BackGrounds/W10/images/weebStreet',0,0)
setProperty('street.antialiasing', false)
setProperty('dojo.antialiasing', false)
makeLuaSprite('bg','BackGrounds/W10/images/weebSchool',0,-100)
setScrollFactor('bg',0.8,0.8)
setProperty('bg.antialiasing', false)
makeAnimatedLuaSprite('speaker','speakers/gfPixel',1400,850);
addAnimationByPrefix('speaker', 'idle', 'GF IDLE', 24, true)
setProperty('speaker.antialiasing', false)
makeAnimatedLuaSprite('Crow','BackGrounds/W10/images/bgFreaks',200,900);
addAnimationByPrefix('Crow', 'idle', 'BG Girls Group', 24, true)
addAnimationByPrefix('Crow', 'idle-alt', 'BG fangirls dissuaded', 24, true)
setProperty('Crow.antialiasing', false)
makeAnimatedLuaSprite('trees','BackGrounds/W10/images/weebTrees',0,0);
addAnimationByPrefix('trees', 'idle', 'trees', 24, true)
setProperty('trees.antialiasing', false)
if songName == 'OverProtective' then
objectPlayAnimation('Crow', 'idle-alt', true)
end


--scales
scaleObject('sky',7,7)
scaleObject('dojo',7,7)
scaleObject('Crow',5,5)
scaleObject('speaker', 7,7)
scaleObject('street',7,7.6)
scaleObject('trees',7,7.6)
scaleObject('bg',7,7)
--addluas
addLuaSprite('sky')
addLuaSprite('bg')
addLuaSprite('dojo')
addLuaSprite('Crow')
addLuaSprite('street')
addLuaSprite('trees')
addLuaSprite('speaker',false)
end
function onCreatePost()
if boyfriendName == 'mariPixelP1' then
    setProperty("boyfriend.y", 1360)
    setProperty("boyfriend.x", 2440)
    setProperty("gf.x", defaultGirlfriendX + 30)
        setProperty("gf.y", defaultGirlfriendY + 220)
end
end