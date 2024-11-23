package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import charSelecotr.CharSelectorBase;
import lime.net.curl.CURLCode;
import flixel.graphics.FlxGraphic;
import WeekData;

using StringTools;

class StoryMenuState extends MusicBeatState
{
	public static var weekCompleted:Map<String, Bool> = new Map<String, Bool>();

	var scoreText:FlxText;
	public static var isSubMenu:Bool = false;
	var blackScreen:FlxSprite;

	private static var lastDifficultyName:String = '';
	var curDifficulty:Int = 1;
	private static var curSelected:Int = 0;
	var txtWeekTitle:FlxText;
	var bgSprite:FlxSprite;
	var days:FlxSprite;
	var felixMenu:FlxSprite;
	public static var curWeek:Int = 0;
	var black:FlxSprite;

	var txtTracklist:FlxText;
	var grpWeekText:FlxTypedGroup<MenuItem>;
	var grpWeekCharacters:FlxTypedGroup<MenuCharacter>;

	var grpLocks:FlxTypedGroup<FlxSprite>;
var left:FlxSprite;
var right:FlxSprite;
	var difficultySelectors:FlxGroup;
	var sprDifficulty:FlxSprite;
	var leftArrow:FlxSprite;
	var rightArrow:FlxSprite;
	var arrowUp:FlxSprite;
	var arrowDown:FlxSprite;

	var loadedWeeks:Array<WeekData> = [];

	override function create()
	{
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();

		PlayState.isStoryMode = true;
		WeekData.reloadWeekFiles(true);
		if(curWeek >= WeekData.weeksList.length) curWeek = 0;
		persistentUpdate = persistentDraw = true;

		scoreText = new FlxText(10, 660, 0, "SCORE: 49324858", 426);
		scoreText.setFormat("vcr.ttf", 52);

		txtWeekTitle = new FlxText(FlxG.width * 0.7, 10, 0, "", 32);
		txtWeekTitle.setFormat("vcr.ttf", 32, FlxColor.WHITE, RIGHT);
		//txtWeekTitle.alpha = 0.7;
		var cosa_difi = new FlxSprite(500,560).loadGraphic(Paths.image('StoryMe/coso ese de la dificultad'));
		cosa_difi.scale.x = 1.4;
		cosa_difi.scale.y = 1.4;
		arrowUp = new FlxSprite(600,20).loadGraphic(Paths.image('StoryMe/arrow R'));
		arrowUp.updateHitbox();
		arrowUp.scale.x = 0.60;
		arrowUp.scale.y = 0.60;
		arrowDown = new FlxSprite(600,400).loadGraphic(Paths.image('StoryMe/arrow L'));
		arrowDown.updateHitbox();
		arrowDown.scale.x = 0.60;
		arrowDown.scale.y = 0.60;
		left = new FlxSprite(360,560).loadGraphic(Paths.image('StoryMe/right'));
		left.updateHitbox();
		left.visible = false;
		right = new FlxSprite(860,560).loadGraphic(Paths.image('StoryMe/right'));
		right.flipX = true;
		right.scale.x = 0.80;
		right.scale.y = 0.80;
		right.updateHitbox();
		right.visible = false;
		trace("left es " + left.visible);
		left.scale.x = 0.80;
		left.scale.y = 0.80;
		arrowDown = new FlxSprite(600,400).loadGraphic(Paths.image('StoryMe/arrow L'));
		arrowDown.updateHitbox();
		arrowDown.scale.x = 0.60;
		arrowDown.scale.y = 0.60;
		var rankText:FlxText = new FlxText(0, 10);
		rankText.text = 'RANK: GREAT';
		rankText.setFormat(Paths.font("vcr.ttf"), 132);
		rankText.size = scoreText.size;
		rankText.screenCenter(X);

		var ui_tex = Paths.getSparrowAtlas('campaign_menu_UI_assets');
		var bg = new FlxSprite(0).loadGraphic(Paths.image('StoryMe/y mi corazon tucun tucun tucun'));
	bg.updateHitbox();
		bg.screenCenter();
		var weekTitle = new FlxSprite(435,470).loadGraphic(Paths.image('StoryMe/week slect box'));
	weekTitle.updateHitbox();
		bgSprite = new FlxSprite(0,105);
		bgSprite.antialiasing = ClientPrefs.globalAntialiasing;

		grpWeekText = new FlxTypedGroup<MenuItem>();

		var blackBarThingie:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, 56, FlxColor.BLACK);
		add(blackBarThingie);

		grpWeekCharacters = new FlxTypedGroup<MenuCharacter>();

