package view{
	import flash.display.Sprite;

	public class Ball extends Sprite{
		private var color:uint;
		public var radius:Number;
		public var vx:Number = 0;
		public var vy:Number = 0;
		
		public function Ball(radius:Number=40, color:uint=0xff0000) {
			this.radius = radius;
			this.color = color;
			init();
		}
		
		public function init():void {
			graphics.beginFill(color);
			graphics.drawCircle(0, 0, radius);
			graphics.endFill();
		}
	}
}