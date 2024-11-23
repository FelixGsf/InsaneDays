isBullet = true
function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'warningNOTE' then
			--setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'WarningS') 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NotesCustom/warningNOTE'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.070); --Change amount of health to take when you miss like a fucking moron
		end
	end
end

dodgeAnimations = {'dodgeLeft', 'dodgeDown', 'dodgeUp', 'dodgeRight'}
dodge = {'dodge'}
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'warningNOTE' then
		addAnimationByPrefix('rayogf', 'idle', 'DanceGod', 24, true);
		objectPlayAnimation('rayogf', 'clap','idle',false)
		triggerEvent("Play Animation", 'scared', 'gf')
		runTimer('animation',0.5)
		if boyfriendName == "felix" or boyfriendName == "felixN" then
		characterPlayAnim('boyfriend', dodgeAnimations[noteData+1])
		else
			characterPlayAnim('boyfriend', "dodge", true);
		end
		setProperty('boyfriend.specialAnim', true);
		triggerEvent('Screen Shake', "0.30, 0.02", 0)
		 animToPlay = '';
		if noteData == 0 then
			animToPlay = 'Shot';
		elseif noteData == 1 then
			animToPlay = 'Shot';
		elseif noteData == 2 then
			animToPlay = 'Shot';
		elseif noteData == 3 then
			animToPlay = 'Shot';
		end
		
		characterPlayAnim('dad', animToPlay, true);
		setProperty('dad.specialAnim', true);
		if songName == "Shot Head" then
			playSound("shotpico",0.5)
		end
	end
end
function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'animation' then
		objectPlayAnimation('rayogf', 'idle', true)
		characterPlayAnim("gf", "danceLeft")
    end
    end
    
    function onTweenCompleted(tag)
    if tag == 'byebye' then
   objectPlayAnimation('rayogf', 'idle', true)
    end
    end

healthDrain = 0;
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'warningNOTE' then
		triggerEvent('Screen Shake', "0.25, 0.40", 0)
		-- bf anim
		characterPlayAnim('boyfriend', 'hurt', true);
		setProperty('boyfriend.specialAnim', true);
		-- dad anim
		characterPlayAnim('dad', animToPlay, true);
		setProperty('dad.specialAnim', true);

		-- health loss | || || |_
		--setProperty('health', getProperty('health') - 0.2);
		healthDrain = healthDrain + 0.4;
	end
end

function onUpdate(elapsed)
	if healthDrain > 0 then
		healthDrain = healthDrain - 0.2* elapsed;
		setProperty('health', getProperty('health') - 0.3* elapsed);
		if healthDrain < 0 then
			healthDrain = 0;
			isBullet = false
		end
	--	if gfName == 'luisa' then-- ventaja de luisa
		--setProperty('health', getProperty('health') - 0.050* elapsed);
	--	elseif gfName == 'luisaN' then
		--	setProperty('health', getProperty('health') - 0.050* elapsed);
		end


	end
--end