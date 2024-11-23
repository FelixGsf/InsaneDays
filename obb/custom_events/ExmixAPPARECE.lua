function onEvent(name,value1,value2)
    if name == "ExmixAPPARECE" then
makeAnimatedLuaSprite('exmix','BackGrounds/W10/images/Amenaza',1200,900)
addAnimationByPrefix('exmix','idle','Exmix',24,true)
addLuaSprite('exmix',false)
addLuaSprite('bom', false);
setObjectOrder('exmix', getObjectOrder('bom')+ 0) 
   
end
end