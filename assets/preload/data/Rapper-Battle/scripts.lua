anim = false
local followchars = true
xx = 1420
yy = 1000
xx2 = 1910
yy2 = 1220
ofs = 30
camZoomLock = false
shit = {}
function onCreatePost()
    precacheImage("sillyAnims/Anim2")
    precacheImage("sillyAnims/Anim1")
    --for i =0,3 do
    --    setObjectCamera('opponentStrums.members['..i..']','camGame');
        --setScrollFactor('opponentStrums.members['..i..'].scrollFactor.y',1);
    --end

    makeAnimatedLuaSprite('anim1','sillyAnims/Anim1',getProperty('dad.x'),getProperty('dad.y'))
    addAnimationByPrefix('anim1','idle','HSLookalikeDialogue',30,false)
    scaleObject('anim1',2.41,2.41)
    setProperty('anim1.offset.x',-190)
    setProperty('anim1.offset.y',-95)
    setProperty('anim1.visible',false)
    setObjectOrder('anim1',getObjectOrder('dad'))
    addLuaSprite('anim1')

    makeAnimatedLuaSprite('anim2','sillyAnims/Anim2',getProperty('dad.x'),getProperty('dad.y'))
    addAnimationByPrefix('anim2','idle','HSLookalikeDialogue',30,false)
    scaleObject('anim2',2.41,2.41)
    setProperty('anim2.offset.x',-190)
    setProperty('anim2.offset.y',-95)
    setProperty('anim2.visible',false)
    setObjectOrder('anim2',getObjectOrder('dad'))
    addLuaSprite('anim2')

    makeLuaText('lyrics','',1280,0,0)
    --setTxtFormat('lyrics',"Times New Roman.ttf", 48, 'cfa92d', 'CENTER', '000000',2, 'camHUD', 'X');
    setTextFont('lyrics',"Times New Roman.ttf")
    setTextSize('lyrics',48)
    setTextColor('lyrics','cfa92d')
    setTextAlignment('lyrics','CENTER')
    setTextBorder('lyrics',2,"000000")
    setObjectCamera('lyrics',"camHUD")
    screenCenter('lyrics',"X")
    setProperty('lyrics.y',screenHeight - getProperty('lyrics.height'));
    addLuaText('lyrics');

    makeLuaText('vietsub','',1280,0,0)
    --setTxtFormat('vietsub',"Times New Roman.ttf", 48, 'cfa92d', 'CENTER', '000000',2, 'camHUD', 'X');
    setTextFont('vietsub',"Times New Roman.ttf")
    setTextSize('vietsub',48)
    setTextColor('vietsub','cfa92d')
    setTextAlignment('vietsub','CENTER')
    setTextBorder('vietsub',2,"000000")
    setObjectCamera('vietsub',"camHUD")
    screenCenter('vietsub',"X")
    setProperty('vietsub.y', getProperty('lyrics.height')/2);
    addLuaText('vietsub');

    if boyfriendName == "mariP1" then
        setProperty("boyfriend.y", getProperty("boyfriend.y"));
    end

end
function setTxtFormat(tag, font, size, color, alignment, borderColor, borderColorSize, camObject, screenCenter)
    
end

