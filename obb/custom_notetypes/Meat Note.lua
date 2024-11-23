function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Meat Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NotesCustom/MEAT_NOTE_assets'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')

end

 maxNotes = 0;
 pressed = false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Meat Note' and songName == "Thats all Folks" then
		maxNotes = maxNotes + 1
	elseif songName == "ReRuns" and noteType == 'Meat Note' then
		setProperty("health", -2)
	end
end
function onUpdate()
	local clear = getProperty('ratingFC')
	if songName == "Thats all Folks" and not inGameOver  then
		setProperty("scoreTxt.x",70)
	makeLuaText("notex", "|".." DIE:".. maxNotes.."/10", 1020, 340, 695)
	setTextSize("notex", 18)
	setTextColor("notex", "A70505")
	addLuaText("notex")
	if clear == "CLEAR" or clear == "Clear" or clear == "clear" then
		setProperty("notex.x", getProperty("notex.x")+40)
	end
	if maxNotes == 10 then
		setProperty("health", -2)
	end
	end
	if debug == true then
if maxNotes > 0 and keyReleased('space')   then
	maxNotes = maxNotes - 1
	end
end
end