package collision {
	import flash.display.Sprite;
	import flash.events.Event;
	
	import view.Ball;
	
	/**
	 *	PointHitTest
	 * Note:hitTestPoint of shapeFlag is applicable only for testing a sprite against a point. If you are testing two sprites, you cannot use shapeFlag as an option
	 */
	public class PointHitTest extends Sprite {
		private var ball:Ball;
		
		public function PointHitTest()
		{
			init();
		}
		
		private function init():void
		{
			ball = new Ball();
			addChild(ball);
			ball.x = stage.stageWidth / 2;
			ball.y = stage.stageHeight / 2;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			if(ball.hitTestPoint(mouseX, mouseY, true))
			{
				trace("hit");
			}
		}
	}
}