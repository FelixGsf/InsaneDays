
function onEvent(name,value1,value2)
    roles = getPropertyFromClass("ClientPrefs", "myLove")
    if roles then
    if name == "playAnim" and roles == true then
        objectPlayAnimation("felix", value1);
    end
end
end