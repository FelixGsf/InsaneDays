stopDad = false
function onCreate()
--Iterate over all notes
for i = 0, getProperty('unspawnNotes.length')-1 do
    --Check if the note is an Instakill Note
    if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'RayoNote' then
        setPropertyFromGroup('unspawnNotes', i, 'texture', 'rayoNote'); 

        if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
        end
    end
end
function noteMiss(id, noteData, noteType, isSustainNote)
if noteType == 'RayoNote' then
triggerEvent("Play Animation", 'hey','dad' )
   triggerEvent('Orange Flash', '0.6')
   runTimer("byePlayer",0.98)
   runTimer("anim",1.3)
   runTimer("FIREEEE",1.6)
   setProperty('dad.stunned',true)
end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
if noteType == 'RayoNote'then
    characterPlayAnim('bf', 'shot', false)
    triggerEvent("Play Animation", 'dodge','dad' )
    triggerEvent("Alt Idle Animation", 'dad','' )
    playSound('shoot',0.6)
end
end
function onEvent(n,v1,v2)
if n == 'Orange Flash' then
    makeLuaSprite('flash', '', 5, 3);
    makeGraphic('flash',1280,720,'FFA500')
    addLuaSprite('flash', true);
    setLuaSpriteScrollFactor('flash',0,0)
    setProperty('flash.scale.x',2)
    setProperty('flash.scale.y',2)
    setProperty('flash.alpha',0)
    setProperty('flash.alpha',1)
    doTweenAlpha('flTw','flash',0,v1,'linear')
end
end
end
--- @param tag string
--- @param loops integer
--- @param loopsLeft integer
---
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "byePlayer" then
        stopDad = true
    end
    if tag == "anim" then
        triggerEvent("Play Animation", 'Fire','dad')
        characterPlayAnim("dad", "Fire",true)
        playSound("burnSound",1)
    end
    if tag == "FIREEEE" then
        setProperty("health", -5)
        triggerEvent('Orange Flash', '0.6')
    end
end
--- @param membersIndex int
--- @param noteData int
--- @param noteType string
--- @param isSustainNote bool
---
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    dadAnims = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
    if noteType == 'No Animation' and stopDad == false then
        triggerEvent('Play Animation',dadAnims[noteData+1],'dad')
    end
end