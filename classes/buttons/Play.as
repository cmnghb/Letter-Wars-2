package classes.buttons 
{
	import classes.Document;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Connor Nacov
	 * 
	 * This button starts the game.
	 */
	public class Play extends SimpleButton 
	{
		
		public function Play() 
		{
			addEventListener(MouseEvent.CLICK, mClick);
		}
		
		private function mClick(e:MouseEvent):void 
		{
			stage.focus = parent;
			(parent as Document).gotoAndStop('Game');
		}
		
	}

}