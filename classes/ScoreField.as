package classes 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Connor Nacov
	 * 
	 * This class simply generates a text field for the score on each game and game over screen.
	 */
	public class ScoreField extends Sprite 
	{
		public var score_txt:TextField;
		
		public function ScoreField(vx:int, vy:int) 
		{
			x = vx;
			y = vy;
		}
		
	}

}