		grpLocks = new FlxTypedGroup<FlxSprite>();
		add(grpLocks);
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		var num:Int = 0;
		for (i in 0...WeekData.weeksList.length)
		{
			var weekFile:WeekData = WeekData.weeksLoaded.get(WeekData.weeksList[i]);
			var isLocked:Bool = weekIsLocked(WeekData.weeksList[i]);
			if(!isLocked || !weekFile.hiddenUntilUnlocked)
			{
				loadedWeeks.push(weekFile);
				WeekData.setDirectoryFromWeek(weekFile);
				var weekThing:MenuItem = new MenuItem(-20, bgSprite.y + 420, WeekData.weeksList[i]);
				weekThing.y += ((weekThing.height + 20) * num);
				weekThing.visible = false;
				weekThing.targetY = num;
				//print()
				grpWeekText.add(weekThing);
				blackScreen = new FlxSprite(0,0).loadGraphic(Paths.image('menumod/barras'));
				blackScreen.screenCenter();
				
				//weekThing.screenCenter(X);
				weekThing.antialiasing = ClientPrefs.globalAntialiasing;
				// weekThing.updateHitbox();

				// Needs an offset thingie
				if (isLocked)
				{
					var lock:FlxSprite = new FlxSprite(weekThing.width + 10 + weekThing.x);
					lock.frames = ui_tex;
					lock.animation.addByPrefix('lock', 'lock');
					lock.animation.play('lock');
					lock.ID = i;
					lock.antialiasing = ClientPrefs.globalAntialiasing;
					grpLocks.add(lock);
				}
				num++;
			}
		}

		WeekData.setDirectoryFromWeek(loadedWeeks[0]);
		var charArray:Array<String> = loadedWeeks[0].weekCharacters;
		for (char in 0...3)
		{
			var weekCharacterThing:MenuCharacter = new MenuCharacter((FlxG.width * 0.25) * (1 + char) - 150, charArray[char]);
			weekCharacterThing.y += 70;
			grpWeekCharacters.add(weekCharacterThing);
		}

		difficultySelectors = new FlxGroup();
		

		leftArrow = new FlxSprite(grpWeekText.members[0].x + grpWeekText.members[0].width + 10, grpWeekText.members[0].y + 10);
		leftArrow.frames = ui_tex;
		leftArrow.animation.addByPrefix('idle', "arrow left");
		leftArrow.animation.addByPrefix('press', "arrow push left");
		leftArrow.visible = false;
		leftArrow.animation.play('idle');
		leftArrow.antialiasing = ClientPrefs.globalAntialiasing;
		difficultySelectors.add(leftArrow);

		CoolUtil.difficulties = CoolUtil.defaultDifficulties.copy();
		if(lastDifficultyName == '')
		{
			lastDifficultyName = CoolUtil.defaultDifficulty;
		}
		curDifficulty = Math.round(Math.max(0, CoolUtil.defaultDifficulties.indexOf(lastDifficultyName)));
		
		sprDifficulty = new FlxSprite(0, leftArrow.y);
		sprDifficulty.antialiasing = ClientPrefs.globalAntialiasing;
		difficultySelectors.add(sprDifficulty);

		rightArrow = new FlxSprite(leftArrow.x + 376, leftArrow.y);
		rightArrow.frames = ui_tex;
		rightArrow.animation.addByPrefix('idle', 'arrow right');
		rightArrow.animation.addByPrefix('press', "arrow push right", 24, false);
		rightArrow.animation.play('idle');
		rightArrow.visible = false;
		rightArrow.antialiasing = ClientPrefs.globalAntialiasing;
		difficultySelectors.add(rightArrow);
		felixMenu = new FlxSprite(30,350);
		felixMenu.flipX = true; // Voltear horizontalmente
		felixMenu.scale.y = 0.7;
		felixMenu.scale.x = 0.7;
		felixMenu.frames = Paths.getSparrowAtlas('menumod/felixStory');

		//logoB.antialiasing = ClientPrefs.globalAntialiasing;
		felixMenu.animation.addByPrefix('idle', 'idle', 24, false);
		felixMenu.animation.play('idle');
		felixMenu.updateHitbox();
	
