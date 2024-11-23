local healthDrop = 0;
local totalHealth = 0
local startDrain = false;
function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'poision' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NotesCustom/vape');
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0');
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0');
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
end
function onUpdate()
	if startDraining == true then
	setProperty('health', getProperty('health') - healthDrop); 
			end
health = getProperty('health')
		if health < 0.08 then
			startDraining = true
			end
		if health > 0.08 then
			startDraining = true
			end
			if healthDrop == 0.0001 then
				setProperty("iconP1.color",getColorFromHex("D0FECC"))
			elseif healthDrop == 0.0002 then
				setProperty("iconP1.color",getColorFromHex("A4FC9C"))
			elseif healthDrop == 0.0003 then 
				setProperty("iconP1.color",getColorFromHex("71F965"))
			elseif healthDrop == 0.0004 then 
				setProperty("iconP1.color",getColorFromHex("3BF92B"))
			elseif healthDrop >= 0.0005 then
				setProperty("iconP1.color",getColorFromHex("152C13"))
			end
			if health <= 0.08 then
				setProperty("health", 2)
			end
		end
	--end
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'poision' then
playSound('acid',1);
characterPlayAnim('bf', 'hurt', true);
	startDraining = true
		healthDrop = healthDrop + 0.0001;
		if healthDrop == 0.0001 then
			runTimer('BITCHLMAO', 0.1 , 100);		
		end
--	elseif gfName == 'namyN2' then
	--		healthDrop = healthDrop + 0.002;
		end
			
		end
