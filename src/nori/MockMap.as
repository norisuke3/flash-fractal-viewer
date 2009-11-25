/**
 * A class of MockMap
 */
package nori{
	import flash.geom.Point;

	public class MockMap extends Map {
	
		/**
		 * constructor of MockMap
		 */
		public function MockMap(){
			super.origin = new Point(-0.5, -0.5);
			super.size = new Point(1, 1);
		}

		/**
		 * getColor
		 */
		override public function getColor(point:Point):uint {
			return 0xffff00;
		}
		
	}
}
