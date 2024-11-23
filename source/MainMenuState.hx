package;
import subsFreePlays.MariFP;
import subsFreePlays.RayoFreePlay;
import charSelecotr.CharSelectorBase;
import flixel.text.FlxText;
import Discord.DiscordClient;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import options.OptionsState;
import flixel.group.FlxSpriteGroup;
import flixel.addons.transition.FlxTransitionableState;
import flixel.text.FlxText.FlxTextBorderStyle;
class MainMenuState extends MusicBeatState {
    var menuAssets:FlxSpriteGroup;
    var optionText:FlxText;
    public static var insaneVersion:String = '3.4F';
    var bg:FlxSprite;
   // var bg:FlxSprite;
    var objects:Array<String> = ['addons', 'options', 'storymode', 'gallery', 'freeplay','modLib','credits'];
    var gotoState:FlxTimer;
    var speed:Int = 0;
    var value:Int = 0;
    var xy:Bool = false;
    var selected:Bool = false;
    var barras:FlxSprite;
    var marco:FlxSprite;
    var marcoBG:FlxSprite;
    override function create() {
        #if MODS_ALLOWED
		Paths.pushGlobalMods();
		#end
		WeekData.loadTheFirstEnabledMod();

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
        gotoState = new FlxTimer();
        FlxG.mouse.visible = true;
        menuAssets = new FlxSpriteGroup();
        bg = new FlxSprite(0, 0).loadGraphic(Paths.image('grad'));
        add(bg);
        marcoBG = new FlxSprite(0,0).loadGraphic(Paths.image('menumod/mainmenu/marcoBG'));
        add(marcoBG);
        for (i in 0...objects.length) {
            var drawImages:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('menumod/mainmenu/' + objects[i]));
            drawImages.ID = i;
            add(drawImages);
            menuAssets.add(drawImages);
        }
        // Crear y añadir el texto para mostrar la opción seleccionada 
      marco = new FlxSprite(0,0).loadGraphic(Paths.image('menumod/mainmenu/marco'));
      add(marco);
        optionText = new FlxText(0, FlxG.height - 700, FlxG.width, "", 40); 
        optionText.setFormat(Paths.font('vcr.ttf'), 40, 0xFFFFFFFF, "center"); 
        optionText.setBorderStyle(FlxTextBorderStyle.OUTLINE,FlxColor.BLACK,5);
        add(optionText);
        // sprite position:

        //addons:
        menuAssets.members[0].x = 334;
        menuAssets.members[0].y = 507;
       
        //storymode_position:
        menuAssets.members[2].y += 50;
        menuAssets.members[2].x = 660;
        menuAssets.members[2].scale.set(1.026,1.03);
        //gallery:
        menuAssets.members[3].y = 284;
        menuAssets.members[3].x = 332;
        //options:
        menuAssets.members[1].y = 283;
        menuAssets.members[1].x = 104;
        //downloadList:
        menuAssets.members[5].x = 653;
        menuAssets.members[5].y = 508;
        //downloadList:
         menuAssets.members[6].x = 104;
         menuAssets.members[6].y = 508;
        //free
        menuAssets.members[4].y = 48;
        menuAssets.members[4].x = 104;

var version:String = "INSANE DAYS: " + MainMenuState.insaneVersion;
var engineVersion:String = "PSYCH ENGINE: 0.6.3";
var totalText:FlxText = new FlxText(560,0,FlxG.width, version+"\n"+engineVersion,10);
totalText.setFormat(null, 10, 0xFFFFFFFF, "center");
add(totalText); 


