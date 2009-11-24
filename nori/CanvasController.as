/**
 * A class of CanvasController
 */
package nori{
	import flash.events.*;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class CanvasController {
		private var mCanvas:Canvas;
		private var clickedPoint:Point;
		private var begin:Point;
		private var mouseDownInside:Boolean;
		
		/**
		 * constructor of CanvasController
		 */
		public function CanvasController(canvas:Canvas){
			mCanvas = canvas;
			
			mCanvas.stage.addEventListener(MouseEvent.MOUSE_DOWN, checkOnCanvas);
			mCanvas.stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			mCanvas.stage.addEventListener(MouseEvent.MOUSE_UP, checkOnCanvas);
			mCanvas.stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
		}

		/**
		 * mouseDownHandler
		 */
		private function mouseDownHandler(e:MouseEvent):void {
			begin = clickedPoint;
			mouseDownInside = true;
		}
		
		/**
		 * mouseUpHandler
		 */
		private function mouseUpHandler(e:MouseEvent):void {
			if(mouseDownInside && begin.x != clickedPoint.x && begin.y != clickedPoint.y){
				var rect:Rectangle = new Rectangle();

				rect.left   = Math.min(begin.x, clickedPoint.x);
				rect.top    = Math.min(begin.y, clickedPoint.y);
				rect.right  = Math.max(begin.x, clickedPoint.x);
				rect.bottom = Math.max(begin.y, clickedPoint.y);

				mCanvas.zoomRect(rect);
				mCanvas.draw();
			}
		}

		/**
		 * checkOnCanvas
		 */
		private function checkOnCanvas(e:MouseEvent):void {
			var p:Point = new Point(mCanvas.mouseX, mCanvas.mouseY);

			if (mCanvas.rect.containsPoint(p)){
				clickedPoint = p;
			} else {
				mouseDownInside = false;
				e.stopImmediatePropagation();
			}
		}
	}
}
