function onCreate()
makeLuaSprite('bg','FamilyConflict/christmasWall',-1000,-700);
makeLuaSprite('walls','FamilyConflict/bgWalls',-450,-300);
makeAnimatedLuaSprite('escaleras','FamilyConflict/bgEscalator',200,0);
addAnimationByPrefix('escaleras','idle','esc',1,true);
makeAnimatedLuaSprite('bop','FamilyConflict/upperBop',200,0);
addAnimationByPrefix('bop','idle','Upper Crowd Bob instance',24,true);
makeLuaSprite('fg','FamilyConflict/fgSnow',-300,950);
makeLuaSprite('treet','FamilyConflict/christmasTree',1050,0)
makeAnimatedLuaSprite('crow','FamilyConflict/bottomBop',400,500);
addAnimationByPrefix('crow','idle','Bottom Level Boppers Idle',24,true);


addLuaSprite('bg')
scaleObject('bg',2,2)
addLuaSprite('walls')
addLuaSprite('bop')
setScrollFactor('bop',1.2,1)
addLuaSprite('escaleras')
setScrollFactor('escaleras',1.2,1)
addLuaSprite('treet')
setScrollFactor('treet',0.9,1)
addLuaSprite('fg')
scaleObject('fg',2,3)
addLuaSprite('crow')
end
function onUpdate()
    ObjectPlayAnimation('escaleras','idle',true)
    ObjectPlayAnimation('bop','idle',true)
    ObjectPlayAnimation('Crow','idle',true)
end



