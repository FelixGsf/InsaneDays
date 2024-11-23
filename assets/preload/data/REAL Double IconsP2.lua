function onCreate()
    precacheImage('iconfilename') -- change "iconnamefile" to your correct file
    precacheImage('iconfilename2') -- change "iconnamefile" to your correct file
end

function onUpdate(elapsed)
    if getProperty('health') > 1.6 then
        setProperty('iconnameP2.visible', false) -- change "iconnameP1" to your correct name
        setProperty('iconnameloseP2.visible', true) -- change "iconnameloseP2" to your correct name
    else
        setProperty('iconnameP2.visible', true) -- change "iconnameP1" to your correct name
        setProperty('iconnameloseP2.visible', false) -- change "iconnameloseP2" to your correct name

        if getProperty('health') > .375 then
            setProperty('iconnameP2.visible', true) -- change "iconnameP1" to your correct name
            setProperty('iconnamewinP2.visible', false)
        else
            setProperty('iconnameP2.visible', false) -- change "iconnameP1" to your correct name
            setProperty('iconnamewinP2.visible', true)
            
    end
end
end

function onCreatePost()
        makeLuaSprite('iconnameP2', 'icons/mariDuo/mariNormal', getProperty('iconP1.x'), getProperty('iconP1.y')) -- change "iconnamefile" to your correct file
        setObjectCamera('iconnameP2', 'hud')
        addLuaSprite('iconnameP2', true)
        setObjectOrder('iconnameP2', getObjectOrder('iconP1') + 1)
        setProperty('iconnameP2.flipX', true)
        setProperty('iconnameP2.visible', true)

        makeLuaSprite('iconnameloseP2', 'icons/mariDuo/mariWin', getProperty('iconP1.x'), getProperty('iconP1.y')) -- change "iconnamefile2" to your correct file
        setObjectCamera('iconnameloseP2', 'hud')
        addLuaSprite('iconnameloseP2', true)
        setObjectOrder('iconnameloseP2', getObjectOrder('iconP1') + 1)
        setProperty('iconnameloseP2.flipX', true)
        setProperty('iconnameloseP2.visible', true)

        makeLuaSprite('iconnamewinP2', 'icons/mariDuo/mariLoss', getProperty('iconP1.x'), getProperty('iconP1.y')) -- change "iconnamefile2" to your correct file
        setObjectCamera('iconnamewinP2', 'hud')
        addLuaSprite('iconnamewinP2', true)
        setObjectOrder('iconnamewinP2', getObjectOrder('iconP1') + 1)
        setProperty('iconnamewinP2.flipX', true)
        setProperty('iconnamewinP2.visible', false)
end

function onUpdatePost(elapsed)
        setProperty('iconnameP2.x', getProperty('iconP1.x') + 0) -- icon location X (firstIcon)
        setProperty('iconnameP2.angle', getProperty('iconP1.angle'))
        setProperty('iconnameP2.y', getProperty('iconP1.y') - 30) -- icon location Y (firstIcon)
        setProperty('iconnameP2.scale.x', getProperty('iconP1.scale.x') - 0.06) -- icon size X (firstIcon)
        setProperty('iconnameP2.scale.y', getProperty('iconP1.scale.y') - 0.06) -- icon size Y (FirstIcon)

        setProperty('iconnameloseP2.x', getProperty('iconP1.x') + 0) -- icon location X (secondIcon)
        setProperty('iconnameloseP2.angle', getProperty('iconP1.angle'))
        setProperty('iconnameloseP2.y', getProperty('iconP1.y') - 30) -- icon location Y (secondIcon)
        setProperty('iconnameloseP2.scale.x', getProperty('iconP1.scale.x') - 0.06) -- icon size X (secondIcon)
        setProperty('iconnameloseP2.scale.y', getProperty('iconP1.scale.y') - 0.06) -- icon size Y (secondIcon)
        
        setProperty('iconnamewinP2.x', getProperty('iconP1.x') + 0) -- icon location X (secondIcon)
        setProperty('iconnamewinP2.angle', getProperty('iconP1.angle'))
        setProperty('iconnamewinP2.y', getProperty('iconP1.y') - 30) -- icon location Y (secondIcon)
        setProperty('iconnamewinP2.scale.x', getProperty('iconP1.scale.x') - 0.06) -- icon size X (secondIcon)
        setProperty('iconnamewinP2.scale.y', getProperty('iconP1.scale.y') - 0.06) -- icon size Y (secondIcon)
end
