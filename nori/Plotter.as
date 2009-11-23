/**
 * A class of Plotter
 */
package nori{
	import flash.geom.Point;

	public class Plotter {
		private var mOrigin:Point;
		private var mSize:Point;
		private var mResolution:Point;
		private var mMap:Map;
		private var mCanvas:Canvas;
	
		/**
		 * constructor of Plotter
		 */
		public function Plotter(canvas:Canvas, resolution:Point){
			mCanvas = canvas;
			mResolution = resolution;
		}

		/**
		 * set map
		 */
		public function set map(map:Map):void{
			mMap = map;
			mOrigin = map.origin;
			mSize = map.size;
		}

		/**
		 * get map
		 */
		public function get map():Map {
			return mMap
		}

		/**
		 * get origin
		 */
		public function get origin():Point {
			return mOrigin;
		}

		/**
		 * get size
		 */
		public function get size():Point {
			return mSize;
		}
		
		
		
		/**
		 * draw
		 */
		public function draw():void {
			if(!mMap) return;

			var x:Number;
			var y:Number;
			var step_x:Number = mSize.x / mResolution.x;
			var step_y:Number = mSize.y / mResolution.y;
			var p:Point;
			var color:uint;

 			for(x = mOrigin.x; x <= mOrigin.x + mSize.x; x += step_x){
 				for(y = mOrigin.y; y <= mOrigin.y + mSize.y; y += step_y){
					p = new Point(x, y);
					color = mMap.getColor(p);
					mCanvas.plot(p, color);
				}
 			}
		}
		
	}
}
