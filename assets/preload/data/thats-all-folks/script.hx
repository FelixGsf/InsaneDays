var curSection = 0;
var stepDev = 0;
var stepTime = 0;

function onSongStart()
{
	PlayState.songLength = 210 * 1000; // Fake Time JIJIJIJA

	stepTime = (60 / bpm) / 4;
}

function onCreate()
{
	PlayState.skipCredit = true;
	PlayState.camHUD.alpha = 0;

	PlayState.blackFuck = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, fromRGB(0, 0, 0));
	PlayState.blackFuck.cameras = [PlayState.camHUD];
	PlayState.blackFuck.alpha = 1;
	PlayState.add(PlayState.blackFuck);

	//PlayState.triggerEventNote("Camera Follow Pos", "550", "580");
}

function onStepHit()
{
	switch (curStep)
	{
		case 1:
			FlxTween.tween(PlayState.blackFuck, {alpha: 0.00001}, 1);
		case 120:
			FlxTween.tween(PlayState.blackFuck, {alpha: 1}, 0.4);
			PlayState.camZooming = true;
		case 128:
			PlayState.blackFuck.alpha = 0.00001;
		case 256:
			PlayState.camZooming = true;
			FlxTween.tween(FlxG.camera, {zoom: 1.2}, 1.2, {ease: FlxEase.quartOut});
		case 1048:
			FlxTween.tween(FlxG.camera, {zoom: 1.2}, 0.8, {ease: FlxEase.quartOut});
		case 2688:
			FlxTween.tween(PlayState.blackFuck, {alpha: 1}, 1.4);
		case 2816:
			PlayState.blackFuck.alpha = 0;
			FlxTween.tween(PlayState, {songLength: FlxG.sound.music.length}, 1, {ease: FlxEase.circInOut});
		case 3952:
			PlayState.blackFuck.alpha = 1;
	}
	
	if (((curStep >= 288 && curStep < 800) || (curStep >= 1056 && curStep < 1568) || (curStep >= 1856 && curStep < 2368) || (curStep >= 2816 && curStep < 3312)) && curStep % 4 == 0)
		PlayState.triggerEventNote("Add Camera Zoom", "0.03", "0.06");
	if (((curStep >= 3648 && curStep < 3904)) && curStep % 4 == 0)
		PlayState.triggerEventNote("Add Camera Zoom", "0.05", "0.1");
}

function fadeDadStrum(alph, time)
{
	PlayState.opponentStrums.forEach(function(spr)
	{
		FlxTween.tween(spr, {alpha: alph}, time);
	});
}

function fadeBfStrum(alph, time)
{
	PlayState.playerStrums.forEach(function(spr)
	{
		FlxTween.tween(spr, {alpha: alph}, time);
	});
}

function addCamZoom(game, hud)
{
	PlayState.camGame.zoom += game;
	PlayState.camHUD.zoom += hud;
}
