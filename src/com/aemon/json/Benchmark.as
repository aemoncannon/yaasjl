package com.aemon.json{
	import flash.display.*;
	import flash.events.*;
	import flash.system.*;
	import flash.utils.*;
	import com.adobe.serialization.json.JSONDecoder;
	import com.adobe.serialization.json.JSONEncoder;
	import json.*;

	public class Benchmark extends Sprite{


		[Embed(source="../../../../data/ohai.json", mimeType="application/octet-stream")]
		protected const Test1:Class;

		[Embed(source="../../../../data/pass.unicode.json", mimeType="application/octet-stream")]
		protected const Test2:Class;

		[Embed(source="../../../../data/pass.contacts.json", mimeType="application/octet-stream")]
		protected const Test3:Class;

		[Embed(source="../../../../data/pass.deep_arrays.json", mimeType="application/octet-stream")]
		protected const Test4:Class;


		public function Benchmark(){
			var test1:ByteArray = ByteArray(new Test1);
			var test2:ByteArray = ByteArray(new Test2);
			var test3:ByteArray = ByteArray(new Test3);
			var test4:ByteArray = ByteArray(new Test4);

			var test1_s:String = test1.toString();
			var test2_s:String = test2.toString();
			var test3_s:String = test3.toString();
			var test4_s:String = test4.toString();


			var iterations:int = 1;

			var t:Number = getTimer();
			for(var i:int = 0; i < iterations; i++){
				decodeWithCorelib(test1_s);
				decodeWithCorelib(test2_s);
				decodeWithCorelib(test3_s);
				decodeWithCorelib(test4_s);
			}
			var r1:Number = getTimer() - t;


			t = getTimer();
			for(i = 0; i < iterations; i++){
				decodeWithYaasjl(test1);
				decodeWithYaasjl(test2);
				decodeWithYaasjl(test3);
				decodeWithYaasjl(test4);
			}
			var r2:Number = getTimer() - t;


			t = getTimer();
			for(i = 0; i < iterations; i++){
				decodeWithJSwoof(test1_s);
				decodeWithJSwoof(test2_s);
				decodeWithJSwoof(test3_s);
				decodeWithJSwoof(test4_s);
			}
			var r3:Number = getTimer() - t;


			throw new Error("as3corelibtime: " + r1 + " yaasjl: " + r2 + " JSwoof: " + r3);
		}


		private function decodeWithCorelib(s:String):void{
			new JSONDecoder(s);
		}


		private function decodeWithYaasjl(b:ByteArray):*{
			JSON.parse(b, b.length);
			b.position = 0;	
		}

		private function decodeWithJSwoof(s:String):*{
			JParser.decode(s);
		}


	}
}
