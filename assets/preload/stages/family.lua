
function onCreate()
	-- background shit

	makeLuaSprite('bg', 'BackGrounds/W5/images/mallP', -510, -400);
	addLuaSprite('bg', false);
	setGraphicSize('bg', getProperty('bg.width') * 1.1)
makeAnimatedLuaSprite('person', 'BackGrounds/W5/images/random', 2100, 350);
addAnimationByPrefix('person','idle','santa idle in fear',24,true)
	addLuaSprite('person', false);
	setGraphicSize('person', getProperty('person.width') * 0.9)

makeAnimatedLuaSprite('cameos', 'BackGrounds/W5/images/cameos', -400, 700);
addAnimationByPrefix('cameos', 'idle', 'Idle', 24, true)
--objectPlayAnimation("cameos", "idle")
setObjectOrder('cameos', 50)
	addLuaSprite('cameos', true);
  scaleObject('cameos',1.4,1)
if songName == "dad rap" then
	makeLuaSprite("lights","BackGrounds/W5/images/stagecurtains",0,0);
	addLuaSprite("lights",true)
	setObjectOrder("lights", getObjectOrder('cameos')-1)
end
end
function onBeatHit()
	if curBeat % 2 == 0 then
	objectPlayAnimation('exmix', 'idle', false);
	objectPlayAnimation('cameos', 'idle', false);
	objectPlayAnimation('random', 'idle', false);
   
	end
end
function onCreatePost()
	if gfName == 'mariSuit' then
		setProperty("gf.y", 450)
		setProperty("gf.x", 1650)
    end
	if gfName == 'felixSpeakersSuit' then
		setProperty("gf.y", 520)
		setProperty("boyfriend.x", 1820)
		setProperty("boyfriend.y", 620)
		setProperty("gf.x", 1450)
	end
	if boyfriendName == "rayo-player" then
		setProperty("boyfriend.x", getProperty("boyfriend.x") -270)
		setProperty("gf.y", getProperty("gf.y")-120)
		setProperty("boyfriend.cameraPosition[1]", 0)
	elseif boyfriendName == "sisterPlayable" then
		setProperty("boyfriend.y", getProperty("boyfriend.y")+50)
	end
end
function onStartCountdown()
	if boyfriendName == "rayo-player" then
		setProperty("boyfriend.cameraPosition[0]", getProperty("boyfriend.cameraPosition[0]")+ 50)
	end
end