function onCreate()
             precacheImage('events/unstoppable/jesterLaugh');
end

function onCreatePost()
             makeAnimatedLuaSprite('jester', 'events/unstoppable/jesterLaugh', getProperty('dad.x') - 1070, getProperty('dad.y') - 330);
             addAnimationByIndices('jester', 'preparacion', 'laugh', '0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25', 24);
	     addAnimationByIndices('jester', 'HA', 'laugh', '26, 27, 28, 29, 30, 31, 32, 33', 24);
             setObjectCamera('jester', 'camGame');
             setProperty('jester.alpha',  0.00001);
             scaleLuaSprite('jester', 0.9, 0.9); 
             addLuaSprite('jester', false);  
end
function onEvent(name, value1, value2)
	if name == 'JesterLAUGH' and value1 == 'ahora' then

             luaSpritePlayAnimation('jester', 'preparacion');

             setProperty('jester.alpha', 1);
             setProperty('dad.alpha', 0.00001);
end             

        if name == 'JesterLAUGH' and value1 == 'adio' then

             setProperty('dad.alpha', 1)
             removeLuaSprite('jester', false)
             --setProperty('jester.alpha', 0.00001);   
end
       if name == 'JesterLAUGH' and value1 == 'intermedio' then

             setProperty('dad.alpha',  0.00001)
             addLuaSprite('jester', false);  
             setProperty('jester.alpha', 1);          
end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == '' then
          luaSpritePlayAnimation('jester', 'HA');
    end
end

function onUpdatePost(elapsed)
  if getProperty('jester.animation.curAnim.name') == 'preparacion' then
   if getProperty('jester.animation.curAnim.finished') then
         luaSpritePlayAnimation('jester', 'HA');
     end
   end
end