package ease {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import view.Ball;
	
	/**
	 *	Easing:proportional velocity
	 * Note easing isn't just for motion, also work for alpha, rotation, colors 
	 */
	public class Easing extends Sprite {
		private var ball:Ball;
		private var easing:Number = 0.2;
		private var targetX:Number = stage.stageWidth / 2;
		
		public function Easing()
		{
			init();
		}
		
		private function init():void {
			ball = new Ball();
			addChild(ball);
			ball.y = stage.stageHeight / 2;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			var dx:Number = targetX - ball.x;
			if(Math.abs(dx) < 1)
			{
				ball.x = targetX;
				removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				trace("done");
			}
			else {
				var vx:Number = dx * easing;
				ball.x += vx;
			}
		}
	}
}