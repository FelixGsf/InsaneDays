nuevo_alfa = 1
function onCreatePost()
  setProperty("felix.alpha", nuevo_alfa)
  roles = getPropertyFromClass("ClientPrefs", "myLove",true)
  if difficultyName == "chill" then
    addLuaScript("data/esquizofrenia/logros/achievements")
  end
end
function onUpdate()
  if keyboardPressed("F") then
    endSong()
    end
end
