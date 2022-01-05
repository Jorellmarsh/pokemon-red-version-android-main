package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'dad':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/DADDY_DEAREST', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);

				playAnim('idle');

			case 'red':
				tex = Paths.getSparrowAtlas('characters/rederedred');
				frames = tex;

				animation.addByPrefix('idle', "red idle", 24, false);
				animation.addByPrefix('singUP', "redarriba", 24, false);
				animation.addByPrefix('singDOWN', "abajored", 24, false);
				/*animation.addByPrefix('singLEFT', 'redleft', 24, false);
				animation.addByPrefix('singRIGHT', 'redright', 24, false);*/
				animation.addByPrefix('singLEFT', 'redright', 24, false);
				animation.addByPrefix('singRIGHT', 'redleft', 24, false); //bc yes

				/*addOffset('idle');
				addOffset("singUP", -37, 15);
				addOffset("singRIGHT", 27, 3);
				addOffset("singLEFT", 38, 0);
				addOffset("singDOWN", 20, -18);*/
				addOffset('idle');
				addOffset("singUP", -19, 16);
				addOffset("singRIGHT", -15, 0);
				addOffset("singLEFT",  21, 0);
				addOffset("singDOWN", 4, -17);

				playAnim('idle');
				flipX = true;

			case 'red-pixel':
				tex = Paths.getSparrowAtlas('characters/pixelred');
				frames = tex;

				animation.addByPrefix('idle', "red idle", 24, false);
				animation.addByPrefix('singUP', "red upp", 24, false);
				animation.addByPrefix('singDOWN', "red down", 24, false);
				animation.addByPrefix('singLEFT', 'red leftt', 24, false);
				animation.addByPrefix('singRIGHT', 'red right', 24, false);

				animation.addByPrefix('singUP-alt', 'red upp', 24, false);
				animation.addByPrefix('singDOWN-alt', 'red down', 24, false);
				animation.addByPrefix('singLEFT-alt', 'red leftt', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'red right', 24, false);

				addOffset('idle');
				addOffset("singUP", 0, 29);
				addOffset("singRIGHT", 16, -4);
				addOffset("singLEFT", 0, -6);
				addOffset("singDOWN", 44, -67);

				addOffset("singUP-alt", 0, 29);
				addOffset("singRIGHT-alt", 16, -4);
				addOffset("singLEFT-alt", 0, -6);
				addOffset("singDOWN-alt", 44, -67);

				playAnim('idle');

			case 'bf':
				var tex = Paths.getSparrowAtlas('characters/bf_assets', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'bf idle voltado', 24, false);
				animation.addByPrefix('singUP', 'BF ARRIBA0', 24, false);
				animation.addByPrefix('singLEFT', 'bf izquierda 0', 24, false);
				animation.addByPrefix('singRIGHT', 'bf derecha0', 24, false);
				animation.addByPrefix('singDOWN', 'BF ABAJO0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF ARRIBA MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF IZQUIERDA MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF DERECHA MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF ABAJO MISS', 24, false);
				//animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF DIES", 24, false);
				animation.addByPrefix('deathLoop', "BF DEAD LOOPS", 24, true);
				animation.addByPrefix('deathConfirm', "BF DEAD CONFIRM", 24, false);

				//animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle');
				addOffset("singUP", 6, 27);
				addOffset("singRIGHT", -18, 11);
				addOffset("singLEFT", 37, 0);
				addOffset("singDOWN", -21, -19);
				addOffset("singUPmiss", 12, 29);
				addOffset("singRIGHTmiss", -27, 7);
				addOffset("singLEFTmiss", 48, 3);
				addOffset("singDOWNmiss", -14, -24);
				//addOffset("hey", 7, 4);
				addOffset('firstDeath', 0, 0);
				addOffset('deathLoop', 0, 0);
				addOffset('deathConfirm', 0, 48);
				//addOffset('scared', -4);

				playAnim('idle');

				flipX = true;

			case 'bf-pixel':
				frames = Paths.getSparrowAtlas('characters/pixelbf');
				animation.addByPrefix('idle', 'bf idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF UP0', 24, false);
				animation.addByPrefix('singLEFT', 'bf left0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'bf miss arriba', 24, false);
				animation.addByPrefix('singLEFTmiss', 'bf miss izquierda', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'bf miss derecha', 24, false);
				animation.addByPrefix('singDOWNmiss', 'bf miss abajo', 24, false);
				//animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF DIES", 24, false);
				animation.addByPrefix('deathLoop', "bf dies loop", 24, true);
				animation.addByPrefix('deathConfirm', "bf confirms0", 24, false);

				//animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle');
				addOffset("singUP", 0, 15);
				addOffset("singRIGHT", -35, -14);
				addOffset("singLEFT", 23, -9);
				addOffset("singDOWN", -31, -25);
				addOffset("singUPmiss", 0, 17);
				addOffset("singRIGHTmiss", -26, -17);
				addOffset("singLEFTmiss", 32, -19);
				addOffset("singDOWNmiss", -6, -26);
				//addOffset("hey", 7, 4);
				addOffset('firstDeath', 0, 0);
				addOffset('deathLoop', -50, -13);
				addOffset('deathConfirm', -17, 0);
				//addOffset('scared', -4);

				playAnim('idle');

				flipX = true;

				antialiasing = false;
			case 'bf-pixel-dead':
				frames = Paths.getSparrowAtlas('characters/pixelbf');
				animation.addByPrefix('singUP', "BF Dies pixel", 24, false);
				animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
				animation.addByPrefix('deathLoop', "Retry Loop", 24, true);
				animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
				animation.play('firstDeath');

				addOffset('firstDeath');
				addOffset('deathLoop', -37);
				addOffset('deathConfirm', -37);
				playAnim('firstDeath');
				// pixel bullshit
				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;
				flipX = true;
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				trace('dance');
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-car':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-pixel':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'spooky':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
