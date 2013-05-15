package friction {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import view.Ball;
	
	/**
	 *	Friction:
	 * Don’t forget to think outside the x, y box. Friction can be applied anywhere you have any type of
		velocity, such as rotation
	 */
	public class Friction extends Sprite {
		private var ball:Ball;
		private var vx:Number = 0;
		private var vy:Number = 0;
		private var frictionFac:Number = 0.1;
		
		public function Friction()
		{
			init();
		}
		
		private function init():void {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align=StageAlign.TOP_LEFT;
			ball = new Ball();
			ball.x = stage.stageWidth / 2;
			ball.y = stage.stageHeight / 2;
			vx = Math.random() * 10 - 5;
			vy = Math.random() * 10 - 5;
			addChild(ball);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void {
			var speed:Number = Math.sqrt(vx * vx + vy * vy);
			var angle:Number = Math.atan2(vy, vx);
			if (speed > frictionFac)
			{
				speed -= frictionFac;
			}
			else
			{
				speed = 0;
			}
			vx = Math.cos(angle) * speed;
			vy = Math.sin(angle) * speed;
			ball.x += vx;
			ball.y += vy;
		}
	}
}