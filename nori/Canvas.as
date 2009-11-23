/**
 * A class of Canvas
 */
package nori{
	import flash.display.*;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.Matrix;

	public class Canvas extends Sprite{
		private var mMatrix:Matrix = new Matrix();
		private const DISPLAY_SIZE:Point = new Point(250, 200);
		private const RESOLUTION:Point = new Point(300, 250);

		/**
		 * constructor of Canvas
		 */
		public function Canvas(){
			var plotter:Plotter = new Plotter(this, RESOLUTION);
			
			plotter.map = new ColoredMandelbrotSet();

			setupMatrix(plotter);
			plotter.draw();
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
		private function setupMatrix(plotter:Plotter):void {
			mMatrix.translate(
				-plotter.origin.x, 
				-plotter.origin.y
			);

			mMatrix.scale(
				DISPLAY_SIZE.x / plotter.size.x,
				DISPLAY_SIZE.y / plotter.size.y
			);
		}
		
	}
}
