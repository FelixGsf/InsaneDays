function onCreate()
    makeLuaSprite("bg","BackGrounds/W12/mallBg",-1000,-800);
    scaleObject("bg", 1.1,1.1)
    setScrollFactor("bg", 0.8, 0.8)
    addLuaSprite("bg")
    makeLuaSprite("floor","BackGrounds/W12/mallFloor",-1150,500);
    scaleObject("floor", 1.4,1)
    addLuaSprite("floor")
end
function onCreatePost()
    if boyfriendName == 'mariP1' then
        setProperty("boyfriend.y",getProperty("boyfriend.y")+140)
        setProperty("boyfriend.x",getProperty("boyfriend.x")+130)
        setProperty("gf.y",getProperty("gf.y")+80)
      --  setProperty("gf.x",getProperty("boyfriend.x")+130)
    end
end