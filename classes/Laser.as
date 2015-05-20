package classes 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Connor Nacov
	 */
	public class Laser extends MovieClip 
	{	
		public function Laser() 
		{
		// When the laser is called as part of the cannon being drawn, it's set to false.
			this.visible = false;
		}
		
		public function done():void
		{
			// Sets the laser back to invisible at the end of it's animation.
			this.visible = false;
		}
	}

}