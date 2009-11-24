/**
 * A class of MandelbrotSet
 */
package nori{
	import flash.geom.Point;
	
	public class MandelbrotSet extends Map{
		// just a zero origin holder.
		private var o:Point = new Point(0, 0);

		private var mColorList:Hash = new Hash({
			5.0  : 0x000000,
			7.0  : 0xff9900,
			10.0 : 0x33ffcc,
			15.0 : 0x6666cc,
			20.0 : 0x66ffff,
			30.0 : 0x9966cc
		});

	    private var colorIndexes:Array = mColorList.keys.sort(Array.NUMERIC);

		/**
		 * constructor of MandelbrotSet
		 */
		public function MandelbrotSet(){
			super();
			this.origin = new Point(-2.2, -1.5);
			this.size = new Point(3, 3);
		}

		/**
		 * getColor
		 */
		override public function getColor(c:Point):uint {
			var color:uint = 0xffffff;
			var z:Point = new Point(0, 0);
			var d:Number = 0; // distance
			
			for(var i:int = 0; i<=40; i++){
				z = calculateNext(z, c);
				d = Point.distance(o, z);
				if(d > 5.0) break;
			}

			return mColorList[colorIndexes.find(function(n:Object):Boolean{return n >= d})]
		}

		/**
		 * calculateNext
		 */
		private function calculateNext(z:Point, c:Point):Point {
			return new Point(z.x * z.x - z.y * z.y + c.x,
                             2 * z.x * z.y + c.y);
		}
    }
}
