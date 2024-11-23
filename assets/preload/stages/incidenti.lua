function onCreate()

  
	makeLuaSprite('BB1', 'BB1', -650, -160);
	addLuaSprite('BB1', 'BB1', -500, -160);
    scaleObject('BB1', 1.2, 1)  

    makeLuaSprite('box', 'box', -500, 800);
addLuaSprite('box', true);
scaleObject('box', 1.1, 1.1)
setScrollFactor ('box', 1.1, 1.1)

    makeLuaSprite('vig', 'vignette', 0, 0);
    	setObjectCamera('vig', 'camhud');
    addLuaSprite('vig', true);
    scaleObject('vig', 1, 1)    

end 
function onEvent(name,value1,value2)
	if name == 'Play Animation' then 

			if value1 == 'tf' then

            setProperty('blue.visible', false);
            setProperty('red.visible', false);
            setProperty('BB1.visible', false);
			setProperty('noise.visible', true);
	end	
				if value1 == 'red' then

            setProperty('blue.visible', false);
            setProperty('red.visible', true);
            setProperty('BB1.visible', false);
			setProperty('noise.visible', false);
	end	
					if value1 == 'blue' then

            setProperty('blue.visible', true);
            setProperty('red.visible', false);
            setProperty('BB1.visible', false);
			setProperty('noise.visible', false);
	end	

                    if value1 == 'nada' then

            setProperty('blue.visible', false);
            setProperty('red.visible', false);
            setProperty('BB1.visible', false);
            setProperty('noise.visible', false);
            triggerEvent('Change Character', 'dad', 'no');
            triggerEvent('Change Character', 'gf', 'no');                                      
    end 
 

		if value1 == 'normal' then

            setProperty('blue.visible', false);
            setProperty('red.visible', false);
            setProperty('BB1.visible', true);
			setProperty('noise.visible', false);					
		end
	end
end