		days = new FlxSprite(90,450);
		days.scale.y = 1.3;
		days.scale.x = 1.3;
		days.frames = Paths.getSparrowAtlas('menumod/storymenu/days');
	   days.animation.addByIndices('day0',"idle",[0], "", 24, false);
		days.animation.addByIndices('day1',"idle",[1], "", 24, false);
		days.animation.addByIndices('day2',"idle",[2], "", 24, false);
		days.animation.addByIndices('day3',"idle",[3], "", 24, false);
		days.animation.addByIndices('day4',"idle",[4], "", 24, false);
		days.animation.addByIndices('day5',"idle",[5], "", 24, false);
		days.animation.addByIndices('day5M',"idle",[6], "", 24, false);
		days.animation.addByIndices('day6',"idle",[7], "", 24, false);
		days.animation.addByIndices('day7',"idle",[8], "", 24, false);
		days.animation.addByIndices('day9',"idle",[9], "", 24, false);
		days.animation.addByIndices('day10',"idle",[10], "", 24, false);
		days.animation.addByIndices('day11',"idle",[11], "", 24, false);
		days.animation.addByIndices('day12',"idle",[12], "", 24, false);
		days.animation.addByIndices('day13',"idle",[13], "", 24, false);
	    days.animation.addByIndices('day14',"idle",[14], "", 24, false);
		days.animation.addByIndices('day15',"idle",[15], "", 24, false);
		days.animation.addByIndices('day16',"idle",[16], "", 24, false);
		days.animation.play('day0');

		//bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);
		add(bgSprite);
		add(blackScreen);
		add(cosa_difi);
		add(grpWeekCharacters);
		add(weekTitle);
		add(arrowUp);
		add(arrowDown);
		add(left);
		add(right);
		add(grpWeekText);
		add(difficultySelectors);
		var tracksSprite:FlxSprite = new FlxSprite(FlxG.width * 0.07, bgSprite.y + 250).loadGraphic(Paths.image('Menu_Tracks'));
		tracksSprite.antialiasing = ClientPrefs.globalAntialiasing;
		add(tracksSprite);



		txtTracklist = new FlxText(FlxG.width * 0.05, tracksSprite.y + 60, 0, "", 32);
		txtTracklist.alignment = CENTER;
		txtTracklist.font = rankText.font;
		txtTracklist.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1.6, 1);
		txtTracklist.color = 0xffffffff;
		add(txtTracklist);
		// add(rankText);
		add(scoreText);
		add(txtWeekTitle);
		
		changeWeek();
		changeDifficulty();

		super.create();
	}

	override function closeSubState() {
		persistentUpdate = true;
		changeWeek();
		super.closeSubState();
	}

	override function update(elapsed:Float)
	{
		// scoreText.setFormat('VCR OSD Mono', 32);
		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, CoolUtil.boundTo(elapsed * 30, 0, 1)));
		if(Math.abs(intendedScore - lerpScore) < 10) lerpScore = intendedScore;

		scoreText.text = "WEEK SCORE:" + lerpScore;

		// FlxG.watch.addQuick('font', scoreText.font);
