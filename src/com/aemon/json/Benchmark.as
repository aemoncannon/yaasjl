package com.aemon.json{
	import flash.display.*;
	import flash.events.*;
	import flash.system.*;
	import flash.utils.*;
	import com.adobe.serialization.json.JSONDecoder;
	import com.adobe.serialization.json.JSONEncoder;

	public class Benchmark extends Sprite{


		public function Benchmark(){
			// Prep test data
			var test1:String = (new JSONEncoder(TEST1)).getString();
			var test1_b:ByteArray = new ByteArray();
			test1_b.writeUTFBytes(test1);
			test1_b.position = 0;

			var t:Number = getTimer();
			for(var i:int = 0; i < 100; i++){
				new JSONDecoder(test1);
			}
			var r1:Number = getTimer() - t;


			t = getTimer();
			for(i = 0; i < 100; i++){
				JSON.parse(test1_b, test1_b.length);
				test1_b.position = 0;
			}
			var r2:Number = getTimer() - t;


			throw new Error("as3corelibtime: " + r1 + "     newtime: " + r2);
		}


		public static const TEST1:Object = {"class":"industrynext.greenpoint.model.Canvas",
			"groups":[
				{
					"canvasId":0,
					"class":"industrynext.greenpoint.model.CanvasGroup",
					"displayAttributes":"",
					"id":43168023,
					"items":[
						{
							"author":null,
							"class":"industrynext.greenpoint.model.Image",
							"dateProduced":null,
							"dateUploaded":null,
							"description":null,
							"favoriteCount":0,
							"id":991312,
							"largeUrl":"http:\/\/farm4.static.flickr.com\/3280\/2889930544_4fcf99223f_b.jpg",
							"mediumUrl":"http:\/\/farm4.static.flickr.com\/3280\/2889930544_4fcf99223f.jpg",
							"originalUrl":null,
							"serviceProvider":"FLICKR",
							"sharedByUser":null,
							"smallUrl":"http:\/\/farm4.static.flickr.com\/3280\/2889930544_4fcf99223f_m.jpg",
							"sourceId":"2889930544",
							"tags":null,
							"thumbnailUrl":"http:\/\/farm4.static.flickr.com\/3280\/2889930544_4fcf99223f_s.jpg",
							"title":"My Grandson, Tyler (aka Indiana Jones) \/ Tricky Trails Corn Maze \/ Springridge Farm \/ Milton \/ Ontario",
							"type":"IMAGE",
							"url":null,
							"viewTimestamp":-1,
							"viewedByUser":null,
							"x":45.0,
							"y":50.0
						},
						{
							"author":null,
							"class":"industrynext.greenpoint.model.Image",
							"dateProduced":null,
							"dateUploaded":null,
							"description":null,
							"favoriteCount":0,
							"id":992309,
							"largeUrl":"http:\/\/farm4.static.flickr.com\/3213\/2889723717_1665f9c78b_b.jpg",
							"mediumUrl":"http:\/\/farm4.static.flickr.com\/3213\/2889723717_1665f9c78b.jpg",
							"originalUrl":null,
							"serviceProvider":"FLICKR",
							"sharedByUser":null,
							"smallUrl":"http:\/\/farm4.static.flickr.com\/3213\/2889723717_1665f9c78b_m.jpg",
							"sourceId":"2889723717",
							"tags":null,
							"thumbnailUrl":"http:\/\/farm4.static.flickr.com\/3213\/2889723717_1665f9c78b_s.jpg",
							"title":"Pipni zeku",
							"type":"IMAGE",
							"url":null,
							"viewTimestamp":-1,
							"viewedByUser":null,
							"x":436.75,
							"y":390.65
						},
						{
							"author":null,
							"class":"industrynext.greenpoint.model.Image",
							"dateProduced":null,
							"dateUploaded":null,
							"description":null,
							"favoriteCount":0,
							"id":991581,
							"largeUrl":"http:\/\/farm4.static.flickr.com\/3179\/2890281142_12f5268db8_b.jpg",
							"mediumUrl":"http:\/\/farm4.static.flickr.com\/3179\/2890281142_12f5268db8.jpg",
							"originalUrl":null,
							"serviceProvider":"FLICKR",
							"sharedByUser":null,
							"smallUrl":"http:\/\/farm4.static.flickr.com\/3179\/2890281142_12f5268db8_m.jpg",
							"sourceId":"2890281142",
							"tags":null,
							"thumbnailUrl":"http:\/\/farm4.static.flickr.com\/3179\/2890281142_12f5268db8_s.jpg",
							"title":"Baby bunny eating pellets",
							"type":"IMAGE",
							"url":null,
							"viewTimestamp":-1,
							"viewedByUser":null,
							"x":399.75,
							"y":229.95
						},
						{
							"author":null,
							"class":"industrynext.greenpoint.model.Image",
							"dateProduced":null,
							"dateUploaded":null,
							"description":null,
							"favoriteCount":0,
							"id":991578,
							"largeUrl":"http:\/\/farm4.static.flickr.com\/3155\/2890286892_f60e4fdc71_b.jpg",
							"mediumUrl":"http:\/\/farm4.static.flickr.com\/3155\/2890286892_f60e4fdc71.jpg",
							"originalUrl":null,
							"serviceProvider":"FLICKR",
							"sharedByUser":null,
							"smallUrl":"http:\/\/farm4.static.flickr.com\/3155\/2890286892_f60e4fdc71_m.jpg",
							"sourceId":"2890286892",
							"tags":null,
							"thumbnailUrl":"http:\/\/farm4.static.flickr.com\/3155\/2890286892_f60e4fdc71_s.jpg",
							"title":"Baby Bunny eating hay",
							"type":"IMAGE",
							"url":null,
							"viewTimestamp":-1,
							"viewedByUser":null,
							"x":363.95,
							"y":134.75
						},
						{
							"author":null,
							"class":"industrynext.greenpoint.model.Image",
							"dateProduced":null,
							"dateUploaded":null,
							"description":null,
							"favoriteCount":0,
							"id":991310,
							"largeUrl":"http:\/\/farm4.static.flickr.com\/3119\/2889132929_4082c40867_b.jpg",
							"mediumUrl":"http:\/\/farm4.static.flickr.com\/3119\/2889132929_4082c40867.jpg",
							"originalUrl":null,
							"serviceProvider":"FLICKR",
							"sharedByUser":null,
							"smallUrl":"http:\/\/farm4.static.flickr.com\/3119\/2889132929_4082c40867_m.jpg",
							"sourceId":"2889132929",
							"tags":null,
							"thumbnailUrl":"http:\/\/farm4.static.flickr.com\/3119\/2889132929_4082c40867_s.jpg",
							"title":"Easter's postcard",
							"type":"IMAGE",
							"url":null,
							"viewTimestamp":-1,
							"viewedByUser":null,
							"x":648.4,
							"y":510.4
						}
					],
					"name":"",
					"serviceProvider":"FLICKR",
					"sharedByUser":null,
					"sourceId":"",
					"type":"SUPER",
					"userId":null,
					"x":0.0,
					"y":0.0
				},
				{
					"canvasId":0,
					"class":"industrynext.greenpoint.model.CanvasGroup",
					"displayAttributes":"",
					"id":43168024,
					"items":[
					],
					"name":"",
					"serviceProvider":null,
					"sharedByUser":null,
					"sourceId":"",
					"type":"INBOX",
					"userId":null,
					"x":0.0,
					"y":0.0
				},
				{
					"canvasId":0,
					"class":"industrynext.greenpoint.model.CanvasGroup",
					"displayAttributes":"{\"windowWidth\":550,\"windowHeight\":490,\"state\":\"NORMAL\",\"expandedX\":779,\"expandedY\":143}",
					"id":43168025,
					"items":[
					],
					"name":"rabbits",
					"serviceProvider":"FLICKR",
					"sharedByUser":null,
					"sourceId":"rabbits",
					"type":"LIVE",
					"userId":null,
					"x":645.0,
					"y":224.0
				},
				{
					"canvasId":0,
					"class":"industrynext.greenpoint.model.CanvasGroup",
					"displayAttributes":"{\"windowWidth\":243,\"windowHeight\":218,\"state\":\"NORMAL\",\"expandedX\":535.4,\"expandedY\":160.4}",
					"id":43168026,
					"items":[
					],
					"name":"Unnamed",
					"serviceProvider":null,
					"sharedByUser":null,
					"sourceId":"",
					"type":"USER",
					"userId":null,
					"x":562.0,
					"y":186.0
				}
			],
			"id":28391,
			"type":"ACTIVE",
			"userId":"V2d42a31a9-fc4c-45bc-81b3-343b19dd1960",
			"x":0.0,
			"y":0.0,
			"visibility": "PUBLIC"
		};


	}
}
