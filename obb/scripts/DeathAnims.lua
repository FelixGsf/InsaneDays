---@diagnostic disable
local felixVariantes = {"felix", "felixN", "felixWeek3", "felix_chained", "felixSuit", "felixShade", "felixSa"}
local mariVariantes = {"mariP1", "mariP1N", "mariW3_Playable", "mariP1Suit", "mariSuit-shadeP1", "mariSa"}
local bools = {
    isFelix = false,
    isMari = false,
    isRayo = false,
    isLuisa = false;
}
local cry = false
---@class DeathManager

function onCreatePost()
    RayoEvent()
    onChangeGender()
    for _, felixName in ipairs(felixVariantes) do --usamos un for para no usar muchos "if"
        if boyfriendName == felixName then
            if curStage == "date" then
                print("ola")
            else
            createIcon('mari',true)
            end
            setPropertyFromClass('GameOverSubstate', 'characterName', 'felixDead')
            setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx')
            setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver')
            setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd')
        end
    end

    for _, mariName in ipairs(mariVariantes) do
        if boyfriendName == mariName then
            createIcon('felix',true)
            setPropertyFromClass('GameOverSubstate', 'characterName', 'mariDead')
            setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'mariDeath')
            setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'mariGameOver')
            setPropertyFromClass('GameOverSubstate', 'endSoundName', 'mariConfirm')
        end
    end
    if boyfriendName == "rayo-player" then
    createIcon('luisa',true)
        setPropertyFromClass('GameOverSubstate', 'characterName', 'rayoDiesxd'); 
        setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'rayoloss');
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'rayogameOver');
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'rayogameOverEnd')

    elseif boyfriendName == "sisterPlayable" then
        createIcon('rayo',true)
        setPropertyFromClass('GameOverSubstate', 'characterName', 'luisaDead'); 
        setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'sisterLoss');
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'sisterGameOver');
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'sisterConfirm')
    
elseif  boyfriendName == "felixAndMari" then
    setPropertyFromClass('GameOverSubstate', 'characterName', 'fxANDmari-dead'); 
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver');
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'mariConfirm')
elseif getPropertyFromClass("PlayState", "isPixelStage") == true and boyfriendName == "felixPixel" then
    setPropertyFromClass('GameOverSubstate', 'characterName', 'pixelDead'); 
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx-pixel');
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-pixel');
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd')
elseif getPropertyFromClass("PlayState", "isPixelStage") == true and boyfriendName == "mariPixelP1"  then
    setPropertyFromClass('GameOverSubstate', 'characterName', 'mariPixelDead');
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'mariDeath')
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'mariGameOver')
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'mariConfirm')
elseif getPropertyFromClass("PlayState", "isPixelStage") == true and boyfriendName == "felixAndMari-pixel" then
    setPropertyFromClass('GameOverSubstate', 'characterName', 'felixAndMariDeadPixel');
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfxw')
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'mariGameOver')
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'mariConfirm')
end
end





--[[
Controla los eventos de la week de rayo
como por ejemplo si juegan con mari, tu oponente en vez de ser "rayo" sera su hermana

y asi
]]

function RayoEvent()
    local gender = getPropertyFromClass("ClientPrefs", "myLove");
    if gender == true and dadName == "rayo" then
        triggerEvent("Change Character", 'dad', 'sisterRival')
    elseif gender == true and dadName == "rayoN" then
        triggerEvent("Change Character", 'dad', 'sisterN')
    end
end








