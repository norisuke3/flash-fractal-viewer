/**
 * A class of Hash
 */
package nori{
	public dynamic class Hash {
	
		/**
		 * constructor of Hash
		 */
		public function Hash(o:Object){
			this._merge(o);
		}

		/**
		 * get keys
		 */
		public function get keys():Array {
			var keys:Array = new Array();

			for (var key:Object in this){
				keys.push(key);
			}
			
			return keys;
		}
		
	}
}
