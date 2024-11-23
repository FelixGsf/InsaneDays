package charSelecotr;

import subsFreePlays.RayoFreePlay;
import flixel.util.FlxTimer;
import Song.SwagSong;
import flixel.system.FlxSoundGroup;
import subsFreePlays.MariFP;
import flixel.FlxG;
import flixel.FlxSprite;

class CharSelectorBase extends MusicBeatState{
    //yeah funkin charSelector in psychXD
    var bg:FlxSprite;
    //freePlays managers
    public static var isFelixFree:Bool = true;
    public static var isMariFree:Bool = false;
    public static var cancionable:Bool = false;
    public static var isRayoFree:Bool = false;
    //end freePlays managers
    var isPressed:Bool = false;
    var icon:FlxSprite;
  
    var musicGroup:FlxSoundGroup;
    var floor:FlxSprite;
    var stateSwitch:FlxTimer;
    public static var exitToState:Bool = false;
    var curChar:Int = 0;
    var speakers:FlxSprite;
    var crown:FlxSprite;
   public static var charIcon:Array<String> = ['felix'];
   var song:SwagSong = null;
    var chars:Array<FlxSprite> = [];
    var choose:FlxSprite;
    var cols:Int = 3; // Número de columnas en la cuadrícula
    var rows:Int = 3; // Número de filas en la cuadrícula
    var lockIcon:String = 'lock'; // Nombre del archivo del candado
    
    override function create() {
        stateSwitch = new FlxTimer();
        musicGroup = new FlxSoundGroup();
        FlxG.sound.playMusic(Paths.music('charSelect'), 1, true, musicGroup);
    
        bg = new FlxSprite(-150, -180).loadGraphic(Paths.image('selector/charSelectBG'));
        add(bg);
    
        crown = new FlxSprite(0, 240);
        crown.frames = Paths.getSparrowAtlas('selector/crown');
        crown.animation.addByPrefix('idle', 'crowd', 24, true);
        crown.animation.play('idle');
        add(crown);
    
        floor = new FlxSprite(0, 400);
        floor.frames = Paths.getSparrowAtlas('selector/charSelectStage');
        floor.animation.addByPrefix('idle', 'stage full instance 1', 24, true);
        floor.animation.play('idle');
        add(floor);
    
        choose = new FlxSprite(400, 0).loadGraphic(Paths.image('selector/chosee'));
        add(choose);
    
        var courtines:FlxSprite = new FlxSprite(-50, -70).loadGraphic(Paths.image('selector/curtains'));
        add(courtines);
    
        speakers = new FlxSprite(-50, 430);
        speakers.frames = Paths.getSparrowAtlas('selector/speakers');
        speakers.animation.addByPrefix('bom', 'Speakers ALL', 24, true);
        speakers.animation.play('bom');
        add(speakers);
    refreshIcons();
    trace(charIcon[curChar]);
            // esto es para la cuadrícula de personajes
        super.create();
    }
    public function refreshIcons():Void {
        // Elimina los íconos actuales
        for (icon in chars) {
            remove(icon);
        }
        chars = [];

        // Añade los nuevos íconos
        for (i in 0...(cols * rows)) {
            if (i < charIcon.length) {
                icon = new FlxSprite((i % cols) * 130 + 440, Math.floor(i / cols) * 150 + 150);
                icon.loadGraphic(Paths.image('selector/' + charIcon[i]));
            } else {
                icon = new FlxSprite((i % cols) * 130 + 440, Math.floor(i / cols) * 150 + 150).loadGraphic(Paths.image('selector/' + lockIcon));
            }
            add(icon);
            chars.push(icon);
        }
    }
    override function update(elapsed:Float) {
        var table = CharSelectorBase.charIcon;
        if (StoryMenuState.isWeekCompleted('day4')){
            if (!table.contains('rayo')){
                CharSelectorBase.charIcon.push('rayo');
                ClientPrefs.saveSettings();
                refreshIcons();
            }
		}
        if (StoryMenuState.isWeekCompleted('day3')){
            if (!table.contains('mari')){
                CharSelectorBase.charIcon.push('mari');
                ClientPrefs.saveSettings();
                refreshIcons();
            }
        }
        if (FlxG.keys.justPressed.ESCAPE) {
            MusicBeatState.switchState(new FreeplayState());
            FlxG.sound.playMusic(Paths.music('freeTheme'));
        }
    
        // Navegación con teclas
        if (!isPressed){
        if (FlxG.keys.justPressed.LEFT) {
            curChar = (curChar % cols == 0) ? curChar + cols - 1 : curChar - 1;
            FlxG.sound.play(Paths.sound('CS_select'),1);
        } else if (FlxG.keys.justPressed.RIGHT) {
            curChar = (curChar % cols == cols - 1) ? curChar - cols + 1 : curChar + 1;
            FlxG.sound.play(Paths.sound('CS_select'),1);
        } else if (FlxG.keys.justPressed.UP) {
            curChar = (curChar < cols) ? curChar + (rows - 1) * cols : curChar - cols;
            FlxG.sound.play(Paths.sound('CS_select'),1);
        } else if (FlxG.keys.justPressed.DOWN) {
            curChar = (curChar >= (rows - 1) * cols) ? curChar % cols : curChar + cols;
            FlxG.sound.play(Paths.sound('CS_select'),1);
        }
    }
    var curling = charIcon[curChar];
    if (!isPressed){
        if (FlxG.keys.justPressed.ENTER) {
            if (curling == 'lock' || curling == null || curling == "" ) {
                FlxG.sound.play(Paths.sound('CS_locked'));
                isPressed = false;
                stateSwitch.cancel();
                trace('no');

            }
            else{
                trace('seleccionaste a: ' + charIcon[curChar]);
                isPressed = true;
                FlxG.sound.play(Paths.sound('CS_confirm'));
            }
            chars[curChar].animation.play('select');
            stateSwitch.start(2,function(a:FlxTimer):Void{
                switch(curling){
                    case 'felix':
                        CharSelectorBase.isFelixFree = true;
                        CharSelectorBase.exitToState = true;
                        CharSelectorBase.isMariFree = false;
                        CharSelectorBase.isRayoFree = false;
                        MusicBeatState.switchState(new FreeplayState());
                       
                    case 'rayo':
                        CharSelectorBase.isFelixFree = false;
                        CharSelectorBase.isMariFree = false;
                        CharSelectorBase.exitToState = true;
                        CharSelectorBase.isRayoFree = true;
                        MusicBeatState.switchState(new RayoFreePlay());
                    case 'mari':
                        CharSelectorBase.isFelixFree = false;
                        CharSelectorBase.isMariFree = true;
                        CharSelectorBase.exitToState = true;
                        CharSelectorBase.isRayoFree = false;
                        MusicBeatState.switchState(new MariFP());
                }
            });
        }
        }
        // Actualizar la escala de los personajes
        for (i in 0...chars.length) {
            if (curChar == i) {
                chars[i].scale.set(1.5, 1.5);
            } else {
                chars[i].scale.set(1.1, 1.1);
            }
        }

        super.update(elapsed);
}
}