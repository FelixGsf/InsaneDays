package;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import lime.app.Promise;
import lime.app.Future;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;
import flixel.math.FlxMath;
import WeekData;
import openfl.utils.Assets;
import lime.utils.Assets as LimeAssets;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;

import haxe.io.Path;

class LoadingState extends MusicBeatState
{
	inline static var MIN_TIME = 1.0;

	// Browsers will load create(), you can make your song load a custom directory there
	// If you're compiling to desktop (or something that doesn't use NO_PRELOAD_ALL), search for getNextState instead
	// I'd recommend doing it on both actually lol
	
	// TO DO: Make this easier
	var target:FlxState;
	var stopMusic = false;
	var directory:String;
	var callbacks:MultiCallback;
	var targetShit:Float = 0;
	var loadingBF:FlxSprite;
	var funkay:FlxSprite;
	var loadBar:FlxSprite;
	var posX:Int = 0;
	function new(target:FlxState, stopMusic:Bool, directory:String)
		
	{
		{
		super();
		this.target = target;
		this.stopMusic = stopMusic;
		this.directory = directory;
		 // Define el array de frases
        // Selecciona una frase al azar del array
       
    
	}
}
private var loadingText:FlxText;


override function create()
{

	var phrases:Array<String> = [
        "no fumes,no termines como exmix!",
		"aveces la mejor opcion es jugar a 2 manos",
		"No soy enano!!!",
		"Mari ama a felix!",
		"2 de mayo: feliz cumple felix!",
		"esperamos que karate tenga un \ncalido corazon",
		"segun rayo.. soy un anciano..",
		"prueba con diferentes configuraciones!!",
		"le gente siquiera lee esto?",
		"luzhy es una nifomana de mrd",
		"a barrera lo han rechazado mucho..\npobre barrera",
		"tetas",
		"no soy furrooo -mapache",
		"no toques el menú de opciones \nsi no está felix cerca",
		"No le hagas caso a Avast, puede ser \ntu peor enemigo",
		"Se los juro, yo no quemé la casa \n-ichi",
		"Barrera ya tiene novia! animate!\n el pudo, tu tambien",
		"Nunca le preguntes a Mari por 'Luisa'",
		"Rayo Flow",
		"¿Quien es luisa?",
		"amo mi pelo.",
		"virusTotal aprueba el mod!",
		"Rayo nunca me dio el feliz cumple :(",
		"Furry love goty \n-Rayo 2024",
		"Te queremos mucho rayo :3",
		"permaban a quintero.",
		"te odiamos Daniel!",
		"jamas le preguntes a felix su primer nombre \n creeme, lo odia",
		"Mujeres de pelo corto superior!",

		"No te averguenses de jugar fnf \naverguensate meterle plata a freefire"
    ];

		var bg:FlxSprite = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, 0xff000000);
		add(bg);