        super.create();
    }
        override function update(elapsed:Float) {
            super.update(elapsed);
/**if (FlxG.keys.justPressed.LEFT){
    moveWithArrow(value,speed,false);
}
if (FlxG.keys.justPressed.RIGHT){
    moveWithArrow(value,-speed,false);
}
if (FlxG.keys.justPressed.UP){
    moveWithArrow(value,-speed,xy);
}
if (FlxG.keys.justPressed.DOWN){
    moveWithArrow(value,speed,xy);
}/*/
            if (FlxG.keys.justReleased.SEVEN){
                MusicBeatState.switchState(new editors.MasterEditorMenu());
            }
            if (FlxG.keys.justReleased.CONTROL){
                openSubState(new GameplayChangersSubstate());
            }
            if (FlxG.keys.justPressed.ESCAPE){
                MusicBeatState.switchState(new TitleState());
            }
            /**
            if (FlxG.keys.justPressed.I){
speed += 1;
            }
            else if (FlxG.keys.justPressed.K){
                speed -= 1;  
            }
            if (value >= menuAssets.length){
                value = 0;
            }
            else if (value < 0){
                value = menuAssets.length;
            }
            if (FlxG.keys.justPressed.L){
value += 1;
            }
            else if (FlxG.keys.justPressed.J){
                value -= 1;
            }
            if (xy == false && FlxG.keys.justPressed.V){
                xy = true;
            }
            else if (xy == true && FlxG.keys.justPressed.F ){
                xy = false;
            }*/
            for (sprite in menuAssets.members) {
                if (sprite.overlapsPoint(FlxG.mouse.getWorldPosition())) {
                    var selectedOption:String = objects[sprite.ID];
                    if (!selected){ 
                        optionText.text = selectedOption;
                    }
                    if (!selected && FlxG.mouse.justPressed) {
                        selected = true;
                        FlxG.mouse.visible = false;
                        FlxTween.tween(optionText,{color:FlxColor.fromString("#3ff0ff")},0.2);
                        switch (sprite.ID) {  // Usa el identificador para determinar la acción
                            case 2:
                                FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
                                FlxTween.tween(menuAssets.members[0],{alpha:0},0.2);
                                FlxTween.tween(menuAssets.members[1],{alpha:0},0.2);
                                FlxTween.tween(menuAssets.members[3],{alpha:0},0.2);
                                FlxTween.tween(menuAssets.members[4],{alpha:0},0.2);
                                FlxTween.tween(menuAssets.members[5],{alpha:0},0.2);
                                FlxTween.tween(menuAssets.members[6],{alpha:0},0.2);
                                gotoState.start(1.7, function(a:FlxTimer):Void {
                                    MusicBeatState.switchState(new StoryMenuState());
                                });
                            case 4:
    FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
   FlxTween.tween(menuAssets.members[0],{alpha:0},0.2);
         FlxTween.tween(menuAssets.members[1],{alpha:0},0.2);
       FlxTween.tween(menuAssets.members[2],{alpha:0},0.2);
   FlxTween.tween(menuAssets.members[3],{alpha:0},0.2);
     FlxTween.tween(menuAssets.members[5],{alpha:0},0.2);
  FlxTween.tween(menuAssets.members[6],{alpha:0},0.2);
     gotoState.start(1.7, function(a:FlxTimer):Void {
                                   
                                    if (CharSelectorBase.isFelixFree == true){
           MusicBeatState.switchState(new FreeplayState());
                                    }
                                    else if (CharSelectorBase.isRayoFree == true){
                  MusicBeatState.switchState(new RayoFreePlay());
 //FlxG.sound.playMusic(Paths.music('freeTheme'));
                                    }
                                    else if (CharSelectorBase.isMariFree == true){
        MusicBeatState.switchState(new MariFP());
		//	FlxG.sound.playMusic(Paths.music('freeTheme'));
                                    }
                                   
                                });
                            case 1:
    FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
       FlxTween.tween(menuAssets.members[0],{alpha:0},0.2);
        FlxTween.tween(menuAssets.members[2],{alpha:0},0.2);
   FlxTween.tween(menuAssets.members[3],{alpha:0},0.2);
    FlxTween.tween(menuAssets.members[5],{alpha:0},0.2);
     FlxTween.tween(menuAssets.members[4],{alpha:0},0.2);
         FlxTween.tween(menuAssets.members[6],{alpha:0},0.2);
       OptionsState.onPlayState = false;
       gotoState.start(1.7, function(a:FlxTimer):Void {
     MusicBeatState.switchState(new options.OptionsState());
                                });
                            case 0:
                                FlxTween.tween(menuAssets.members[1],{alpha:0},0.2);
                                FlxTween.tween(menuAssets.members[2],{alpha:0},0.2);
                                FlxTween.tween(menuAssets.members[3],{alpha:0},0.2);
                                FlxTween.tween(menuAssets.members[4],{alpha:0},0.2);
                                FlxTween.tween(menuAssets.members[5],{alpha:0},0.2);
                                FlxTween.tween(menuAssets.members[6],{alpha:0},0.2);
                                    FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
                                    gotoState.start(1.7, function(a:FlxTimer):Void {
                                        MusicBeatState.switchState(new ModsMenuState());
                                    });
                            case 3:
                                FlxTween.tween(menuAssets.members[0],{alpha:0},0.2);
                                FlxTween.tween(menuAssets.members[1],{alpha:0},0.2);
                                FlxTween.tween(menuAssets.members[2],{alpha:0},0.2);
                                FlxTween.tween(menuAssets.members[4],{alpha:0},0.2);
                                FlxTween.tween(menuAssets.members[5],{alpha:0},0.2);
                                FlxTween.tween(menuAssets.members[6],{alpha:0},0.2);
                             FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
                            gotoState.start(1.7, function(a:FlxTimer):Void {
                             MusicBeatState.switchState(new GalleryState());
                                        });
                            case 5:
              FlxTween.tween(menuAssets.members[0],{alpha:0},0.2);
        FlxTween.tween(menuAssets.members[1],{alpha:0},0.2);
         FlxTween.tween(menuAssets.members[2],{alpha:0},0.2);
         FlxTween.tween(menuAssets.members[3],{alpha:0},0.2);
        FlxTween.tween(menuAssets.members[4],{alpha:0},0.2);
         FlxTween.tween(menuAssets.members[6],{alpha:0},0.2);
        FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
         gotoState.start(1.7, function(a:FlxTimer):Void {
           MusicBeatState.switchState(new DownloadModsState());
                                                    });
             case 6:
              FlxTween.tween(menuAssets.members[0],{alpha:0},0.2);
            FlxTween.tween(menuAssets.members[1],{alpha:0},0.2);
            FlxTween.tween(menuAssets.members[2],{alpha:0},0.2);
             FlxTween.tween(menuAssets.members[3],{alpha:0},0.2);
               FlxTween.tween(menuAssets.members[4],{alpha:0},0.2);
               FlxTween.tween(menuAssets.members[5],{alpha:0},0.2);
                 FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
                 gotoState.start(1.7, function(a:FlxTimer):Void
                     {
                        
                  MusicBeatState.switchState(new CreditsState());
                      });
                        }
                    }
                }
            }
    }
}
 /*  function moveWithArrow(value:Int,speed:Int,upAndDown:Bool = false){ esto lo use para ubicar las imagenes del menu XD
        if (upAndDown == false){
        if (value == 1){
menuAssets.members[1].x += speed;
trace('value1.x: ' +  menuAssets.members[1].x);

        }
        else if (value == 2 ){
        menuAssets.members[2].x += speed;
        trace('value2.x: ' +  menuAssets.members[2].x );
        }
        else if (value == 3 ){
         menuAssets.members[3].x += speed;
         trace('value3.x: ' +  menuAssets.members[3].x );
    }
    else if (value == 4){
        menuAssets.members[4].x += speed;
        trace('value4.x: ' +  menuAssets.members[4].x );
   }
   else if (value == 5 ){
    menuAssets.members[5].x += speed;
    trace('value5.x: ' +  menuAssets.members[5].x );
}
else if (value == 6 ){
    menuAssets.members[6].x += speed;
    trace('value6.x: ' +  menuAssets.members[6].x );
}
else if (value == 0 ){
    menuAssets.members[0].x += speed;
    trace('value0.x: ' +  menuAssets.members[0].x );
}
}
else{
    if (value == 1){
        menuAssets.members[1].y += speed;
        trace('value1.y: ' +  menuAssets.members[1].y);
                }
                else if (value == 2 ){
                menuAssets.members[2].y += speed;
                trace('value2.y: ' +  menuAssets.members[1].y);
                }
                else if (value == 3 ){
                 menuAssets.members[3].y += speed;
                 trace('value3.y: ' +  menuAssets.members[3].y);
            }
            else if (value == 4){
                trace('value4.y: ' +  menuAssets.members[4].y);
                menuAssets.members[4].y += speed;
           }
           else if (value == 5 ){
            menuAssets.members[5].y += speed;
            trace('value5.y: ' +  menuAssets.members[5].y);
        }
        else if (value == 6 ){
            menuAssets.members[6].y += speed;
            trace('value6.y: ' +  menuAssets.members[6].y);
        }
        else if (value == 0 ){
            trace('value0.y: ' +  menuAssets.members[0].y);
            menuAssets.members[0].y += speed;
        }*/