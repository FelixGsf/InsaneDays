
local songCompleteAchievement = true
local songCompleteText = {'Tal y como Un minion', 'Completa la week14', '15', '15', 'FFFFFF', 'FFFFFF'}
local songCompleteAssets = 'isaBm'
local fcAchievement = false 
local fcAText = {'xdd', 'xdd', '25', '25', 'FFFFFF', 'FFFFFF'} 
local fcAAssets = 'SongFC'

local achievementsOnlyStoryMode = true
local canGetAchieventifScoreis0 = false

function onCreate()

         makeLuaSprite('bgAchievement', 'achievements/bg', 0, 40)
         scaleObject('bgAchievement', 0.75, 0.75)
         setObjectCamera('bgAchievement', 'other')
         setProperty('bgAchievement.alpha', 0) 
         addLuaSprite('bgAchievement',  true)

   if songCompleteAchievement == true then
         makeLuaSprite('winA', 'achievements/'..songCompleteAssets..'', 0, 40)
         scaleObject('winA', 0.75, 0.75)
         setObjectCamera('winA', 'other')
         setProperty('winA.alpha', 0)
         addLuaSprite('winA',  true)
		 
         makeLuaText('text1A', songCompleteText[1], 200, 120, 50)
         setTextSize('text1A', songCompleteText[3]) 
         setTextColor('text1A', songCompleteText[5])
		 setTextAlignment('text1A', 'center')		 
         setObjectCamera('text1A', 'other')
         setProperty('text1A.alpha', 0)
         addLuaText('text1A', true)

         makeLuaText('text2A', songCompleteText[2], 200, 120, 90)
         setTextSize('text2A', songCompleteText[4])
         setTextColor('text2A', songCompleteText[6])
		 setTextAlignment('text2A', 'center')		 
         setObjectCamera('text2A', 'other')
         setProperty('text2A.alpha', 0)
         addLuaText('text2A', true)
	end	 
   if fcAchievement == true then
         makeLuaSprite('winB', 'achievements/'..fcAAssets..'', 0, 40)
         scaleObject('winB', 0.75, 0.75)
         setObjectCamera('winB', 'other')
         setProperty('winB.alpha', 0)
         addLuaSprite('winB',  true)
		 
         makeLuaText('text1B', fcAText[1], 200, 120, 50)
         setTextSize('text1B', fcAText[3])
         setTextColor('text1B', fcAText[5]) 
		 setTextAlignment('text1B', 'center')		 
         setObjectCamera('text1B', 'other')
         setProperty('text1B.alpha', 0)
         addLuaText('text1B', true)

         makeLuaText('text2B', fcAText[2], 200, 120, 90)
         setTextSize('text2B', fcAText[4])
         setTextColor('text2B', fcAText[6])
		 setTextAlignment('text2B', 'center')		 
         setObjectCamera('text2B', 'other')
         setProperty('text2B.alpha', 0)
         addLuaText('text2B', true)
	end	 	
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'Achievement' then
	  if songCompleteAchievement == false and fcAchievement == false or achievementsOnlyStoryMode == true and isStoryMode == false or canGetAchieventifScoreis0 == false and score == 0 then
         runTimer('EndSong', 0.1, 1)
      end	  
	 if achievementsOnlyStoryMode == true and isStoryMode == true or achievementsOnlyStoryMode == false then --MAYBE CRASH
	  if songCompleteAchievement == true then 
       playSound('confirmMenu', 0.75)	  
       doTweenAlpha('bgAchievementVisible', 'bgAchievement', 1, 2.2, 'cubeInOut')	  
       doTweenAlpha('win1Alpha', 'winA', 1, 2.4, 'cubeInOut')
       doTweenAlpha('text1AAlpha', 'text1A', 1, 2.4, 'cubeInOut')
       doTweenAlpha('text2AAlpha', 'text2A', 1, 2.4, 'cubeInOut')
	   runTimer('CheckAchievement', 5, 1)
	  end
	  if fcAchievement == true and songCompleteAchievement == false then
         runTimer('CheckAchievement', 0.1, 1)	  
	  end
	 end 
	end
	if tag == 'CheckAchievement' then
      doTweenAlpha('bgAchievementInVisible', 'bgAchievement', 0, 0.6, 'cubeInOut')	  
      doTweenAlpha('win1AlphaBye', 'winA', 0, 0.4, 'cubeInOut')
      doTweenAlpha('text1AAlphaBye', 'text1A', 0, 0.4, 'cubeInOut')
      doTweenAlpha('text2AAlphaBye', 'text2A', 0, 0.4, 'cubeInOut')	
	  if fcAchievement == false or fcAchievement == true and misses > 0 then
		 runTimer('EndSong', 0.35, 1)	    
	  end
	  if fcAchievement == true and misses == 0 then	
         runTimer('AchievementB', 0.5, 1)
      end	  
	end
	if tag == 'AchievementB' then
       playSound('confirmMenu', 0.75)	  
       doTweenAlpha('bgAchievementVisible', 'bgAchievement', 1, 2.2, 'cubeInOut')	  
       doTweenAlpha('winBAlpha', 'winB', 1, 2.4, 'cubeInOut')
       doTweenAlpha('text1BAlpha', 'text1B', 1, 2.4, 'cubeInOut')
       doTweenAlpha('text2BAlpha', 'text2B', 1, 2.4, 'cubeInOut')	
	   runTimer('EndSong', 5, 1)	   
	end
	if tag == 'EndSong' then
	allowend = true
	--endSong()
	end
end

function onEndSong()
     if not allowend then
         runTimer('Achievement', 0.01, 1)
        return Function_Stop
     end

end