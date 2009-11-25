/**
 * A class of ZoomingFrame
 */
package nori {
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class ZoomingFrame{
		private var frame:Shape;
		private var mTarget:Canvas;

		/**
		 * constructor of ZoomingFrame
		 */
		public function ZoomingFrame(target:Canvas){
			mTarget = target;
			frame = createFrame(0xff00000);

			mTarget.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void{
			mTarget.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			mTarget.stage.addEventListener(MouseEvent.MOUSE_DOWN, showFrame);
			mTarget.stage.addEventListener(MouseEvent.MOUSE_UP, hideFrame);	
		}

		/**
		 * showFrame
		 */
		private function showFrame(e:MouseEvent):void {
			frame.x = mTarget.mouseX;
			frame.y = mTarget.mouseY;
			frame.width = 0;
			frame.height = 0;

			mTarget.addChild(frame);
			mTarget.stage.addEventListener(MouseEvent.MOUSE_MOVE, resizeFrame);
		}

		/**
		 * hideFrame
		 */
		private function hideFrame(e:MouseEvent):void {
			mTarget.removeChild(frame);
			
			mTarget.stage.removeEventListener(MouseEvent.MOUSE_MOVE, resizeFrame);			
		}
		
		/**
		 * resizeFrame
		 */
		private function resizeFrame(e:MouseEvent):void {
			frame.width = mTarget.mouseX - frame.x;
			frame.height = mTarget.mouseY - frame.y;
		}

		/**
		 * createFrame
		 */
		private function createFrame(color:uint):Shape {
			var frame:Shape = new Shape();

			frame.graphics.lineStyle(1, color);
			frame.graphics.drawRect(0, 0, 1000, 1000);
			
			return frame;
		}

		/**
		 * checkOnCanvas
		 */
		private function checkOnCanvas():Boolean {
			var p:Point = new Point(mTarget.mouseX, mTarget.mouseY);
			return mTarget.rect.containsPoint(p);
		}
	}
}
