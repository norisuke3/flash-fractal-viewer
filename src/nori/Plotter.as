/**
 * A class of Plotter
 */
package nori{
	import flash.geom.Point;
	import flash.geom.Rectangle;

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
		 * getters
		 *   > map
		 *   > origin
		 *   > size
		 */
		public function get map():Map      { return mMap;    } // map
		public function get origin():Point { return mOrigin; } // origin
		public function get size():Point   { return mSize;   } // size
		
		/**
		 * settters
		 *   > origin
		 *   > size
		 *   > rect
		 */
		public function set origin(p:Point):void   { mOrigin = p; } // origin
		public function set size(p:Point):void     { mSize = p;	  } // size
		public function set rect(r:Rectangle):void { mOrigin = r.topLeft; mSize = r.size; } // rect
		
		
		/**
		 * set map
		 */
		public function set map(map:Map):void{
			mMap = map;
			mOrigin = map.origin;
			mSize = map.size;
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