		var imagenes:Array<String> = [];
		imagenes = CoolUtil.coolTextFile(Paths.getLibraryPath('images/carga/imagenes.txt'));
		var cuentaTexto:Int = imagenes.length;
if (WeekData.getWeekFileName() == 'day1'){
		funkay = new FlxSprite(0, 0).loadGraphic(Paths.getPath('images/carga/rayoLoading.png',IMAGE));
		funkay.updateHitbox();
		funkay.antialiasing = ClientPrefs.globalAntialiasing;
		add(funkay);
	}
	else{
		funkay = new FlxSprite(0, 0).loadGraphic(Paths.getPath('images/carga/'+imagenes[(FlxG.random.int(0, cuentaTexto-1))]+'.png', IMAGE));
		funkay.updateHitbox();
		funkay.antialiasing = ClientPrefs.globalAntialiasing;
		add(funkay);
	}
		var loadingText:FlxText = new FlxText(0, FlxG.height / 1.2, FlxG.width, "", 32);
    loadingText.setFormat(null, 32, FlxColor.WHITE, "center");
	loadingText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 3, 1);
	var randomIndex:Int = Math.floor(Math.random() * phrases.length);
    loadingText.text = phrases[randomIndex];

		loadBar = new FlxSprite(0, FlxG.height - 20).makeGraphic(FlxG.width, 10, 0xff6bff16);
		loadBar.screenCenter(X);
		loadBar.antialiasing = ClientPrefs.globalAntialiasing;
		add(loadBar);
		loadingBF = new FlxSprite(840,200);
		loadingBF.frames = Paths.getSparrowAtlas('carga/bf_running');
		loadingBF.animation.addByPrefix('run', 'bf running', 24, false);
		loadingBF.animation.play('run');
		loadingBF.scale.y = 0.5;
		loadingBF.scale.x = 0.5;
	   add(loadingBF);
	   add(loadingText);

		
		initSongsManifest().onComplete
		(
			function (lib)
			{
				callbacks = new MultiCallback(onLoad);
				var introComplete = callbacks.add("introComplete");
				/*if (PlayState.SONG != null) {
					checkLoadSong(getSongPath());
					if (PlayState.SONG.needsVoices)
						checkLoadSong(getVocalPath());
				}*/
				checkLibrary("shared");
				if(directory != null && directory.length > 0 && directory != 'shared') {
					checkLibrary(directory);
				}

				var fadeTime = 0.5;
				FlxG.camera.fade(FlxG.camera.bgColor, fadeTime, true);
				new FlxTimer().start(fadeTime + MIN_TIME, function(_) introComplete());
			}
		);
		{
		

		} 
		 
		
	function checkLoadSong(path:String)
	{
		if (!Assets.cache.hasSound(path))
		{
			var library = Assets.getLibrary("songs");
			final symbolPath = path.split(":").pop();
			// @:privateAccess
			// library.types.set(symbolPath, SOUND);
			// @:privateAccess
			// library.pathGroups.set(symbolPath, [library.__cacheBreak(symbolPath)]);
			var callback = callbacks.add("song:" + path);
			Assets.loadSound(path).onComplete(function (_) { callback(); });
		}
	}
}
	
	function checkLibrary(library:String) {
		trace(Assets.hasLibrary(library));
		if (Assets.getLibrary(library) == null)
		{
			{
				{
			@:privateAccess
			if (!LimeAssets.libraryPaths.exists(library))
				throw "Missing library: " + library;

			var callback = callbacks.add("library:" + library);
			Assets.loadLibrary(library).onComplete(function (_) { callback(); });
		}
	}
}
}
	
	override function update(elapsed:Float)
		
	{
		{
			{
				{
		

		super.update(elapsed);
	   // Asegúrate de que el texto de carga se ha inicializado
	  

		if(callbacks != null) {
			targetShit = FlxMath.remapToRange(callbacks.numRemaining / callbacks.length, 1, 0, 0, 1);
			loadBar.scale.x += 0.5 * (targetShit - loadBar.scale.x);
		}
	}
	}
}

}
	function onLoad()
	{
		if (stopMusic && FlxG.sound.music != null)
			FlxG.sound.music.stop();
		
		MusicBeatState.switchState(target);
	}
	
	
	static function getSongPath()
	{
		return Paths.inst(PlayState.SONG.song);
	}
	
	static function getVocalPath()
	{
		return Paths.voices(PlayState.SONG.song);
	}
	
	inline static public function loadAndSwitchState(target:FlxState, stopMusic = false)
	{
		MusicBeatState.switchState(getNextState(target, stopMusic));
	}
	
	static function getNextState(target:FlxState, stopMusic = false):FlxState
	{
		var directory:String = 'shared';
		var weekDir:String = StageData.forceNextDirectory;
		StageData.forceNextDirectory = null;

		if(weekDir != null && weekDir.length > 0 && weekDir != '') directory = weekDir;

		Paths.setCurrentLevel(directory);
		trace('Setting asset folder to ' + directory);

		var loaded:Bool = false;
		if (PlayState.SONG != null) {
			loaded = isSoundLoaded(getSongPath()) && (!PlayState.SONG.needsVoices || isSoundLoaded(getVocalPath())) && isLibraryLoaded("shared") && isLibraryLoaded(directory);
		}
		
		if (!loaded)
			return new LoadingState(target, stopMusic, directory);
		
		if (stopMusic && FlxG.sound.music != null)
			FlxG.sound.music.stop();
		
		return target;
	}
	
	
	static function isSoundLoaded(path:String):Bool
	{
		return Assets.cache.hasSound(path);
	}
	
	static function isLibraryLoaded(library:String):Bool
	{
		return Assets.getLibrary(library) != null;
	}
	
	
	override function destroy()
	{
		super.destroy();
		
		callbacks = null;
	}
	
	static function initSongsManifest()
	{
		var id = "songs";
		var promise = new Promise<AssetLibrary>();

		var library = LimeAssets.getLibrary(id);

		if (library != null)
		{
			return Future.withValue(library);
		}

		var path = id;
		var rootPath = null;

		@:privateAccess
		var libraryPaths = LimeAssets.libraryPaths;
		if (libraryPaths.exists(id))
		{
			path = libraryPaths[id];
			rootPath = Path.directory(path);
		}
		else
		{
			if (StringTools.endsWith(path, ".bundle"))
			{
				rootPath = path;
				path += "/library.json";
			}
			else
			{
				rootPath = Path.directory(path);
			}
			@:privateAccess
			path = LimeAssets.__cacheBreak(path);
		}

		AssetManifest.loadFromFile(path, rootPath).onComplete(function(manifest)
		{
			if (manifest == null)
			{
				promise.error("Cannot parse asset manifest for library \"" + id + "\"");
				return;
			}

			var library = AssetLibrary.fromManifest(manifest);

			if (library == null)
			{
				promise.error("Cannot open library \"" + id + "\"");
			}
			else
			{
				@:privateAccess
				LimeAssets.libraries.set(id, library);
				library.onChange.add(LimeAssets.onChange.dispatch);
				promise.completeWith(Future.withValue(library));
			}
		}).onError(function(_)
		{
			promise.error("There is no asset library with an ID of \"" + id + "\"");
		});

		return promise.future;
	}
	private function getLoadingScreen(weekName:String){
if (weekName == 'day1'){
funkay = new FlxSprite(0, 0).loadGraphic(Paths.getPath('images/carga/rayoLoading.png',IMAGE));
funkay.updateHitbox();
funkay.antialiasing = ClientPrefs.globalAntialiasing;
add(funkay);
}

else if (weekName == 'night2'){
funkay = new FlxSprite(0, 0).loadGraphic(Paths.getPath('images/carga/esmis.png',IMAGE));
funkay.updateHitbox();
funkay.antialiasing = ClientPrefs.globalAntialiasing;
add(funkay);
}
else if (weekName == 'day3'){
funkay = new FlxSprite(0, 0).loadGraphic(Paths.getPath('images/carga/LuzhyLoading.png',IMAGE));
funkay.updateHitbox();
funkay.antialiasing = ClientPrefs.globalAntialiasing;
add(funkay);
	}	
}
}
class MultiCallback
{
	public var callback:Void->Void;
	public var logId:String = null;
	public var length(default, null) = 0;
	public var numRemaining(default, null) = 0;
	
	var unfired = new Map<String, Void->Void>();
	var fired = new Array<String>();
	
	public function new (callback:Void->Void, logId:String = null)
	{
		this.callback = callback;
		this.logId = logId;
	}
	
	public function add(id = "untitled")
	{
		id = '$length:$id';
		length++;
		numRemaining++;
		var func:Void->Void = null;
		func = function ()
		{
			if (unfired.exists(id))
			{
				unfired.remove(id);
				fired.push(id);
				numRemaining--;
				
				if (logId != null)
					log('fired $id, $numRemaining remaining');
				
				if (numRemaining == 0)
				{
					if (logId != null)
						log('all callbacks fired');
					callback();
				}
			}
			else
				log('already fired $id');
		}
		unfired[id] = func;
		return func;
	}
	
	inline function log(msg):Void
	{
		if (logId != null)
			trace('$logId: $msg');
	}
	public function getFired() return fired.copy();
	public function getUnfired() return [for (id in unfired.keys()) id];
}