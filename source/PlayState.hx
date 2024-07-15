package;

import StringTools;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.utils.Assets;

class PlayState extends FlxState
{
	var file:String;
	var index:Float;
	var theActualText:Array<String>;
	var textObj:FlxText;

	override public function create()
	{
		super.create();
		index = 0;
		file = Assets.getText('assets/data/sequence.txt');  // Yes, the animation is in a text file
		theActualText = StringTools.trim(file).split('\n');
		textObj = new FlxText(0, 0, 0, "", 64); // the unknown text is actually the first frame
		textObj.setFormat("Segoe Boot Semilight", 78, FlxColor.WHITE, CENTER);
		add(textObj);
	}

	override public function update(elapsed:Float)
	{ // the actual animation
		textObj.text = theActualText[Math.floor(index)];
		index = (index + 0.521) % theActualText.length;
		textObj.screenCenter();
		super.update(elapsed);
	}
}
