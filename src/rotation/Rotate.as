package rotation {
	import flash.display.Sprite;
	import flash.events.Event;
	
	import view.Ball;
	
	/**
	 *	Rotate
	 */
	public class Rotate extends Sprite {
		private var ball:Ball;
		private var angle:Number = 0;
		private var radius:Number = 150;
		//velocity of rotation
		private var vr:Number = .1;
		
		public function Rotate()
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
			ball.x = stage.stageWidth / 2/**centerX**/ + Math.cos(angle) * radius;
			ball.y = stage.stageHeight / 2/**centerY**/ + Math.sin(angle) * radius;
			angle += vr;
		}
	}
}