function onEvent(eventName, value1, value2)
    if eventName == '' then
        if (value1 == 'zoomin') then
            setProperty('defaultCamZoom',getProperty('defaultCamZoom') + value2/5)
        end
        if (value1 == 'hurt') then
            if (getProperty('health') > 0.5) then
                setProperty('health',getProperty('health')-0.05);
            end
        end
        if value1 == 'setZoom' then
            camZoomLock = true;
            triggerEvent('Add Camera Zoom','','');
            setProperty('defaultCamZoom',value2)
            runHaxeCode([[
                FlxG.camera.zoom = ]]..value2..[[
                ]])
        end
        if (value1 == 'removeLock') then
            camZoomLock = false;
        end
    end

    if (eventName == "ill make") then
            if value1 == 'hud in' then 
                for i = 4,7 do               
                    noteTweenAlpha('note'..i,i,1,1.5,'quadOut')
                end
            end


            if value1 == 'anim' then
                setProperty('vocals.volume', 1);
                setProperty('dad.visible', false);
                setProperty('anim1.visible',true)
                playAnim('anim1','idle',false)
                anim = true
            end

            if value1 == 'black' then
                doTweenAlpha('blackScreenAlpha','blackScreen',1, 1.125,'quadOut');
                runHaxeCode([[
                FlxTween.num(0.6, 1.125, 0.75, {ease: FlxEase.backIn, onUpdate: (s)->{
                    game.defaultCamZoom = s.value;
                    }
                });
                    ]])
            end

            if value1 == 'pre' then
                shit = {"scoreTxt", "timeBar","timeTxt","bar"}
                for s = 1,#shit do
                    doTweenAlpha(shit[s]..'Alpha',shit[s], 0, 2, "quadIn");
                    --FlxTween.num(0, 1, 2, thenease: FlxEase.quadIn, onUpdate: function(shit2:FlxTween)then
                        --modManager.setValue("alpha", shit2.value, 0);
                    --}, onComplete: Void->modManager.setValue("alpha", 1, 0)});
                end

                for i = 4,7 do
                    noteTweenAlpha(i..'Alpha',i, 0, 2, "quadIn");
                end
        
                camZoomLock = true;
                setProperty('defaultCamZoom', 0.5);
            end
                
                
            if value1 == 'die' then
                setProperty('blackScreen.alpha',1);
                runTimer('end',1)
            end

            if value1 == 'txt' then
                setTextString('lyrics',value2);
                screenCenter('lyrics', 'X');

                if value2 == "I'LL MAKE" then
                    setTextString('vietsub','TE HARÉ')
                elseif value2 == "YOU SAY" then
                    setTextString('vietsub','DECIR')
                elseif value2 == "HOW PROUD" then
                    setTextString('vietsub','LO ORGULLOSA!')
                elseif value2 == "YOU" then
                    setTextString('vietsub','QUE')
                elseif value2 == "YOU ARE" then
                    setTextString('vietsub','QUE ESTAS')
                elseif value2 == "YOU ARE OF" then
                    setTextString('vietsub','QUE ESTAS TU')
                elseif value2 == "YOU ARE OF ME" then
                    setTextString('vietsub','QUE ESTAS TU DE MI')
                elseif value2 == "SO STAY" then
                    setTextString('vietsub','ASÍ QUE MATENTE')
                elseif value2 == "AWAKE" then
                    setTextString('vietsub','EN PIE')
                elseif value2 == "JUST" then
                    setTextString('vietsub','EL TIEMPO')
                elseif value2 == "LONG" then
                    setTextString('vietsub','SUFICIENTE ')
                elseif value2 == "ENOUGH TO SEE" then
                    setTextString('vietsub','PARA VER')
                elseif value2 == "MY" then
                    setTextString('vietsub','MI')  
                elseif value2 == "MY WAY" then
                    setTextString('vietsub','MI CAMINO!') 
                elseif value2 == "" then
                    setTextString('vietsub','') 
                end
            end

            if value1 == 'break mirror' then
                setProperty('whiteMirror.alpha',1)
                doTweenAlpha('whiteMirrorAlpha','whiteMirror',0,1.75,'quadOut')
                setProperty('mirrorBroken.visible',true)
                
                cameraShake('camHUD',0.01, 0.25);
                cameraShake('camGame',0.01, 0.25);
                playSound('mirror_break',1);
                
            end

            if value1 == 'vid' then
                camZoomLock = false
            end
        
    end

    if eventName == 'Change Character' then
        if value1 == 'dad' then
            if value2 == 'bf-lookalike' then
                yy = 1220
            end

            if value2 == 'evilLookaLike' then
                yy = 1000
            end
        end
    end
end

function onUpdate()
    if getProperty('anim1.animation.curAnim.name') == 'idle' and getProperty('anim1.animation.curAnim.finished') == true and anim == true then
        playAnim('anim2','idle',false)
        setProperty('anim2.visible',true)
        setProperty('anim1.visible',false)
    end
    setProperty('isCameraOnForcedPos',false)
    
end

function onMoveCamera(turn)
    if turn == 'dad' and camZoomLock == false then
        setProperty('defaultCamZoom',0.6)
    elseif turn == 'boyfriend' and camZoomLock == false then
        setProperty('defaultCamZoom',0.5)
    end
    --debugPrint(turn)
end

function onTimerCompleted(tag)
    if tag == 'end' then
        --doTweenAlpha('blackOtherAlpha','blackOther',1,2,'quadOut')
        for i =4,7 do
            noteTweenAlpha('note'..i,i,0,4,'quadIn')
        end
    end
end