package classes.buttons 
{
	import classes.Document;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Connor Nacov
	 * 
	 * This button starts a new game after a game over.
	 */
	public class Again extends SimpleButton 
	{
		
		public function Again() 
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