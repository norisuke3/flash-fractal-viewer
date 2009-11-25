/**
 * A class of Map
 */
package nori{
	import flash.geom.Point;

	public class Map {
		private var mOrigin:Point;
		private var mSize:Point;
		
		/**
		 * constructor of Map
		 */
		public function Map(){
			mOrigin = new Point(0, 0);
			mSize = new Point(1, 1);
		}

		/**
		 * get origin
		 */
		public function get origin():Point {
			return mOrigin;
		}
		
		/**
		 * set
		 */
		public function set origin(p:Point):void {
			mOrigin = p;
		}
		

		/**
		 * get size
		 */
		public function get size():Point {
			return mSize;
		}
		
		/**
		 * set size
		 */
		public function set size(p:Point):void {
			mSize = p;
		}
		

		/**
		 * getColor()
		 */
		public function getColor(point:Point):uint {
			return 0x000000;

		}
	}
}
