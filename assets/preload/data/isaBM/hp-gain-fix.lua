--script made by Held_der_Zeit
--because ShadowMario won't (no offense)

function onCreate()
	gain = 0.023
	loss = 0.0475
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	health = getProperty('health')

	setProperty('health', health - 0.200);

	if isSustainNote then
		setProperty('health', health + gain/2);
		--0.023 is default health gain value
		--also, substracting, while it otherwise would stack ontop
	else
		--setProperty('health', health - 0.023);
		setProperty('health', health + gain);
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	health = getProperty('health')

	setProperty('health', health + 0.0475);

	if isSustainNote then
		setProperty('health', health - loss/2);
		--0.0475 is default health loss value
		--also, adding, while it otherwise would stack ontop
	else
		--setProperty('health', health + 0.0475);
		setProperty('health', health - loss);
	end
end