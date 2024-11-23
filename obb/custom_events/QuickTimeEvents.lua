local startTime = false
local isTriangle = false
local isCircle = false
--- @param name string
--- @param value1 string
--- @param value2 string
--- @param strumTime float
function onEvent(name, value1, value2, strumTime)
    if name == "QuickTimeEvents" and value1 == "cuadrado" then
        isCircle = true;
    elseif name == "QuickTimeEvents" and value1 == "triangulo" then
        isTriangle = true
    end
    if name == "QuickTimeEvents" then
            makeLuaSprite("botton","quickTime/"..value1,350,0)
            --screenCenter("botton","x")
            setObjectCamera("botton","hud")
            addLuaSprite("botton",true)
            runTimer("die",0.50)
            scaleLuaSprite("botton", 1, 1)
        end
    end
function onUpdate()
    if isCircle == true and keyReleased('left') then
        cancelTimer("die")
        isCircle = false
        removeLuaSprite("botton")
        playSound("confirmMenu")
        triggerEvent("Play Animation", 'hey', 'bf')
    end
    if isTriangle == true and keyReleased('up') then
        cancelTimer("die")
        isTriangle = false
        removeLuaSprite("botton")
        playSound("confirmMenu")
        triggerEvent("Play Animation", 'hey', 'bf')
end
end
function onTimerCompleted(tag)
    health = getProperty("health")
    if tag == "die" then
        setProperty("health", -1)
        isCircle = false
        isTriangle = false
        playSound("cancelMenu")
    end
end