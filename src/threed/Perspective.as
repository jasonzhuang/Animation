package threed {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import view.Ball;
	
	/**
	 *	Perspective
	 */
	public class Perspective extends Sprite {
		private var ball:Ball;
		private var xpos:Number = 0;
		private var ypos:Number = 0;
		private var zpos:Number = 0;
		private var fl:Number = 250;
		//vanishing point
		private var vpX:Number = stage.stageWidth / 2;
		private var vpY:Number = stage.stageHeight / 2;
		
		public function Perspective()
		{
			init();
		}
		
		private function init():void
		{
			ball = new Ball();
			addChild(ball);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function onEnterFrame(event:Event):void
		{
			xpos = mouseX - vpX;
			ypos = mouseY - vpY;
			var scale:Number = fl / (fl + zpos);
			ball.scaleX = ball.scaleY = scale;
			ball.x = vpX + xpos * scale;
			ball.y = vpY + ypos * scale;
		}
		
		private function onKeyDown(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.UP)
			{
				zpos += 5;
			}
			else if(event.keyCode == Keyboard.DOWN)
			{
				zpos -= 5;
			}
		}
	}
}