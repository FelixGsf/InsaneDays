
local songCompleteAchievement2 = true
local songCompleteText2 = {'soy visible', 'completa esquizofrenia con \n felix siendo 100% visible', '15', '15', 'FFFFFF', 'FFFFFF'}
local songCompleteAssets2 = 'rayo'
local fcAchievement = false 
local fcAText = {'xdd', 'xdd', '25', '25', 'FFFFFF', 'FFFFFF'} 
local fcAAssets = 'SongFC'
local achievementsOnlyStoryMode = false
local canGetAchieventifScoreis0 = false
function onCreate()
         makeLuaSprite('bgAchievement2', 'achievements/bg', 0, 240)
         scaleObject('bgAchievement2', 0.75, 0.75)
         setObjectCamera('bgAchievement2', 'other')
         setProperty('bgAchievement2.alpha', 0) 
         addLuaSprite('bgAchievement2',  true)
end

   if songCompleteAchievement2 == true then
         makeLuaSprite('win44', 'achievements/'..songCompleteAssets2..'', 0, 240)
         scaleObject('win44', 0.75, 0.75)
         setObjectCamera('win44', 'other')
         setProperty('win44.alpha', 0)
         addLuaSprite('win44',  true)
		 
         makeLuaText('text55', songCompleteText2[1], 200, 120, 250)
         setTextSize('text55', songCompleteText2[3]) 
         setTextColor('text55', songCompleteText2[5])
		 setTextAlignment('text55', 'center')		 
         setObjectCamera('text55', 'other')
         setProperty('text55.alpha', 0)
         addLuaText('text55', true)

         makeLuaText('text233', songCompleteText2[2], 200, 120, 290)
         setTextSize('text233', songCompleteText2[4])
         setTextColor('text233', songCompleteText2[6])
		 setTextAlignment('text233', 'center')		 
         setObjectCamera('text233', 'other')
         setProperty('text233.alpha', 0)
         addLuaText('text233', true)
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
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'Achievement' then
	  if songCompleteAchievement2 == false and fcAchievement == false or achievementsOnlyStoryMode == true and isStoryMode == false or canGetAchieventifScoreis0 == false and score == 0 then
         runTimer('EndSong', 0.1, 1)
      end	  
	 if achievementsOnlyStoryMode == true and isStoryMode == true or achievementsOnlyStoryMode == false then --MAYBE CRASH
	  if songCompleteAchievement2 == true then 
       playSound('confirmMenu', 0.75)	  
       doTweenAlpha('bgAchievement2Visible', 'bgAchievement2', 1, 2.2, 'cubeInOut')	  
       doTweenAlpha('win1Alpha2', 'win44', 1, 2.4, 'cubeInOut')
       doTweenAlpha('text55Alpha', 'text55', 1, 2.4, 'cubeInOut')
       doTweenAlpha('text233Alpha', 'text233', 1, 2.4, 'cubeInOut')
	   runTimer('CheckAchievement', 5, 1)
	  end
	  if fcAchievement == true and songCompleteAchievement2 == false then
         runTimer('CheckAchievement', 0.1, 1)	  
	  end
	 end 
	end
	if tag == 'CheckAchievement' then
      doTweenAlpha('bgAchievement2InVisible', 'bgAchievement2', 0, 0.6, 'cubeInOut')	  
      doTweenAlpha('win1AlphaBye2', 'win44', 0, 0.4, 'cubeInOut')
      doTweenAlpha('text55AlphaBye', 'text55', 0, 0.4, 'cubeInOut')
      doTweenAlpha('text233AlphaBye', 'text233', 0, 0.4, 'cubeInOut')	
	  if fcAchievement == false or fcAchievement == true and misses > 0 then
		 runTimer('EndSong', 0.35, 1)	    
	  end
	  if fcAchievement == true and misses == 0 then	
         runTimer('AchievementB', 0.5, 1)
      end	  
	end
	if tag == 'AchievementB' then
       playSound('confirmMenu', 0.75)	  
       doTweenAlpha('bgAchievement2Visible', 'bgAchievement2', 1, 2.2, 'cubeInOut')	  
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