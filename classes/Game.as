package classes 
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.display.Sprite;
	import flash.events.Event;
	import com.as3toolkit.events.KeyboarderEvent;
    import com.as3toolkit.ui.Keyboarder;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import sounds.SplodeSound;
	import sounds.GameMusic;
	
	/**
	 * ...
	 * @author Connor Nacov
	 */
	public class Game extends Sprite
	{
		// Declare variables.
		public var LetterArray:Array;
		public var spawnTimer:Timer;
		public var player:Turret;
		public var score:int = 0;
		public var scorebox:ScoreField;
		
		public var splode:Sound = new SplodeSound();
		public var splodeChannel:SoundChannel;
		public var music:Sound = new GameMusic();
		public var musicChannel:SoundChannel;
		
		private var kb:Keyboarder;
		private var xml:XML;
		
		public var lLayer:Sprite;
		public var tLayer:Sprite;
		
		public function Game(gameXML:XML) 
		{
			// Setting values...
			kb = new Keyboarder(this);
			scorebox = new ScoreField(0, 360);
			xml = gameXML;
			
			LetterArray = new Array;
			
			// These layers hold the letters, and turret, respectively.
			lLayer = new Sprite();
			tLayer = new Sprite();
			
			// Adds children to the stage.
			addChild(tLayer);
			addChild(lLayer);
			addChild(scorebox);
			
			// Adding the player.
			player = new Turret(this);
			tLayer.addChild(player);
			
			// The timer that will spawn new letters.
			spawnTimer = new Timer(xml.spawnDelay, 0)
			
			// Setting up the Keyboarder API for letter detection.
			Keyboarder.Instance.addEventListener(KeyboarderEvent.FIRST_PRESS, onKP);
			addEventListener(Event.ENTER_FRAME, update);
			
			// The timer's tick event will spawn 1 new letter.
			spawnTimer.addEventListener(TimerEvent.TIMER, onTick);
			spawnTimer.start();
			
			// Loops the game music for the duration of play.
			musicChannel = music.play(0, int.MAX_VALUE);
		}
		
		public function onTick(e:TimerEvent):void 
		{
			// The new letter will have a random ID and a fallspeed that gets higher each tick.
			var l:Letter = new Letter(2 + (xml.fallMultiplier * spawnTimer.currentCount), Math.round(Math.random()*26), this);
			
			// Adds the new letter to the stage and the array.
			lLayer.addChild(l);
			LetterArray.push(l);
			
			// Shortens the timer each tick.
			spawnTimer.delay -= xml.delayDif;
		}
		
		// Function called on a key press event.
		private function onKP(e:KeyboarderEvent):void
		{
			// L is a stand-in for a letter object. Rotrads is the stand-in for the rotation in radians of the turret.
			var l:Letter;
			var rotrads:Number
			
			// Loops through each letter in the array.
			for (var i = 0; i < LetterArray.length; i++)
			{
				// Casts the object to a Letter.
				l = LetterArray[i] as Letter;
				
				// If the ID of the letter matches the keycode typed in (-64 because keycodes for the keyboard start at 65)
				if ( l.letterID == (e.keyCode-64))
				{
					// Destroys the letter.
					l.destroy();
					
					// Plays the explosion sound.
					splodeChannel = splode.play(0, 1);
					
					// Adds to the score based on how high up the letter was. Updates the score field.
					score += xml.scoreMultiplier * (stage.stageHeight - l.y);
					scorebox.score_txt.text = "Score: " + score;
					
					// The cannon will rotate to point at the correct letter, and the laser will fire it's animation.
					player.cannon_mc.laser_mc.visible = true;
					player.cannon_mc.laser_mc.play();
					rotrads = Math.atan2((l.y - player.y), (l.x - player.x));
					player.cannon_mc.rotation = rotrads * (180 / Math.PI);
					// Breaks from the loop, because we don't want to take out 2 letters with one shot.
					break;
				}
			}
		}
		
		// Removes the letter from it's place in the array.
		public function destroyLetter(l:Letter):void
		{
			var index:int = LetterArray.indexOf(l);
			
			if (index > -1)
			{
				LetterArray.splice(index, 1);
			}
		}
		
		// Called every frame of the animation.
		public function update(e:Event):void
		{
			var l:Letter;
			
			// Update each letter's y value and check to see if any of them hit the bottom.
			for (var i = 0; i < LetterArray.length; i++)
			{
				l = LetterArray[i] as Letter;
				
				l.update();
				
				// Game over if the letter reaches the bottom.
				if (l.y > stage.stageHeight)
				{
					gameover();
					break;
				}
			}
		}
		
		// End of the game.
		public function gameover():void
		{
			// Stops the timer and music, and prevents update from calling again.
			spawnTimer.stop();
			removeEventListener(Event.ENTER_FRAME, update);
			musicChannel.stop();
			
			// Removes all unnecesary children for cleanup.
			removeChild(tLayer);
			removeChild(lLayer);
			removeChild(scorebox);
			
			// Goes to the game over screen.
			(parent as Document).gotoAndStop("Game Over");
		}
	}
}