package rotation {
	import flash.display.Sprite;
	import flash.events.Event;
	
	import view.Ball;
	
	/**
	 *	MultiAngleBounce
	 */
	public class MultiAngleBounce extends Sprite {
		private var ball:Ball;
		private var lines:Array;
		private var numLines:uint = 5;
		private var gravity:Number = 0.3;
		private var bounce:Number = -0.6;
		
		public function MultiAngleBounce()
		{
			init();
		}
		
		private function init():void {
			ball = new Ball(20);
			addChild(ball);
			ball.x = 100;
			ball.y = 100;
			
			// create five lines
			lines = new Array();
			for(var i:uint = 0; i < numLines; i++)
			{
				var line:Sprite = new Sprite();
				line.graphics.lineStyle(1);
				line.graphics.moveTo(-50, 0)
				line.graphics.lineTo(50, 0);
				addChild(line);
				lines.push(line);
			}
			
			// position and rotate them
			lines[0].x = 100;
			lines[0].y = 100;
			lines[0].rotation = 30;
			lines[1].x = 100;
			lines[1].y = 230;
			lines[1].rotation = 45;
			lines[2].x = 250;
			lines[2].y = 180;
			lines[2].rotation = -30;
			lines[3].x = 150;
			lines[3].y = 330;
			lines[3].rotation = 10;
			lines[4].x = 230;
			lines[4].y = 250;
			lines[4].rotation = -30;
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void {
			// normal motion code
			ball.vy += gravity;
			ball.x += ball.vx;
			ball.y += ball.vy;
			
			
		}
	}
}