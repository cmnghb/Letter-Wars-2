package classes.buttons 
{
	import classes.Document;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Connor Nacov
	 * 
	 * This button brings the user to the instructions.
	 */
	public class Instructions extends SimpleButton 
	{
		
		public function Instructions() 
		{
			addEventListener(MouseEvent.CLICK, mClick);
		}
		
		private function mClick(e:MouseEvent):void 
		{
			stage.focus = parent;
			(parent as Document).gotoAndStop('Instructions');
		}
	}

}