local singing = false
function onCreate()
   local path = "BackGrounds/W11/"
    makeAnimatedLuaSprite("satanNote",path.."satanASSETS",1700,1150)
    addAnimationByPrefix("satanNote", "singUP", "SatanUP",24,false)
    addAnimationByPrefix("satanNote", "singDOWN", "SatanDOWN",24,false)
    addAnimationByPrefix("satanNote", "singRIGHT", "SatanRIGHT",24,false)
    addAnimationByPrefix("satanNote", "singLEFT", "SatanLEFT",24,false)
    addAnimationByPrefix("satanNote", "idle", "SatanIdle",24,true)
    setObjectOrder("satanNote",getObjectOrder("gfGroup")+1)
    objectPlayAnimation("satanNote", "idle")
    addLuaSprite("satanNote",false)
end
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    local anims = {"singLEFT","singDOWN","singUP","singRIGHT"}
    objectPlayAnimation("satanNote",anims[noteData+1])
    runTimer("idlePlay",1.5)
    if isSustainNote == true  then
        objectPlayAnimation("satanNote",anims[noteData+1])
        runTimer("idlePlay",1.5)
    end
end
function onTimerCompleted(tag)
    if tag == "idlePlay" then
        objectPlayAnimation("satanNote", "idle")
    end
    end