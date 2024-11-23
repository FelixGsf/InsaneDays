package;

import flixel.FlxG;
import flixel.FlxSprite;
//import flixel.addons.ui.FlxUIInputText;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import haxe.Http;
import haxe.Json;
import haxe.zip.Entry;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Loader;
import openfl.events.Event;
import openfl.events.IOErrorEvent;
import openfl.events.ProgressEvent;
import openfl.events.HTTPStatusEvent;
import openfl.net.URLRequest;
import openfl.net.URLLoader;
import openfl.net.URLLoaderDataFormat;
#if sys
import sys.FileSystem;
import sys.io.File;
#end

using StringTools;

private class ZipHandler 
{
	public static function saveUncompressed(zipPath:String, savePath:String):Void {
		var zipReader = new haxe.zip.Reader(File.read(zipPath));
		var fileList:haxe.ds.List<Entry> = zipReader.read();

		if(!savePath.endsWith('/')) savePath += '/';
		if(!FileSystem.exists('${savePath}')) FileSystem.createDirectory('${savePath}');

		for(file in fileList) {
			if(file.fileName.endsWith('/')) { FileSystem.createDirectory(savePath + file.fileName); continue; }
			final fileData:Null<haxe.io.Bytes> = uncompressFile(file);

			File.saveBytes(savePath + file.fileName, fileData);
		}
	}

	public static function uncompressFile(file:Entry):Null<haxe.io.Bytes> {
		if(!file.compressed)
			return file.data; //File is already uncompressed

		var c = new haxe.zip.Uncompress(-15);
		var s = haxe.io.Bytes.alloc(file.fileSize);
		var r = c.execute(file.data, 0, s, 0);
		c.close();
		if( !r.done || r.read != file.data.length || r.write != file.fileSize )
			throw 'Invalid compressed data for ${file.fileName}';
		file.compressed = false;
		file.dataSize = file.fileSize;
		file.data = s;

		return file.data;
	}
}

private typedef DownloadMetadata = {
	var link:String;
	var modpack:String;
	var author:String;
	var fileName:String;
	var logo:String;
	var updated:String;
}

class DownloadModsState extends MusicBeatState
{
	// UI Stuff.
	var modpacks:Array<DownloadMetadata>;
	var progressBar:FlxBar;
	var curMod:Int = 0;
	var progressTxt:FlxText;
	var blockInput:Bool = false;

	// Download stuff.
	var receivedBytes:Int = 0;
	var totalBytes:Int = 0;
	var downloadedMB:Float;
	var totalMB:Float;
	var percent:Int;
	public var button:FlxButton;
	var sprite:FlxSprite;
	var logoGroup:FlxSpriteGroup;
	var updatedTxt:FlxText;
	//var input:FlxUIInputText;
	//var downloadButton:FlxButton;
	//var urlRegex = ~/^(http|https):\/\/[a-z0-9\-\.]+\.[a-z]{2,}(\/.*)?$/i;
	//var url:String;
	//private var blockPressWhileTypingOn:Array<FlxUIInputText> = [];

