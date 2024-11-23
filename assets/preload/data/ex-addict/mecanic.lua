

function onCreatePost() -- sprite loading
	makeLuaSprite('loadingBG', 'mecanics/exmix', 0, 0)
	addLuaSprite('loadingBG', true)
	setObjectCamera('loadingBG', 'camOther')
	runTimer('fadeTimer', 1.2, 1)
end

function onTimerCompleted(tag) -- bye bye loading screen
    if tag == 'fadeTimer' then
	    doTweenAlpha('delete', 'loadingBG', 0, 0.25, 'backIn')
	end
end

function onTweenCompleted(tag) -- everything goes bye bye
    if tag == 'delete' then
	    removeLuaSprite('loadingBG', true)
	end
end