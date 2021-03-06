package ease {
	import flash.display.Sprite;
	import flash.events.Event;
	
	import view.Ball;

	/**
	 *	Sprining:proportional acceleration
	 */
	public class Sprining extends Sprite {
		private var ball:Ball;
		private var spring:Number = 0.2;
		private var vx:Number = 0;
		private var vy:Number = 50;
		private var friction:Number = 0.95;
		private var gravity:Number = 5;

		public function Sprining()
		{
			init();	
		}
		
		private function init():void {
			ball = new Ball();
			addChild(ball);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			var dx:Number = mouseX - ball.x;
			var dy:Number = mouseY - ball.y;
			var ax:Number = dx * spring;
			var ay:Number = dy * spring;
			vx += ax;
			vy += ay;
			vy += gravity;
			vx *= friction;
			vy *= friction;
			ball.x += vx;
			ball.y += vy;
			graphics.clear();
			graphics.lineStyle(1);
			graphics.moveTo(ball.x, ball.y);
			graphics.lineTo(mouseX, mouseY);
		}
	}
}