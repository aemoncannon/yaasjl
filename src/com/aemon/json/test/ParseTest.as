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


		public function testTrivial():void{
			assertEquals("Should be the same.", "0", roundTrip("0"));
			assertEquals("Should be the same.", "[]", roundTrip("[]"));
			assertEquals("Should be the same.", "{}", roundTrip("{}"));
			assertEquals("Should be the same.", "0.5", roundTrip("0.5"));
			assertEquals("Should be the same.", "2312323", roundTrip("2312323"));
			assertEquals("Should be the same.", "\"hello\"", roundTrip("\"hello\""));
		}

		public function testBasic():void{
			var src:String = "{\"thing\":[1,2,3,4],\"sd\":1,\"dog\":{\"legs\":4,\"name\":\"josh\"}}";
			assertEquals("Should be the same.", src, roundTrip(src));
		}

		public function testDeeperNesting():void{
			var src:String = "{\"thing\":[1,2,3,4,{\"face\":2,\"neck\":[33.023,{\"hello\":1}]}]}";
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