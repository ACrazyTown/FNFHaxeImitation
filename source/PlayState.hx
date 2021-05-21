package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class PlayState extends FlxTransitionableState
{
	var wiggleEffect:WiggleEffect;
	var logoBl:FlxSprite;

	override public function create()
	{
		#if FLX_MOUSE
		FlxG.mouse.visible = false;
		#end
		
		super.create();

		var txt:FlxText = new FlxText(0, 0, FlxG.width, "actual video game goes here\n" + "but there's no way im making that soo....", 32);
		txt.setFormat(null, 32, FlxColor.WHITE);
		txt.alignment = CENTER;
		txt.screenCenter();
		add(txt);

		// LOLLLL WHAT A MESS
		// i had literally no idea how to implement this WHoopsie
		// its shit Code i KNOW :sob: Dont blame ME
		new FlxTimer().start(10, function(FlxTimer)
		{
			txt.text = "Why are you still here?\n" + "GO, the \"game\" is obviously over...";
		});

		new FlxTimer().start(15, function(FlxTimer)
		{
			txt.text = "you think you're so funny don't you?";
		});

		new FlxTimer().start(25, function(FlxTimer)
		{
			txt.text = "OK SERIOUSLY\n" + "THE GAME IS DONE";
		});

		new FlxTimer().start(30, function(FlxTimer)
		{
			txt.text = "you're still here, huh?";
		});

		new FlxTimer().start(35, function(FlxTimer)
		{
			txt.text = "Go support the kickstarter of the original game\n" + "since you have SO much time...";
		});

		new FlxTimer().start(45, function(FlxTimer)
		{
			txt.text = "alright this is it.\n" + "look at the source code htis is literally it Goodbye";
		});

		new FlxTimer().start(50, function(FlxTimer)
		{
			txt.text = "still here?\n" + "FINE you win I dont care JUST EXIT THE GAME";

			FlxG.sound.playMusic("assets/music/freakyMenu.mp3", 0);

			FlxG.sound.music.fadeIn(2, 0, 0.7);
		});

		new FlxTimer().start(54, function(FlxTimer)
		{
			txt.text = "Ay!";
		});

		new FlxTimer().start(54.5, function(FlxTimer)
		{
			txt.text = "ok actually seriously goodbye bye bye\n" + "music by kawai sprite the G";
			trace(FlxG.sound.music.time);
		});

		new FlxTimer().start(57, function(FlxTimer)
		{
			txt.text = "OG game by ninja_muffin99\n";
			txt.shader = null;
			trace(FlxG.sound.music.time);
		});
		
		new FlxTimer().start(57.5, function(FlxTimer)
		{
			txt.text += "Art by evilsk8r\n";
			trace(FlxG.sound.music.time);
		});

		new FlxTimer().start(58, function(FlxTimer)
		{
			txt.text += "Animation by Phantom Arcade\n";
			trace(FlxG.sound.music.time);
		});

		new FlxTimer().start(58.5, function(FlxTimer)
		{
			txt.text += "Music by KawaiSprite";
			trace(FlxG.sound.music.time);
		});

		new FlxTimer().start(59, function(FlxTimer)
		{
			txt.text = "Friday\n" + "Night\n" + "Funkin'";
			trace(FlxG.sound.music.time);
		});

		new FlxTimer().start(59, function(FlxTimer)
		{
			txt.text = "";

			FlxG.camera.flash(FlxColor.WHITE, 1);

			logoBl = new FlxSprite(-150, -100);
			logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
			logoBl.antialiasing = true;
			logoBl.animation.addByPrefix('bump', 'logo bumpin', 24);
			logoBl.animation.play('bump');
			logoBl.screenCenter();
			add(logoBl);

			trace(FlxG.sound.music.time);
		});

		new FlxTimer().start(65, function(FlxTimer)
		{
			FlxG.sound.music.stop();

			remove(logoBl);
			txt.text = "LOL JK";
		});

		new FlxTimer().start(70, function(FlxTimer)
		{
			txt.text = "ok now ACTUALLY for rela actually";
		});

		new FlxTimer().start(72, function(FlxTimer)
		{
			txt.text = "goodbye";
			new FlxTimer().start(2, function(FlxTimer)
			{
				FlxG.switchState(new TitleState());
			});
		});

		wiggleEffect = new WiggleEffect();
		wiggleEffect.waveAmplitude = 0.02;
		wiggleEffect.waveFrequency = 1;
		wiggleEffect.waveSpeed = 1;
		txt.shader = wiggleEffect.shader;
	}

	override public function update(elapsed:Float)
	{
		wiggleEffect.update(elapsed);
		super.update(elapsed);
	}
}
