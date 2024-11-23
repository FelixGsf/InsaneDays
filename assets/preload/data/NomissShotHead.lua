local anims = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
function noteMiss(id, direction, noteType, isSustainNote)
   if songName == "shot head" then
   characterPlayAnim('boyfriend', anims[direction + 1], true)
   setProperty('boyfriend.color', 16777215);
   end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
   if songName == "shot head" then
   setProperty('boyfriend.color', 16777215);
end

function onUpdate()
   if songName == "shot head" then
    if getProperty('boyfriend.animation.curAnim.name') == 'idle' or getProperty('boyfriend.animation.curAnim.name') == 'danceLeft' or getProperty('boyfriend.animation.curAnim.name') == 'danceRight' then
        setProperty('boyfriend.color', 16777215);
     
    end
   end
end
end

