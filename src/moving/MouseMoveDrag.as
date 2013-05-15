package moving {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import view.Ball;
	
	/**
	 *	MouseMoveDrag:
	 * set the mouseDown listener on the sprite you are going to drag, but for the other two events, you want to listen to them on the stage
	 * reason: you might get into a situation where you are dragging faster than Flash can update the sprite to keep it
	 *		under the mouse. At that point, if you were listening for the mouseUp and mouseMove events on the
	 *		sprite, they would never fire, as the mouse pointer is no longer over the sprite.
	 */
	public class MouseMoveDrag extends Sprite {
		private var ball:Ball;
		
		public function MouseMoveDrag()
		{
			init();
		}
		
		private function init():void {
			ball = new Ball();
			ball.x = 100;
			ball.y = 100;
			addChild(ball);
			ball.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
		
		private function onMouseDown(event:MouseEvent):void
		{
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		private function onMouseUp(event:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.removeEventListener(MouseEvent.MOUSE_MOVE,
				onMouseMove);
		}
		
		private function onMouseMove(event:MouseEvent):void
		{
			ball.x = mouseX;
			ball.y = mouseY;
		}
	}
}