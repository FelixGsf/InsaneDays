local Flip = tank
local tag = Right
local tag2 = Left
function onEvent(name, value1, value2)
    if name == "DemonRight" then
       if value1 == "" then
        idle2 = false
    makeAnimatedLuaSprite('demon','BackGrounds/W11/harpie',2400,600);
    addAnimationByPrefix('demon','die','die0',24,true)
    addAnimationByPrefix('demon','die','idle04',24,true)
    scaleObject("demon", 2.0, 2.0)
   triggerEvent('Play Animation',"shot1","gf")
   setObjectOrder('demon', getObjectOrder('boyfriend') + 6)
    runTimer('demon', 0.2);
    -- setProperty('exmix.color',getColorFromHex("00D1FF"))
end
if value1 == "idle" then
    idle = true
    makeAnimatedLuaSprite('demon','BackGrounds/W11/harpie',2360,500);
    addAnimationByPrefix('demon','die','die0',24,true)
    addAnimationByIndicesLoop('demon','idle','idle','4,5,6,7,8,910,11,12,13,14',24)
   setObjectOrder('demon', getObjectOrder('boyfriend') + 6)
    scaleObject("demon", 2.0, 2.0)
objectPlayAnimation("demon", "idle")
addLuaSprite("demon",false)
cancelTimer("demon")
end
end
end
    function onTimerCompleted(tag, loops, loopsleft)
        if tag == 'demon' and idle2 == false then
            doTweenAlpha('byebye', 'demon', 0, 0.4, 'linear');
            objectPlayAnimation('demon', 'die', true)
         --   setProperty('exmix.color',16777215)
    
        end
            function onTweenCompleted(tag)
                if tag == 'byebye' and idle2 == false  then
                    removeLuaSprite('demon',true)
                end

       
        end
        end
        
        
        
        