---@class GenderSwarp
function onChangeGender()
    local roles = getPropertyFromClass("ClientPrefs", "myLove");
    if roles == true  then
        if boyfriendName == felixVariantes[1] then
            if curStage == "date" or songName == "Thats all Folks" then
                print("ajsajdja noooo")
            else
            triggerEvent("Change Character", 'bf', mariVariantes[1]);
            triggerEvent("Change Character", 'gf', 'felixSpeakers')
            end
        elseif boyfriendName == felixVariantes[2] then
            triggerEvent("Change Character", 'bf', mariVariantes[2]);
            triggerEvent("Change Character", 'gf', 'felixSpeakersN')
        elseif boyfriendName == felixVariantes[3] or boyfriendName == felixVariantes[4] then
            triggerEvent("Change Character", 'bf', mariVariantes[3]);
        elseif  boyfriendName == felixVariantes[5] then
            triggerEvent("Change Character", 'bf', mariVariantes[4])
            triggerEvent("Change Character", 'gf', 'felixSpeakersSuit')
        elseif boyfriendName == felixVariantes[6] then
            triggerEvent("Change Character", 'bf', mariVariantes[5])
            triggerEvent("Change Character", 'gf', 'felixSpeakersSuit-Shade')
        elseif boyfriendName == felixVariantes[7] then
            triggerEvent("Change Character", 'bf', mariVariantes[6])
            triggerEvent("Change Character", 'gf', 'felixWeek7gf')
        elseif boyfriendName == 'felixPixel' then
            triggerEvent("Change Character", 'bf', 'mariPixelP1')
            triggerEvent("Change Character", 'gf', 'felixPixelSpeaker')
        end
        
        if boyfriendName == "rayo-player" then
            triggerEvent("Change Character", 'bf', 'sisterPlayable'); 
            triggerEvent("Change Character", 'gf', 'rayoSpeaker'); 
        end
    end
   end





   function onUpdate()
    updateIcon()
    onOffsetIcon()
    setObjectOrder('icon',getObjectOrder("icon"))
    local rayoFamily = {'rayo-player','sisterPlayable'}
   end







   function createIcon(icon,front)
    if getPropertyFromClass("ClientPrefs", "gfIcon") == true then
    globalIcon = icon;
    makeAnimatedLuaSprite("icon","icons/gfs/"..icon,0,0);
    addAnimationByPrefix("icon", "normal", "idle",24 ,true);
    addAnimationByPrefix("icon", "lose", "LOSE",24,true);
    addAnimationByPrefix("icon", "win", "win",24,true);
    addAnimationByPrefix("icon", "sad", "sad",24,true);
    addAnimationByPrefix("icon", "miss", "miss",24,false);
    addAnimationByPrefix("icon", "happy", "happy",24,false);
    setObjectCamera("icon",'hud');
    setProperty("icon.x", getProperty("healthBar.x") + 230);
    if downscroll == false then
    setProperty("icon.y", getProperty("healthBar.y") -100);
    else
        setProperty("icon.y", getProperty("healthBar.y") -80);
    end
    addLuaSprite("icon",front);
    if front == false then
        setObjectOrder("icon", getObjectOrder("iconP1")+2)
    end
end
    end
    function updateIcon(self)
        play = function (object,animation,force)
            objectPlayAnimation(object, animation,force)
        end
        local health = getProperty("health")
        local curHealth = math.floor(health *50);
        setProperty("icon.color", getProperty("iconP1.color"))
        if curHealth > 50 then
            setProperty("icon.flipX", true)
        else
            setProperty("icon.flipX", false)
        end
        if cry == false then
        if curHealth < 20 then
            play("icon","sad",false);
        elseif curHealth >= 80 then
            play("icon","win",false);
        else
            play("icon","normal",false);
        end
    end

    setProperty("icon.scale.y", getProperty("iconP1.scale.y"))
    setProperty("icon.scale.x", getProperty("iconP1.scale.x"))
end
function onOffsetIcon()
    local curAnim = getProperty("icon.animation.curAnim.name")
    local offsets = {

        felix = {
            miss = {0,30};
        };
        rayo = {win = {10,0}};
        
            }
            if globalIcon == "felix" then
                if curAnim == "miss" then
                    setProperty("icon.offset.x", offsets.felix.miss[1]);
                    setProperty("icon.offset.y",  offsets.felix.miss[2]);
                else
                    setProperty("icon.offset.y", 0);
    end
elseif globalIcon == "rayo" then
    if curAnim == "win" then
        setProperty("icon.offset.x", offsets.rayo.win[1]);
    else
        setProperty("icon.offset.x", -40);
    end

end
end
function noteMiss(membersIndex, noteData, noteType, isSustainNote,self)
   
    cry = true;
   objectPlayAnimation("icon", "miss")
   runTimer("come",0.7)
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "come" then
cry = false;
        objectPlayAnimation("icon","normal",false);
    end
end