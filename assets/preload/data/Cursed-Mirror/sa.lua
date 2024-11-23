function onUpdatePost()
       if curStep == 432 then
        doTweenAlpha("a", "dad", 1, 1.2, "linear");
       end
       setProperty("a.alpha", getProperty("dad.alpha"))
end
function onStartCountdown()
    setProperty("dad.alpha", 0)
end