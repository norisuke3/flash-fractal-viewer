
/**
 * A class of Tween
 *   Usage:
 *      var tween1:Tween = new Tween(target)._merge({
 *          prop       : 'x',   begin      : 0,
 *          finish     : 500,   duration   : 2,
 *          useSeconds : true,  edging     : 100
 *      });
 *     
 *      tween1.start();
 */
package lib {
	import flash.events.Event;
	
	public dynamic class Tween {
		private var mTarget:Object;
		public var prop:String;
		public var begin:Number;
		public var finish:Number;
		public var duration:Number;
		public var useSeconds:Boolean = false;
		public var edging:Number = 0;

		private var step:Number;
		private var maxCount:Number;
		private var counter:uint;

		/**
		 * constructor of Tween
		 */
		public function Tween(obj:Object){
			mTarget = obj;
		}

		/**
		 * run
		 */
		public function start():void {
			var countUnit:Number = useSeconds ? mTarget.stage.frameRate : 1;
			maxCount = countUnit * duration;
			counter = 0;

			mTarget.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		

		/**
		 * enterFrameHandler
		 */
		private function enterFrameHandler(e:Event):void {
			var progress:Number = counter / maxCount;
			
			mTarget[prop] = ( finish - begin ) * 
			                ( progress + edging/(100*Math.PI) * Math.sin( Math.PI * progress ) ) + begin;

			if ( counter++ >= maxCount ) {
				mTarget.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			}
		}
	}
}