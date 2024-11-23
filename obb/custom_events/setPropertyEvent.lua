
function onEvent(name, value1, value2)
    if name == 'setPropertyEvent' then
    setProperty("IconDuo.visible", true)
    end
    if name == 'setPropertyEvent' then
    if songName == 'Otaku' then
        setProperty('fire.visible', true)
        setProperty('fire2.visible', true)
        setProperty('boyfriend.color', getColorFromHex('FF8B49'));
    setProperty('dad.color', getColorFromHex('FF8B49'));
    setProperty('gf.color', getColorFromHex('FF8B49'));
    setProperty('boyfriend.color', getColorFromHex('FF8B49'));
    setProperty('walls.color', getColorFromHex('FF8B49'));
    setProperty('floor.color', getColorFromHex('D36A2E'));
    setProperty('bom.color', getColorFromHex('D36A2E'));
    setProperty('boxes.color', getColorFromHex('D36A2E'));
    end
    --setPropertyFromClass("bla", "", nil)
end 
    
end