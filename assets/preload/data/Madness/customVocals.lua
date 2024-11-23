function onUpdate()
  if (curStep == 180) then
playSound("d-side/JESTER/LEETS_SEE",2,"text");
makeLuaText("amena", "¡Veamos qué puedes hacer!", 625, 300, 500);
setTextBorder("amena", 5,"000000");
setTextSize("amena", 30)
addLuaText("amena");
  end
  if curStep == 256 then
    removeLuaText("amena");
  end
end
function onPause()
  pauseSound("text");
end
function onResume()
  resumeSound("text")
  
end
function onTimerCompleted(tag)
  if tag == "bye" then
    if boyfriendName == "felix" or boyfriendName == "mariP1" then
      playMusic("vocal/Voices-felix",0.7,false);
    --  playMusic("vocal/inst",0.7,false);
  elseif boyfriendName == "rayo-player"  or boyfriendName == "sisterPlayable"then
      playMusic("vocal/Voices-rayo",0.7,false);
    --  playM
  end
end
end