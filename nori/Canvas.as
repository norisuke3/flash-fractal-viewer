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
		private const DISPLAY_SIZE:Point = new Point(250, 200);
		private const RESOLUTION:Point = new Point(300, 250);

		/**
		 * constructor of Canvas
		 */
		public function Canvas(){
			mPlotter = new Plotter(this, RESOLUTION);
			mPlotter.map = new ColoredMandelbrotSet();
		}

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
