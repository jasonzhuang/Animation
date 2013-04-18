package motion {
	import flash.display.Sprite;
	
	/**
	 *	Ship
	 */
	public class Ship extends Sprite {
		public function Ship()
		{
			draw(false);
		}
		
		public function draw(showFlame:Boolean):void
		{
			graphics.clear();
			graphics.lineStyle(1, 0xff0000);
			graphics.moveTo(10, 0);
			graphics.lineTo(-10, 10);
			graphics.lineTo(-5, 0);
			graphics.lineTo(-10, -10);
			graphics.lineTo(10, 0);
			if(showFlame)
			{
				graphics.moveTo(-7.5, -5)
				graphics.lineTo(-15, 0);
				graphics.lineTo(-7.5, 5);
			}
		}
	}
}