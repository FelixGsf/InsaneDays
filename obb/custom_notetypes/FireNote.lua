isFire = false
function onCreate()
--Iterate over all notes
for i = 0, getProperty('unspawnNotes.length')-1 do
    --Check if the note is an Instakill Note
    if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'FireNote' then
        setPropertyFromGroup('unspawnNotes', i, 'texture', 'NotesCustom/FireNotes'); 
        setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.40); 

        if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
        end
    end
end
function noteMiss(id, noteData, noteType, isSustainNote)
    health = getProperty('health')
if noteType == 'FireNote' then
    triggerEvent("Play Animation", 'Fire','dad')
   triggerEvent('Orange Flash', '0.6')
   playSound("burnSound",1)
end
end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
if noteType == 'FireNote' then
    playSound("burnSound",1)
    if boyfriendName == 'rayo-player' then
        triggerEvent('Play Animation', 'dodge', 'bf')
    end
    triggerEvent("Play Animation", 'Fire','dad')

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