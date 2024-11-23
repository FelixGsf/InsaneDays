


function onBeatHit()
    if curBeat == 16  or curBeat == 80 then
setProperty("gfSpeed",1.2);           
        elseif curBeat == 48 or curBeat == 112 then
        setProperty("gfSpeed",1);  
    end
end
