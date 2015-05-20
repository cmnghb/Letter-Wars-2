package classes 
{
	import flash.display.MovieClip;
	import Math;
	
	/**
	 * ...
	 * @author Connor Nacov
	 */
	public class Letter extends MovieClip 
	{
		// Declare variables.
		public var vy:Number;
		public var letterID:int;
		public var game:Game;
		
		public function Letter(fallSpeed:Number, ID:int, aGame:Game)
		{
			// Reference to the game.
			game = aGame;
			
			// Sets the falling speed.
			vy = fallSpeed;
			
			// Just in case the random number generator gives a number that would not round up to 1.
			if (ID < 1) { letterID = 1; }
			else { letterID = ID; }
			
			// Sets the x position to a random spot on the stage.
			x = (Math.random() * 510) + 20;
			y = 0;
			
			// The ID determines which frame to show, and as a result, which letter is represented.
			gotoAndStop(ID);
		}
		
		// Gets called every frame to move the letter down the screen.
		public function update():void
		{
			y += vy;
		}
		
		// When the letter is destroyed, call it's corresponding function in Game, and play the explosion animation.
		public function destroy():void
		{
			game.destroyLetter(this);
			
			gotoAndPlay(27);
		}
		
		// Once the animation is done, removes the child from the parent if it hasn't already done so.
		public function animationEnded():void
		{
			if (parent != null)
			{
				parent.removeChild(this);
			}
		}
	}

}