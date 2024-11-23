---@diagnostic disable
local singAnims = {"singLEFT","singDOWN","singUP","singRIGHT"};
local LEFTOFFETS = {-27,-256};
local RIGHTOFFETS = {40,-260};
local IDLEOFFSETS = {0,-270};
local UPOFFETS = {10,-30};
local DOWNOFFETS = {-20,-256};
local singDuration = 0.75;
function onCreate()
    makeAnimatedLuaSprite("p3","characters/PopDiego",-60,280);
    addAnimationByPrefix("p3", "idle", "PUMPIDLE",24,true);
    setObjectOrder("p3", getObjectOrder("dadGroup")+ 1)
    addAnimationByPrefix("p3", "singUP", "PUMPUP",24,false);
    addAnimationByPrefix("p3", "singDOWN", "PUMPDOWN",24,false);
    addAnimationByPrefix("p3", "singLEFT", "PUMPLEFT",24,false);
    addAnimationByPrefix("p3", "singRIGHT", "PUMPRIGHT",24,false);
    addLuaSprite("p3");
end
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if noteType == "No Animation" then
    objectPlayAnimation("p3", singAnims[noteData + 1]);
    runTimer("hiIdle",singDuration);
    if getProperty("crownFront.alpha") ~= 0.6 then
    doTweenAlpha("ta", "crownFront", 0.6, 0.6, "linear")
    end
    if noteData == 2 then
        setProperty("p3.offset.x", UPOFFETS[1]);
        setProperty("p3.offset.y", UPOFFETS[2]);
    elseif noteData == 0 then
        setProperty("p3.offset.x", RIGHTOFFETS[1]);
        setProperty("p3.offset.y", RIGHTOFFETS[2]);
    elseif noteData == 3 then
        setProperty("p3.offset.x", LEFTOFFETS[1]);
        setProperty("p3.offset.y", LEFTOFFETS[2]);
    elseif noteData == 1 then
        setProperty("p3.offset.x", DOWNOFFETS[1]);
        setProperty("p3.offset.y", DOWNOFFETS[2]);
    end
else
    if getProperty("crownFront.alpha") ~= 1 then
    doTweenAlpha("tag", "crownFront", 1, 0.6, "linear")
end
end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "hiIdle" then
        objectPlayAnimation("p3", "idle");
    end
end
function onUpdate()
    local curAnim = getProperty("p3.animation.name");
   if curAnim == "idle" then
    setProperty("p3.offset.x", IDLEOFFSETS[1]);
    setProperty("p3.offset.y", IDLEOFFSETS[2]);
   end
end