package classes 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Connor Nacov
	 */
	public class Turret extends MovieClip
	{
		// Declare variables.
		public var game:Game;
		public var cannon_mc:MovieClip;
		
		public function Turret(aGame:Game) 
		{
			// Reference to the game.
			game = aGame;
			
			// Hardcoded placement values.
			x = 260;
			y = 352;
		}
		
	}

}