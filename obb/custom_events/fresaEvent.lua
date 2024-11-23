local gfAlpha = 0.34
local demonAlpha = 0.50
local iconAlpha = 0.34
 function onEvent(name,value1,value2)
    local roles = getPropertyFromClass("ClientPrefs", "myLove")
    if name == 'fresaEvent' then
        if songName == 'betrayal distance' then
playSound('alarm');
setProperty('boyfriend.visible',false)
setProperty('gf.visible',false);
setProperty('dad.visible',false);
setProperty('furniture.visible',false);
setProperty('speaker.visible',false);
setProperty('speaker2.visible',false);
setProperty('stageback.visible',false);
setProperty('bfPhantom.visible',false)
setProperty('dadPhantom.visible',false)
setProperty('gfPhantom.visible',false)
        end

    if songName == 'Esquizofrenia' and roles == false then
        setProperty('gf.alpha',gfAlpha)
        setProperty('gf.visible',true)
        triggerEvent('Play Animation',"aliv","gf")
        setProperty('gficon.visible', true)
        setProperty('gficon.alpha',iconAlpha)
       
    elseif roles == true then
        setProperty('gf.alpha',gfAlpha)
        --   setProperty('gf.visible',true)
          objectPlayAnimation("felix", "angry",true,0)
           setProperty('gficon.visible', true)
         --  setProperty('gficon.alpha',iconAlpha)
    end 
if songName == 'willPower' then
    --triggerEvent("Red Flash Camera",'2')
            setProperty('Dad3.alpha',demonAlpha)
            setProperty('Dad3.visible',true)

    end
    end
end
function onStartCountdown()
    setProperty('Dad3.visible',false)
end