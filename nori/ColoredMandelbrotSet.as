/**
 * A class of ColoredMandelbrotSet
 */
package nori{
	import flash.geom.Point;
	
	public class ColoredMandelbrotSet extends Map{
	
		/**
		 * constructor of ColoredMandelbrotSet
		 */
		public function ColoredMandelbrotSet(){
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

			
			for(var i:int = 0; i<=40; i++){
				z = calculateNext(z, c);
				if(distance(z) > 5.0) break;
			}

			if (distance(z) <= 5.0){
				color = 0x000000;
				
			} else if (distance(z) <= 7.0){
				color = 0xff9900;

			} else if (distance(z) <= 10.0){
				color = 0x33ffcc;

			} else if (distance(z) <= 15.0){
				color = 0x6666cc;
			}

			return color;
		}

		/**
		 * calculateNext
		 */
		private function calculateNext(z:Point, c:Point):Point {
			return new Point(z.x * z.x - z.y * z.y + c.x,
                             2 * z.x * z.y + c.y);
		}
		
		/**
		 * distance
		 */
		private function distance(p:Point):Number {
			return Math.sqrt(p.x * p.x + p.y * p.y);
		}
    }
}
