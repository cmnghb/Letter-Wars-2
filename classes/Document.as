package classes 
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import sounds.MainMusic;
	
	/**
	 * ...
	 * @author Connor Nacov
	 */
	public class Document extends MovieClip
	{
		// Declare variables.
		private var game:Game;
		private var gameXML:XML;
		
		private var music:Sound = new MainMusic();
		private var musicChannel:SoundChannel;
		
		public function Document()
		{
			// Loading in XML information
			var xmlRequest:URLRequest = new URLRequest("letterwars.xml");
			var xmlLoader:URLLoader = new URLLoader(xmlRequest);
			xmlLoader.addEventListener(Event.COMPLETE, onXMLLoaded);
			
			// Starts the main music (Only plays once since I don't expect to stay on this screen longer than two minutes.
			musicChannel = music.play(5000, 1);
		}
		
		private function onXMLLoaded(e:Event):void 
		{
			// Sets up XML to send to the game.
			gameXML = new XML(e.target.data);
		}
		
		// Function called at the start of the Game screen.
		public function newGame()
		{
			// Set up the game and stop the main screen music.
			game = new Game(gameXML);
			addChild(game);
			musicChannel.stop();
		}
		
		public function displayScore()
		{
			// Calculates and displays the final score at a game over.
			finalScore.text = "Final Score: " + game.score;
		}		
	}

}