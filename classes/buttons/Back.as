package classes.buttons 
{
	import classes.Document;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Connor Nacov
	 * 
	 * This button brings the user back to the main screen.
	 */
	public class Back extends SimpleButton 
	{
		
		public function Back() 
		{
			addEventListener(MouseEvent.CLICK, mClick);
		}
		
		private function mClick(e:MouseEvent):void 
		{
			stage.focus = parent;
			(parent as Document).gotoAndPlay('Main');
		}
	}

}