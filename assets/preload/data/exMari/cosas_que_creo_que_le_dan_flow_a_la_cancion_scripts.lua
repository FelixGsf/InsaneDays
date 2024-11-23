function onUpdatePost()
    if mustHitSection == false then
        setProperty('defaultCamZoom',0.65)
    else
        setProperty('defaultCamZoom',0.70)
    end
    if curStep == 865 then
        setProperty("dad.flipX", true);
        doTweenX("ho","dad",-3000,5,'linear'); 
    end
    if curStep == 378 then
        triggerEvent("Play Animation", 'ughly', 'dad')
    end
    if curStep == 569 then
        setProperty('defaultCamZoom',0.70)
    end
end
    --- @param eventName string
    --- @param value1 string
    --- @param value2 string
    --- @param strumTime float
    ---
    function onEvent(name, value1, value2, strumTime)
        if name == "lyrics" and value1 == "Así es como lo hago!"then
            triggerEvent("Play Animation", 'hey', 'bf')
            setProperty('defaultCamZoom',0.86)
        end
    end 