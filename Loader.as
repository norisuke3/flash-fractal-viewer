/**
 * A class of Loader
 */
package {
	import nori.*;
	import flash.display.Sprite;

	public class Loader extends Sprite{
	
		/**
		 * constructor of Loader
		 */
		public function Loader(){
			addChild(new Canvas());
		}
	}
}