	override function create() {
		FlxG.mouse.visible = true;

		var bg = new FlxSprite().loadGraphic(Paths.image("menumod/GalleryMenu"));
		add(bg);
		var splash = new FlxSprite().loadGraphic(Paths.image("menumod/Base"));
		splash.flipX = true;
		add(splash);
		// Load modpack metadata from github repository.
		var http = new Http("https://raw.githubusercontent.com/FelixGsf/InsaneDays/refs/heads/main/addons.json");
		http.onData = function(data:String) {
			modpacks = Json.parse(data);
	
			// Create UI elements.
			var buttonGroup:FlxTypedGroup<FlxButton> = new FlxTypedGroup<FlxButton>();
			 logoGroup = new FlxSpriteGroup();
			var textGroup:FlxTypedGroup<FlxText> = new FlxTypedGroup<FlxText>();
			var rowLength:Int = 10;
			var rowIndex:Int = 0;
			var colIndex:Int = 0;

			// Add UI elements for each modpack found.
			for (index => metadata in modpacks) {

				// Download button.
			button = new FlxButton(890, 350, 'Download', function() {
					downloadModpack(modpacks[curMod]);
				});
				button.scale.set(3,3);
				button.label.setFormat("rubik.ttf", 15, FlxColor.BLACK, "center");
				buttonGroup.add(button);
				
				// Añadir el grupo de botones al stage
				add(buttonGroup);
				// Text Object showing if it's a new or updated modpack.
				updatedTxt = new FlxText(0, 0, FlxG.width + 200, "");
updatedTxt.text = modpacks[0].updated; // Aquí seleccionas solo el primer modpack, por ejemplo.
updatedTxt.setFormat("rubik.ttf", 26, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
updatedTxt.x = -200;
updatedTxt.y = button.y - 350;
				// Modpack Logo
				var loader:Loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(event:Event) {
					var bitmap:Bitmap = event.target.content;
					 sprite = new FlxSprite(0, 0, bitmap.bitmapData);
					sprite.scale.set(3,3);
					trace(sprite.x);
					trace(sprite.y);
					sprite.x = 200;
					sprite.y = 400;
					logoGroup.add(sprite);
				});
				loader.load(new URLRequest(modpacks[curMod].logo));

				// Rows and columns.
				rowIndex++;
				if (rowIndex >= rowLength) {
					colIndex++;
					rowIndex = 0;
				}
			}
			textGroup.add(updatedTxt);
			buttonGroup.add(button);
			add(buttonGroup);
			add(logoGroup);
			add(textGroup);
		};

		// Error Message shown when there's an error with GitHub or the user has no internet connection.
		http.onError = function(errorMsg:String) {
			trace("Error connecting to GitHub Repo:\n" + errorMsg);
			progressTxt.text = "Error connecting to GitHub Repo.\nGitHub might be experiencing some problems\nor there's a problem with your internet connection.\nPlease try again later\n" + errorMsg;
			add(progressTxt);
		};

		http.request();
		// Create progress bar.
		progressBar = new FlxBar(0, 0, FlxG.width, 20, null, totalBytes, 100, false);

		// Create progress text.
		progressTxt = new FlxText(0, 250, FlxG.width, "");
		progressTxt.setFormat("rubik.ttf", 16, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			
		/* 	
		// Create input for custom modpack URL
		input = new FlxUIInputText(100, 500, 400, "Enter direct modpack URL");
		add(input);
		blockPressWhileTypingOn.push(input);

		// Create download button for custom modpack URL
		downloadButton = new FlxButton(550, 500, "Download", function(){ downloadCustomModpack(url); });
		add(downloadButton); 
		*/
		super.create();
	}

	private function downloadModpack(metadata:DownloadMetadata):Void {
		try {
			// Create the URLRequest object with the download link.
			var request = new URLRequest(metadata.link);
		
			// Create the URLLoader object to load the data.
			var urlLoader = new URLLoader();
			urlLoader.dataFormat = URLLoaderDataFormat.BINARY;

			// Path variables.
			var directory = Paths.mods();
			var savePath = directory;
			var zipPath:String = directory + metadata.fileName;

			// Add progress indicators.
			add(progressBar);
			add(progressTxt);

			// Listen for progress events.
			urlLoader.addEventListener(ProgressEvent.PROGRESS, function(event:Dynamic) {
				receivedBytes = event.bytesLoaded;
				totalBytes = event.bytesTotal;
				downloadedMB = Math.round((receivedBytes / 1000000) * 100) / 100;
				totalMB = Math.round((totalBytes / 1000000) * 100) / 100;
				percent = Math.round((receivedBytes / totalBytes) * 100);

				progressBar.value = percent;
				if (percent < 100) {
					progressTxt.text = "Downloading... " + Std.string(downloadedMB) + " MB" + "/" + Std.string(totalMB) + " MB";
				} else {
					progressTxt.text = "Completed download of: " + metadata.modpack + " (" + totalMB + " MB)";
				}
				blockInput = true;
			});
			
			// Listen for completion event.
			urlLoader.addEventListener(Event.COMPLETE, function(event:Event) {
				var data:haxe.io.Bytes = untyped urlLoader.data;
				if(!FileSystem.exists('${zipPath.replace(metadata.fileName, "")}')) FileSystem.createDirectory('${zipPath.replace(metadata.fileName, "")}');
				File.saveBytes(zipPath, data);
				ZipHandler.saveUncompressed(zipPath, savePath);
				blockInput = false;
				urlLoader.close();
				remove(progressTxt);
				remove(progressBar);
			});
		
			// Listen for error event.
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, function(event:IOErrorEvent) {
				trace("Error downloading modpack:\n" + event.text);
				progressTxt.text = "IOErrorEvent: Error downloading modpack:\n" + metadata.modpack + "\n" + event.text;
				blockInput = false;
				remove(progressBar);
			});

			// Listen for HTTP status event.
			urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, function(event:HTTPStatusEvent) {
				if (event.status > 400) {
					trace("Error accessing modpack:\n" + event.status);
					progressTxt.text = "HTTPStatusEvent: Error accessing modpack:\n" + metadata.modpack + "\nStatus code: " + event.status;
				}
				blockInput = false;
				remove(progressBar);
			});

			// Start the download.
			urlLoader.load(request);

		} catch (e:Dynamic) {
			trace("Unexpected: Error downloading modpack:\n" + e);
			progressTxt.text = "Unexpected: Error downloading modpack:\n" + metadata.modpack + "\n" + e;
			blockInput = false;
			remove(progressBar);
		}
	}
	
	

	override function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.UP) {
			changeMod(1);
			FlxG.sound.play(Paths.sound('scrollMenu'));
		}
		
		if (FlxG.keys.justPressed.DOWN) {
			changeMod(-1);
			FlxG.sound.play(Paths.sound('scrollMenu'));
		}
		if (blockInput) {
			FlxG.mouse.visible = false;

		} else if (!blockInput) {
			FlxG.mouse.visible = true;
			if(controls.BACK)
			{
				{
					FlxG.sound.play(Paths.sound('cancelMenu'));
					MusicBeatState.switchState(new MainMenuState());
				}
			}
		}
		super.update(elapsed);
	}
	public function changeMod(mod:Int) {
		curMod += mod;
		if (curMod >= modpacks.length) curMod = 0;
		if (curMod < 0) curMod = modpacks.length - 1;
	
		// Actualizar el texto del botón y el texto del modpack.
		updatedTxt.text = modpacks[curMod].updated;
	
		// Limpiar el grupo de logos.
		logoGroup.clear();
	
		// Cargar nuevo logo.
		var loader:Loader = new Loader();
		loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(event:Event) {
			var bitmap:Bitmap = event.target.content;
			var sprite:FlxSprite = new FlxSprite(0, 0, bitmap.bitmapData);
			sprite.scale.set(3,3);
			trace(sprite.x);
			trace(sprite.y);
			sprite.x = 200;
			sprite.y = 400;

			logoGroup.add(sprite);
		});
		loader.load(new URLRequest(modpacks[curMod].logo));
	}
}
