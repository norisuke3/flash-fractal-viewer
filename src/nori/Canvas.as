/**
 * A class of Canvas
 */
package nori{
	import flash.display.*;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.Matrix;

	public class Canvas extends Shape{
		private var mMatrix:Matrix;
		private var mPlotter:Plotter;
		private const DISPLAY_SIZE:Point = new Point(250, 200);
		private const RESOLUTION:Point = new Point(300, 250);

		/**
		 * constructor of Canvas
		 */
		public function Canvas(){
			mPlotter = new Plotter(this, RESOLUTION);
			mPlotter.map = new MandelbrotSet();
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
		 * draw
		 */
		public function draw():void {
			graphics.clear();
			mMatrix = new Matrix();
			setupMatrix();
			mPlotter.draw();
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
			graphics.moveTo(point.x, point.y);
			graphics.lineTo(point.x + 0.1, point.y + 0.1);
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
