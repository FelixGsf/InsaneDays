package;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
class FreeplaySelectState extends FreeplayState{
    public static var freeplayCats:Array<String> = ['templatecattwo'];
    public static var curCategory:Int = 0;
	public var NameAlpha:Alphabet;
	var grpCats:FlxTypedGroup<Alphabet>;
	var curSelected:Int = 0;
	var BG:FlxSprite;
    var categoryIcon:FlxSprite;
    override function create(){
		switch (FreeplaySelectState.freeplayCats[FreeplaySelectState.curCategory].toLowerCase())
			{
				case 'templatecattwo':
					addSong('insane',5,null,FlxColor.BROWN);
			};
        BG = new FlxSprite().loadGraphic(Paths.image('menuBGBlue'));
		BG.updateHitbox();
		BG.screenCenter();
		BG.color = 0xFF00c2ff;
		add(BG);
        categoryIcon = new FlxSprite().loadGraphic(Paths.image('category/category-' + freeplayCats[curSelected].toLowerCase()));
		categoryIcon.updateHitbox();
		addSong('insane',5,null,FlxColor.BROWN);
		categoryIcon.screenCenter();
		add(categoryIcon);
        /*grpCats = new FlxTypedGroup<Alphabet>();
		add(grpCats);
        for (i in 0...freeplayCats.length)
        {
			var catsText:Alphabet = new Alphabet(0, (70 * i) + 30, freeplayCats[i], true, false);
            catsText.targetY = i;
            catsText.isMenuItem = true;
			grpCats.add(catsText);
		}*/
		NameAlpha = new Alphabet(20,(FlxG.height / 2) - 282,freeplayCats[curSelected],false);
		NameAlpha.screenCenter(X);
		Highscore.load();
		add(NameAlpha);
    }

    override public function update(elapsed:Float){
        
		if (controls.UI_LEFT_P) 
			changeSelection2(-1);
		if (controls.UI_RIGHT_P) 
			changeSelection2(1);
		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
        if (controls.ACCEPT){
            MusicBeatState.switchState(new FreeplayState());
        }

        curCategory = curSelected;
    }

    function changeSelection2(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = freeplayCats.length - 1;
		if (curSelected >= freeplayCats.length)
			curSelected = 0;

		var bullShit:Int = 0;

		/*for (item in grpCats.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;
			item.alpha = 0.6;
			if (item.targetY == 0) {
				item.alpha = 1;
			}
		}*/

		NameAlpha.destroy();
		NameAlpha = new Alphabet(20,(FlxG.height / 2) - 282,freeplayCats[curSelected],true);
		NameAlpha.screenCenter(X);
		add(NameAlpha);
		categoryIcon.loadGraphic(Paths.image('weekicons/week_icon_' + (freeplayCats[curSelected].toLowerCase())));
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}

}