local songs = {'no more drogs','multilove'}
local curSelected = 1;
function onCreate()
function onStartCountdown() 
    if not allowCountdown then
      return Function_Stop
    end
    
    if allowCountdown then
      return Function_Continue
    end
end
makeLuaSprite("bg","menumod/MenuFreeplay",0,0);
addLuaSprite("bg")
onAddSong(songs[curSelected] ,"dad","cc")
end
function onCreatePost()
	setProperty('timeTxt.visible', false)
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('healthBar.visible', false)
	setProperty('healthBarBG.visible', false)
	setProperty('scoreTxt.visible', false)
	setProperty('boyfriend.visible', false)
	setProperty('gf.visible', false)
	setProperty('dad.visible', false)
end
function onUpdate()
    if keyJustPressed('pause') then
       exitSong(false);
    end
end  
---@param songName2 string --nombre de la cancion
---@param icon string --el icono debe ir en "icons/"
---@param color string --color en hex
function onAddSong(songName2,icon,color)
    makeLuaText(songName2, songName2, 50, 0, 0)
    addLuaText(songName2)
    makeLuaSprite("icon","icons/icon-"..icon,0,0)
    addLuaSprite("icon")
    setProperty("bg.color", getColorFromHex(color))
end