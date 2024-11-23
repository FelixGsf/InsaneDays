inkCount = 0

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Ink Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NotesCustom/INK_assets');

				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Ink Note' then
	    inkCount = inkCount + 1
		playSound('inked');
		runTimer('InkCover', 2);
	end
end

function onUpdate()
	if inkCount == 1 then
		makeLuaSprite('InkCover1', 'Damage01', 0, 0);
		setObjectCamera('InkCover1', 'other');
		scaleLuaSprite('InkCover1', 0.7, 0.7);
		setProperty('InkCover1.alpha', 1);
		addLuaSprite('InkCover1', false);

	elseif inkCount == 2 then
	    makeLuaSprite('InkCover2', 'Damage02', 0, 0);
		setObjectCamera('InkCover2', 'other');
		scaleLuaSprite('InkCover2', 0.7, 0.7);
		setProperty('InkCover2.alpha', 1);
		addLuaSprite('InkCover2', false);

	elseif inkCount == 3 then
	    makeLuaSprite('InkCover3', 'Damage03', 0, 0);
		setObjectCamera('InkCover3', 'other');
		scaleLuaSprite('InkCover3', 0.7, 0.7);
		setProperty('InkCover3.alpha', 1);
		addLuaSprite('InkCover3', false);

	elseif inkCount == 4 then
	    makeLuaSprite('InkCover4', 'Damage04', 0, 0);
		setObjectCamera('InkCover4', 'other');
		scaleLuaSprite('InkCover4', 0.7, 0.7);
		setProperty('InkCover4.alpha', 1);
		addLuaSprite('InkCover4', false);

	elseif inkCount > 4 then
        setProperty('health', 0);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'InkCover' then
		inkCount = 0
		doTweenAlpha('IC1t', 'InkCover1', 0, 0.5, 'linear');
		doTweenAlpha('IC2t', 'InkCover2', 0, 0.5, 'linear');
		doTweenAlpha('IC3t', 'InkCover3', 0, 0.5, 'linear');
		doTweenAlpha('IC4t', 'InkCover4', 0, 0.5, 'linear');
	end
end