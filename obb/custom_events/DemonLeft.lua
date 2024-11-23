local Flip = tank
local tag = Right
local tag2 = Left

function onEvent(name, value1, value2)
    if name == "DemonLeft" then
        if value1 == "" then
            idle = false
    makeAnimatedLuaSprite('demon2','BackGrounds/W11/harpie',800,600);
    addAnimationByPrefix('demon2','die','die0',24,true)
    addAnimationByPrefix('demon2','die','idle04',24,true)
   triggerEvent('Play Animation',"shot2","gf")
   scaleObject("demon2", 2.0, 2.0)
  setObjectOrder('demon2', getObjectOrder('boyfriend') + 6)
    runTimer('demon2', 0.2);
    setProperty('demon2.flipX', true)
        end
 if value1 == "idle"  then 
    idle = true
    makeAnimatedLuaSprite('demon2','BackGrounds/W11/harpie',1200,500);
    addAnimationByPrefix('demon2','die','die0',24,true)
    addAnimationByIndicesLoop('demon2','idle','idle','4,5,6,7,8,910,11,12,13,14',24)
   setObjectOrder('demon2', getObjectOrder('boyfriend') + 6)
    scaleObject("demon2", 2.0, 2.0)
    setProperty('demon2.flipX', true)
  objectPlayAnimation('demon2','idle')
  addLuaSprite("demon2",false)
  cancelTimer("demon2")
end
end
end
    function onTimerCompleted(tag, loops, loopsleft)
        if tag == 'demon2' and idle == false  then
            doTweenAlpha('demon2', 'demon2', 0, 0.4, 'linear');
            objectPlayAnimation('demon2', 'die', true)
    
        end
            function onTweenCompleted(tag)
                if tag == 'byebye' and idle == false then
                    removeLuaSprite('demon2',true)
                end

       
        end
        end
        
        
        
        

