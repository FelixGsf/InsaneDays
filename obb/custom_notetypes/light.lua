local healthDrop = 0;
local FUCKYOU = 0;
function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'light' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'FlashNotes');
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0');
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0');
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'light' then
playSound('jumpscare',50);
characterPlayAnim('bf', 'hurt', true);
setProperty('health', getProperty('health')-0.3);
makeLuaSprite('jumpscare','jumpscare',0,-50);
addLuaSprite('jumpscare',true)
runTimer('wait', 0.5);
setObjectCamera('jumpscare', 'camhud');
function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'wait' then
    doTweenAlpha('byebye', 'jumpscare', 0, 0.1, 'linear');
    end
    end
    
    function onTweenCompleted(tag)
    if tag == 'byebye' then
    removeLuaSprite('jumpscare', true);
    end
    end

	end
	end
	startDraining = true		