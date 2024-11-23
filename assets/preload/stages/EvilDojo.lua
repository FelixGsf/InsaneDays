--omg is minecraft stage en fnf guauuuu
function onCreate()
makeAnimatedLuaSprite('speaker','speakers/gfPixel',1400,880);
addAnimationByPrefix('speaker', 'idle', 'GF IDLE', 24, true)
makeAnimatedLuaSprite('Crow','BackGrounds/W10/images/bgGhouls',200,1300);
addAnimationByPrefix('Crow', 'idle', 'BG freaks glitch instance', 24, true)
setProperty('Crow.antialiasing', false)
setProperty('speaker.antialiasing', false)
setProperty('bg.antialiasing', false)
makeAnimatedLuaSprite('bg','BackGrounds/W10/images/animatedEvilSchool',-1300,-1200);
addAnimationByPrefix('bg', 'idle', 'background 2 instance', 24, true)
removeLuaSprite('Crow',true)

--scales
scaleObject('Crow',5,5)
scaleObject('speaker', 7,7)
scaleObject('bg',7,7)
--addluas
addLuaSprite('bg')
addLuaSprite('speaker',false)
end
function onCreatePost()
    if gfName == "felixPixelSpeaker" then
        setProperty("gf.x", defaultGirlfriendX + 80)
        setProperty("gf.y", defaultGirlfriendY + 240)
    end
    end