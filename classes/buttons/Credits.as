package classes.buttons 
{
	import classes.Document;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Connor Nacov
	 * 
	 * This button brings the user to the credits.
	 */
	public class Credits extends SimpleButton 
	{
		
		public function Credits() 
		{
			addEventListener(MouseEvent.CLICK, mClick);
		}
		
		private function mClick(e:MouseEvent):void 
		{
			stage.focus = parent;
			(parent as Document).gotoAndStop('Credits');
		}
	}

}