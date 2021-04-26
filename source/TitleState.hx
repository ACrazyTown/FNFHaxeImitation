package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.effects.FlxTrail;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class TitleState extends FlxTransitionableState
{
	static var initialized:Bool = false;

	var transitioning:Bool = false;

	static inline var DURATION:Float = 0.75;

	var logo:FlxSprite;
	var logoBlack:FlxSprite;

	var bg:FlxSprite;

	var wiggleEffect:WiggleEffect;

	/*
		var tween:FlxTween;
		var trail:FlxTrail;
		var options:TweenOptions;

		var min:FlxPoint;
		var max:FlxPoint;
	 */
	override public function create():Void
	{
		super.create();

		#if FLX_MOUSE
		FlxG.mouse.visible = false;
		#end

		if (!initialized)
		{
			var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileDiamond);
			diamond.persist = true;
			diamond.destroyOnNoUse = false;

			FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), {asset: diamond, width: 32, height: 32},
				new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
			FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1),
				{asset: diamond, width: 32, height: 32}, new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));

			initialized = true;

			FlxTransitionableState.defaultTransIn.tileData = {asset: diamond, width: 32, height: 32};
			FlxTransitionableState.defaultTransOut.tileData = {asset: diamond, width: 32, height: 32};

			transIn = FlxTransitionableState.defaultTransIn;
			transOut = FlxTransitionableState.defaultTransOut;

			FlxG.sound.playMusic("assets/music/title.mp3", 0, true);
			FlxG.sound.music.fadeIn(2, 0, 0.75);

			new FlxTimer().start(13.6, function(tmr:FlxTimer)
			{
				// ninja muffin 99, if you are reading this PLEASE i BEG YOU
				// please make the hue shader you used in week 7 open source please please
				// have to settle for the shitty wave effect alternative :/
				trace("nothing here... yet");
			});

			new FlxTimer().start(27.5, function(tmr:FlxTimer)
			{
				trace("nothing here... yet");
			});
		}

		bg = new FlxSprite();
		bg.loadGraphic("assets/images/stageback.png");
		bg.antialiasing = true;
		bg.screenCenter();
		add(bg);

		logoBlack = new FlxSprite();
		logoBlack.loadGraphic("assets/images/logo.png");
		logoBlack.antialiasing = true;
		logoBlack.color = FlxColor.BLACK;
		logoBlack.screenCenter();
		add(logoBlack);

		logo = new FlxSprite();
		logo.loadGraphic("assets/images/logo.png");
		logo.antialiasing = true;
		logo.screenCenter();
		add(logo);

		FlxTween.tween(logoBlack, {y: logoBlack.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG});
		FlxTween.tween(logo, {y: logoBlack.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG, startDelay: 0.1});
		/*
			options = {type: PINGPONG, ease: FlxEase.smootherStepInOut};

			// trail = new FlxTrail(logo, "assets/images/logo.png", 12, 0, 0.4, 0.02);
			trail = new FlxTrail(logo, "assets/images/logo.png", 3, 2, 1, 0.05);
			add(trail);

			min = new FlxPoint(FlxG.width, logo.y / 0.80);
			max = new FlxPoint(FlxG.width, logo.y * 0.80);

			tween = FlxTween.linearMotion(logo, logo.x, min.y, logo.x, max.y, DURATION, true, options);
		 */
	}

	override function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ENTER && !transitioning)
		{
			FlxG.camera.flash(FlxColor.WHITE, 1);
			FlxG.sound.music.stop();

			transitioning = true;

			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				FlxG.switchState(new PlayState());
			});
			FlxG.sound.play("assets/sounds/titleEnter.mp3", 0.7);
		}

		super.update(elapsed);
	}
}
