package motion {
	import flash.display.Sprite;
	import flash.events.Event;
	import view.Arrow;
	
	/**
	 *	Velocity
	 */
	public class FollowMe extends Sprite {
		private var arrow:Arrow;
		private var speed:Number = 5;
		public function FollowMe()
		{
			init();
		}
		private function init():void
		{
			arrow = new Arrow();
			addChild(arrow);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function onEnterFrame(event:Event):void
		{
			var dx:Number = mouseX - arrow.x;
			var dy:Number = mouseY - arrow.y;
			var angle:Number = Math.atan2(dy, dx);
			arrow.rotation = angle * 180 / Math.PI;
			var vx:Number = Math.cos(angle) * speed;
			var vy:Number = Math.sin(angle) * speed;
			arrow.x += vx;
			arrow.y += vy;
		}
	}
}