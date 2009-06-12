package com.aemon.json{
	import flash.utils.*;

	public class Token{

		public static const TYPE_ERROR:int = 0;
		public static const TYPE_EOF:int = 1;
		public static const TYPE_LBRACE:int = 2;
		public static const TYPE_RBRACE:int = 3;
		public static const TYPE_LBRACKET:int = 4;
		public static const TYPE_RBRACKET:int = 5;
		public static const TYPE_COMMA:int = 6;
		public static const TYPE_COLON:int = 8;
		public static const TYPE_BOOL:int = 9;
		public static const TYPE_NULL:int = 10;
		public static const TYPE_STRING:int = 11;
		public static const TYPE_NUMBER:int = 12;
		public static const TYPE_INTEGER:int = 13;
		public static const TYPE_DOUBLE:int = 14;

		public static const ERROR:Token = new Token(TYPE_ERROR, "error");
		public static const EOF:Token = new Token(TYPE_EOF, "eof");
		public static const LBRACE:Token = new Token(TYPE_LBRACE, "{");
		public static const RBRACE:Token = new Token(TYPE_RBRACE, "}");
		public static const LBRACKET:Token = new Token(TYPE_LBRACKET, "[");
		public static const RBRACKET:Token = new Token(TYPE_RBRACKET, "]");
		public static const COMMA:Token = new Token(TYPE_COMMA, ",");
		public static const COLON:Token = new Token(TYPE_COLON, ":");
		public static const TRUE:Token = new Token(TYPE_BOOL, "true");
		public static const FALSE:Token = new Token(TYPE_BOOL, "false");
		public static const NULL:Token = new Token(TYPE_NULL, "null");

		public static function STRING(str:String):Token{ return new Token(TYPE_STRING, str); }
		public static function NUMBER(num:Number):Token{ return new Token(TYPE_NUMBER, num); }
		public static function INTEGER(num:int):Token{ return new Token(TYPE_INTEGER, num); }
		public static function DOUBLE(num:Number):Token{ return new Token(TYPE_DOUBLE, num); }

		public var type:int;
		public var data:*;

		public function Token(type:int, data:*):void{
			this.type = type;
			this.data = data;
		}

		public function toString():String{ return String(data); }

	}

}