felixMenu.animation.play('idle');
var ctrl = FlxG.keys.justPressed.CONTROL;

		if (!movedBack && !selectedWeek)
		{
			var upP = controls.UI_UP_P;
			var downP = controls.UI_DOWN_P;
			if (upP)
			{
				changeWeek(-1);
				FlxG.sound.play(Paths.sound('scrollMenu'));
				arrowUp.scale.x = 1;
			}
			else
				{
					arrowUp.scale.x = 0.80;
					arrowUp.scale.y = 0.80;
				}
			if (downP)
			{
				changeWeek(1);
				FlxG.sound.play(Paths.sound('scrollMenu'));
				arrowDown.scale.x = 1;
					arrowDown.scale.y = 1;
			}
             else
				{
					arrowDown.scale.x = 0.80;
					arrowDown.scale.y = 0.80;
				}
			if(FlxG.mouse.wheel != 0)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
				changeWeek(-FlxG.mouse.wheel);
				changeDifficulty();
			}
			if (controls.UI_RIGHT){
				leftArrow.animation.play('press');
				right.scale.x = 1;
				right.scale.y = 1;
			}
			else
				{
					right.scale.x = 0.80;
					right.scale.y = 0.80;

				}
			if (controls.UI_LEFT){
				leftArrow.animation.play('press');
				left.scale.x = 1;
				left.scale.y = 1;
			}
			else{
				leftArrow.animation.play('idle');
				left.scale.x = 0.80;
				left.scale.y = 0.80;
			}
			if (controls.UI_RIGHT_P)
				changeDifficulty(1);
			else if (controls.UI_LEFT_P)
				changeDifficulty(-1);
			else if (upP || downP)
				changeDifficulty();

			if(FlxG.keys.justPressed.CONTROL)
			{
				persistentUpdate = false;
				openSubState(new LoreModSubState());
			}
			else if(controls.RESET)
			{
				persistentUpdate = false;
				openSubState(new ResetScoreSubState('', curDifficulty, '', curWeek));
				//FlxG.sound.play(Paths.sound('scrollMenu'));
			}
			else if (FlxG.keys.justPressed.ENTER)
			{

				FlxG.camera.flash(ClientPrefs.flashing ? FlxColor.WHITE : 0xF3F3F3, 1);
				selectWeek();
			}
		}


		if (FlxG.keys.justPressed.ESCAPE && !movedBack && !selectedWeek)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
	
		super.update(elapsed);

		grpLocks.forEach(function(lock:FlxSprite)
		{
			lock.y = grpWeekText.members[lock.ID].y;
			lock.visible = (lock.y > FlxG.height / 2);
		});
	
}
	var movedBack:Bool = false;
	var selectedWeek:Bool = false;
	var stopspamming:Bool = false;

	function selectWeek()
	{
		if (!weekIsLocked(loadedWeeks[curWeek].fileName))
		{
			if (stopspamming == false)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));

				grpWeekText.members[curWeek].startFlashing();

				for (char in grpWeekCharacters.members)
				{
					if (char.character != '' && char.hasConfirmAnimation)
					{
						char.animation.play('confirm');
					}
				}
				stopspamming = true;
			}

			// We can't use Dynamic Array .copy() because that crashes HTML5, here's a workaround.
			var songArray:Array<String> = [];
			var leWeek:Array<Dynamic> = loadedWeeks[curWeek].songs;
			for (i in 0...leWeek.length) {
				songArray.push(leWeek[i][0]);
			}

			// Nevermind that's stupid lmao
			PlayState.storyPlaylist = songArray;
			PlayState.isStoryMode = true;
			selectedWeek = true;

			var diffic = CoolUtil.getDifficultyFilePath(curDifficulty);
			if(diffic == null) diffic = '';

			PlayState.storyDifficulty = curDifficulty;

			PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
			PlayState.campaignScore = 0;
			PlayState.campaignMisses = 0;
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				LoadingState.loadAndSwitchState(new PlayState(), true);
				FreeplayState.destroyFreeplayVocals();
			});
		} else {
			FlxG.sound.play(Paths.sound('cancelMenu'));
		}
	}

	var tweenDifficulty:FlxTween;
	function changeDifficulty(change:Int = 0):Void
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = CoolUtil.difficulties.length-1;
		if (curDifficulty >= CoolUtil.difficulties.length)
			curDifficulty = 0;
		

		WeekData.setDirectoryFromWeek(loadedWeeks[curWeek]);

		var diff:String = CoolUtil.difficulties[curDifficulty];
		var newImage:FlxGraphic = Paths.image('menudifficulties/' + Paths.formatToSongPath(diff));
		//trace(Paths.currentModDirectory + ', menudifficulties/' + Paths.formatToSongPath(diff));
		
		if(sprDifficulty.graphic != newImage)
		{
			sprDifficulty.loadGraphic(newImage);
			sprDifficulty.x = leftArrow.x + 60;
			sprDifficulty.x += (308 - sprDifficulty.width) / 3;
			sprDifficulty.alpha = 0;
			sprDifficulty.y = leftArrow.y - 15;

			if(tweenDifficulty != null) tweenDifficulty.cancel();
			tweenDifficulty = FlxTween.tween(sprDifficulty, {y: leftArrow.y + 15, alpha: 1}, 0.07, {onComplete: function(twn:FlxTween)
			{
				tweenDifficulty = null;
			}});
		}
		lastDifficultyName = diff;

		#if !switch
		intendedScore = Highscore.getWeekScore(loadedWeeks[curWeek].fileName, curDifficulty);
		#end
	}

	var lerpScore:Int = 0;
	var intendedScore:Int = 0;

	function changeWeek(change:Int = 0):Void
	{
		curWeek += change;

		if (curWeek >= loadedWeeks.length)
			curWeek = 0;
		if (curWeek < 0)
			curWeek = loadedWeeks.length - 1;
		switch (curWeek)
		{

			case 0:
			days.animation.play('day0');
			case 1:
			days.animation.play('day1');
			case 2:
			days.animation.play('day2');
			left.visible = false;
			right.visible = false;
			case 3:
			days.animation.play('day3');
			left.visible = true;
			right.visible = true;
			case 4:
				days.animation.play('day4');
				left.visible = false;
				right.visible = false;
				case 5:
				days.animation.play('day5');
				case 6: 
				days.animation.play('day5M');//darkangel diff "false"
				left.visible = false;
				right.visible = false;
				case 7://darkangel diff "true"
				days.animation.play('day6');
				left.visible = true;
				right.visible = true;
				case 8:
					
				days.animation.play('day7');//darkangel diff "false"
				left.visible = false;
				right.visible = false;
				case 9:
					left.visible = false;
					right.visible = false;
				case 10:
					left.visible = true;
					right.visible = true;
				case 11:
				left.visible = false;
					right.visible = false;
							
		}


		var leWeek:WeekData = loadedWeeks[curWeek];
		WeekData.setDirectoryFromWeek(leWeek);

		var leName:String = leWeek.storyName;
		txtWeekTitle.text = leName.toUpperCase();
		txtWeekTitle.x = FlxG.width - (txtWeekTitle.width + 10);

		var bullShit:Int = 0;

		var unlocked:Bool = !weekIsLocked(leWeek.fileName);
		for (item in grpWeekText.members)
		{
			item.targetY = bullShit - curWeek;
			if (item.targetY == Std.int(0) && unlocked)
				item.alpha = 1;
			else
				item.alpha = 0;
			bullShit++;
		}

		bgSprite.visible = true;
		var assetName:String = leWeek.weekBackground;
		if(assetName == null || assetName.length < 1) {
			bgSprite.visible = false;
		} else {
			//bgSprite.frames = Paths.getSparrowAtlas('menubackgrounds/menu_' + assetName);
			//bgSprite.animation.addByPrefix("idle",assetName + "_idle",24,true);
			bgSprite.loadGraphic(Paths.image('menubackgrounds/menu_' + assetName));
		}
		PlayState.storyWeek = curWeek;

		CoolUtil.difficulties = CoolUtil.defaultDifficulties.copy();
		var diffStr:String = WeekData.getCurrentWeek().difficulties;
		if(diffStr != null) diffStr = diffStr.trim(); //Fuck you HTML5
		difficultySelectors.visible = unlocked;

		if(diffStr != null && diffStr.length > 0)
		{
			var diffs:Array<String> = diffStr.split(',');
			var i:Int = diffs.length - 1;
			while (i > 0)
			{
				if(diffs[i] != null)
				{
					diffs[i] = diffs[i].trim();
					if(diffs[i].length < 1) diffs.remove(diffs[i]);
				}
				--i;
			}

			if(diffs.length > 0 && diffs[0].length > 0)
			{
				CoolUtil.difficulties = diffs;
			}
		}
		
		if(CoolUtil.difficulties.contains(CoolUtil.defaultDifficulty))
		{
			curDifficulty = Math.round(Math.max(0, CoolUtil.defaultDifficulties.indexOf(CoolUtil.defaultDifficulty)));
		}
		else
		{
			curDifficulty = 0;
		}

		var newPos:Int = CoolUtil.difficulties.indexOf(lastDifficultyName);
		//trace('Pos of ' + lastDifficultyName + ' is ' + newPos);
		if(newPos > -1)
		{
			curDifficulty = newPos;
		}
		updateText();
	}

	function weekIsLocked(name:String):Bool {
		var leWeek:WeekData = WeekData.weeksLoaded.get(name);
		return (!leWeek.startUnlocked && leWeek.weekBefore.length > 0 && (!weekCompleted.exists(leWeek.weekBefore) || !weekCompleted.get(leWeek.weekBefore)));
	}
	public static function isWeekCompleted(name:String):Bool {
        return weekCompleted.exists(name) && weekCompleted.get(name);
    }

	function updateText()
	{
		var weekArray:Array<String> = loadedWeeks[curWeek].weekCharacters;
		for (i in 0...grpWeekCharacters.length) {
			grpWeekCharacters.members[i].changeCharacter(weekArray[i]);
		}

		var leWeek:WeekData = loadedWeeks[curWeek];
		var stringThing:Array<String> = [];
		for (i in 0...leWeek.songs.length) {
			stringThing.push(leWeek.songs[i][0]);
		}

		txtTracklist.text = '';
		for (i in 0...stringThing.length)
		{
			txtTracklist.text += stringThing[i] + '\n';
		}

		txtTracklist.text = txtTracklist.text.toUpperCase();

		txtTracklist.screenCenter(X);
		txtTracklist.x -= FlxG.width * 0.35;

		#if !switch
		intendedScore = Highscore.getWeekScore(loadedWeeks[curWeek].fileName, curDifficulty);
		#end
		
	}
	
}