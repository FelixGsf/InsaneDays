
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'0', '0'}
downoffsets = {'0', '0'}
upoffsets = {'0', '300'}
rightoffsets = {'0', '0'}
doIdle = true
function onCreate()
  makeAnimatedLuaSprite('popayano','BackGrounds/W12/¿images/popayano',500,1400); --player 3
    addAnimationByPrefix('popayano', 'idle', 'PUMPIDLE', 24, true);
    addAnimationByPrefix('popayano', 'singLEFT', 'PUMPRIGHT', 24, false);
    addAnimationByPrefix('popayano', 'singRIGHT', 'PUMPLEFT', 24, false);
    addAnimationByPrefix('popayano', 'singDOWN', 'PUMPDOWN', 24, false);
    addAnimationByPrefix('popayano', 'singUP', 'PUMPUP', 24, false);
    addLuaSprite('popayano', true);

    makeLuaSprite('bg','BackGrounds/W12/images/Schoolyard',-500,-700);
    addLuaSprite('bg')
    makeAnimatedLuaSprite('bom', 'speakers/bombox', 1200, 1380)
    addAnimationByPrefix('bom', 'idle', 'stereo boom', 24, true);
    addLuaSprite('bom')
    
   -- scaleObject('bg',2,2)
   if songName == "losers of years" then
setProperty('popayano.visible',false)
   else
    setProperty('popayano.visible',true)
   end
        if songName == "double M" then
            makeAnimatedLuaSprite('crow','BackGrounds/W12/images/Crowd1',800,1000)
            addAnimationByPrefix('crow', 'idle', 'Crowd1', 24, true);
            setScrollFactor('crow', 0.8, 1)
            setObjectOrder('crow', getObjectOrder('speaker')+ 2)
            addLuaSprite('bg')
            addLuaSprite('crow',false)

    end
     if songName == "RoloPop" then
       makeAnimatedLuaSprite('crow','BackGrounds/W12/images/Crowd1',800,1000)
       addAnimationByPrefix('crow', 'idle', 'Crowd1', 24, true);
     --  setScrollFactor('crow', 1.08,1)
       setObjectOrder('crow', getObjectOrder('speaker')+ 2)
       makeAnimatedLuaSprite('crow2','BackGrounds/W12/images/FrontCrowd',-200,1110)
       addAnimationByPrefix('crow2', 'idle', 'FrontCrowd_Cheer', 24, true);
    setProperty('crow2.scale.x',4)
    setScrollFactor('crow2', 0.8, 0.8)
    
       scaleObject('crow2',0.8,0.8)
     addLuaSprite('bg')
        addLuaSprite('crow')
      --  addLuaScript('data/Lexscript')
        addLuaSprite('crow2',true)
      --  addLuaSprite('bom')
end
end
function onCreatePost()
  if gfName == 'luisa' then
    setProperty('gf.y',1000)
  end
end
local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'popayanoZZZZ' then
        objectPlayAnimation('popayano', singAnims[direction + 1], false);

        if direction == 0 then
            setProperty('popayano' .. '.offset.x', leftoffsets[1]);
            setProperty('popayano' .. '.offset.y', leftoffsets[2]);

            if isSustainNote then
                objectPlayAnimation('popayano', singAnims[direction + 1], true);
            end
        elseif direction == 1 then
            setProperty('popayano' .. '.offset.x', downoffsets[1]);
            setProperty('popayano' .. '.offset.y', downoffsets[2]);

            if isSustainNote then
                objectPlayAnimation('popayano', singAnims[direction + 1], true);
            end
        elseif direction == 2 then
            setProperty('popayano' .. '.offset.x', upoffsets[1]);
            setProperty('popayano' .. '.offset.y', upoffsets[2]);

            if isSustainNote then
                objectPlayAnimation('popayano', singAnims[direction + 1], true);
            end
        elseif direction == 3 then
            setProperty('popayano' .. '.offset.x', rightoffsets[1]);
            setProperty('popayano' .. '.offset.y', rightoffsets[2]);

            if isSustainNote then
                objectPlayAnimation('popayano', singAnims[direction + 1], true);
            end
        end
    end
end
function onBeatHit()
  -- triggered 4 times per section
  if curBeat % 2 == 0  and doIdle then
      objectPlayAnimation('popayano', 'idle');
     setProperty('popayano' .. '.offset.x', idleoffsets[1]);
     setProperty('popayano' .. '.offset.y', idleoffsets[2]);
  end
  doIdle = true
end