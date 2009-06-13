package com.aemon.json.test{
	import flexunit.framework.TestCase;
 	import flexunit.framework.TestSuite;
	import flash.utils.*;
	import com.aemon.json.JSON;
	import com.adobe.serialization.json.JSONDecoder;
	import com.adobe.serialization.json.JSONEncoder;

	public class ParseTest extends TestCase {
		
		override public function setUp():void {
		}
		
		override public function tearDown():void {
		}

		public function test1():void{
			var src:String = "{ \"dog\":{\"legs\": 4, \"name\": \"josh\" }}";
			assertEquals("Should be the same.", src, roundTrip(src));
		}

		private function roundTrip(str:String):String{
			var b:ByteArray = new ByteArray();
			b.writeUTFBytes(str);
			b.position = 0;
			var val:* = JSON.parse(b, b.length);
			return (new JSONEncoder(val).getString());
		}

	}

}