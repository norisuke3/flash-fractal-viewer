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
			var canvas:Canvas;

			setupObjectPrototype();
			setupArrayPrototype();

			canvas = new Canvas();
			addChild(canvas);
			canvas.draw();
		}

		/**
		 * setupObjectPrototype
		 *
		 * By calling this, we can do the following.
		 * Changing the following code from:
		 *
		 *   > var t = new TextField();
		 *   > t.x = 10;
		 *   > t.y = 10;
		 *   > t.width = 400;
		 *   > t.height = 400;
		 *   > t.text = 'Hello';
		 *   > addChild(t);
		 *
		 * to:
		 *
		 *   > addChild(new MyTextField()._merge({ x: 10, y: 10, width: 400, height: 400 , text: 'Hello'}));
		 *
		 * when we defince a dynamic class MyTextField extending TextField class.
		 */
		private function setupObjectPrototype():void {
			// adding _def(p, o) to Object.prototype
			Object.prototype._def = function(p:Object, o:Object):void{
				this[p] = o;
				this.setPropertyIsEnumerable(p, false);
			}
			Object.prototype.setPropertyIsEnumerable('_def', false);

			// adding _merge(o) to Object.prototype
			Object.prototype._def('_merge', function(o:Object):Object{
					for(var p:Object in o) this[p] = o[p];
					return this;
			});
		}

		/**
		 * setupArrayPrototype
		 *   adding the following methods:
		 *
		 *     > find()
		 */
		private function setupArrayPrototype():void {
			/**
			 * return the first element in the Array object with which the callback function returns true.
			 */
			Array.prototype.find = function(callback:Function):Object{
				var result:Object = null;

				for (var i:int = 0; i < this.length; i++){
					if(callback(this[i])){
						result = this[i];
						break;
					}
				}
				
				return result;
			}
		}
		
	}
}