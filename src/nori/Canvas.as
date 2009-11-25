/**
 * A class of Canvas
 */
package nori{
	import flash.display.*;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.Matrix;

	public class Canvas extends Sprite{
		private var mMatrix:Matrix;
		private var mPlotter:Plotter;
		private const DISPLAY_SIZE:Point = new Point(500, 400);
		private const RESOLUTION:Point = new Point(300, 200);
		private var DotSize:Point  = new Point(DISPLAY_SIZE.x / RESOLUTION.x, DISPLAY_SIZE.y / RESOLUTION.y);
		public var onDrawBegin:Function = null;     // call back function on draw beging
		public var onDrawFinished:Function = null;  // call back function on draw finishxed

		/**
		 * constructor of Canvas
		 */
		public function Canvas(){
			mPlotter = new Plotter(this, RESOLUTION);
			mPlotter.map = new MandelbrotSet();
			
			this.mouseEnabled = false;
		}

		/**
		 * getter
		 *
		 *  > size
		 *  > rect
		 */
		public function get size():Point { return DISPLAY_SIZE;	} // size
		public function get rect():Rectangle { return new Rectangle(0, 0, size.x, size.y); } // rect
		
		/**
		 * set map
		 */
		public function set map(map:Map):void {
			mPlotter.map = map;
		}
		
		/**
		 * draw
		 */
		public function draw():void {
			graphics.clear();
			mMatrix = new Matrix();
			setupMatrix();
			
			if (onDrawBegin != null) onDrawBegin(mPlotter.origin, mPlotter.size);
			
			mPlotter.draw();
			
			if (onDrawFinished != null) onDrawFinished();
		}

		/**
		 * zoomRect
		 *   setup a zooming size by specifying rectangle in the display coordinate.
		 */
		public function zoomRect(rect:Rectangle):void {
			var invMatrix:Matrix = mMatrix.clone();
			invMatrix.invert();

			mPlotter.origin = invMatrix.transformPoint(rect.topLeft);
			mPlotter.size =   invMatrix.transformPoint(rect.bottomRight).subtract(mPlotter.origin);
		}
		

		/**
		 * plot
		 */
		public function plot(point:Point, color:uint):void {
			point = mMatrix.transformPoint(point);

			graphics.lineStyle(1, color);
			graphics.beginFill(color);
			graphics.drawRect(point.x, point.y, DotSize.x, DotSize.y);
			graphics.endFill();
		}
		
		/**
		 * setupMatrix
		 */
		private function setupMatrix():void {
			mMatrix.translate(
				-mPlotter.origin.x, 
				-mPlotter.origin.y
			);

			mMatrix.scale(
				DISPLAY_SIZE.x / mPlotter.size.x,
				DISPLAY_SIZE.y / mPlotter.size.y
			);
		}
	}
}
