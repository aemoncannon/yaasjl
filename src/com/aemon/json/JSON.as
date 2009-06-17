package com.aemon.json{
	import flash.utils.*;

	public class JSON{

		private static const CHAR_BACK_SLASH:int = 0x5c;
		private static const CHAR_FORWARD_SLASH:int = 0x2f;
		private static const CHAR_DOUBLE_QUOTE:int = 0x22;
		private static const CHAR_LBRACE:int = 0x7b;
		private static const CHAR_RBRACE:int = 0x7d;
		private static const CHAR_LBRACKET:int = 0x5b;
		private static const CHAR_RBRACKET:int = 0x5d;
		private static const CHAR_COMMA:int = 0x2c;
		private static const CHAR_COLON:int = 0x3a;
		private static const CHAR_PERIOD:int = 0x2e;
		private static const CHAR_SPACE:int = 0x20;
		private static const CHAR_MINUS:int = 0x2d;
		private static const CHAR_PLUS:int = 0x2b;

		private static const CHAR_TAB:int = 0x9;
		private static const CHAR_LF:int = 0xa;
		private static const CHAR_VTAB:int = 0xb;
		private static const CHAR_FORM_FEED:int = 0xc;
		private static const CHAR_CARRIAGE_RETURN:int = 0xd;

		private static const CHAR_A:int = 0x61;
		private static const CHAR_B:int = 0x62;
		private static const CHAR_C:int = 0x63;
		private static const CHAR_D:int = 0x64;
		private static const CHAR_E:int = 0x65;
		private static const CHAR_F:int = 0x66;
		private static const CHAR_G:int = 0x67;
		private static const CHAR_H:int = 0x68;
		private static const CHAR_I:int = 0x69;
		private static const CHAR_J:int = 0x6a;
		private static const CHAR_K:int = 0x6b;
		private static const CHAR_L:int = 0x6c;
		private static const CHAR_M:int = 0x6d;
		private static const CHAR_N:int = 0x6e;
		private static const CHAR_O:int = 0x6f;
		private static const CHAR_P:int = 0x70;
		private static const CHAR_Q:int = 0x71;
		private static const CHAR_R:int = 0x72;
		private static const CHAR_S:int = 0x73;
		private static const CHAR_T:int = 0x74;
		private static const CHAR_U:int = 0x75;
		private static const CHAR_V:int = 0x76;
		private static const CHAR_W:int = 0x77;
		private static const CHAR_X:int = 0x78;
		private static const CHAR_Y:int = 0x79;
		private static const CHAR_Z:int = 0x7a;

		private static const CHAR_CAP_A:int = 0x41;
		private static const CHAR_CAP_B:int = 0x42;
		private static const CHAR_CAP_C:int = 0x43;
		private static const CHAR_CAP_D:int = 0x44;
		private static const CHAR_CAP_E:int = 0x45;
		private static const CHAR_CAP_F:int = 0x46;
		private static const CHAR_CAP_G:int = 0x47;
		private static const CHAR_CAP_H:int = 0x48;
		private static const CHAR_CAP_I:int = 0x49;
		private static const CHAR_CAP_J:int = 0x4a;
		private static const CHAR_CAP_K:int = 0x4b;
		private static const CHAR_CAP_L:int = 0x4c;
		private static const CHAR_CAP_M:int = 0x4d;
		private static const CHAR_CAP_N:int = 0x4e;
		private static const CHAR_CAP_O:int = 0x4f;
		private static const CHAR_CAP_P:int = 0x50;
		private static const CHAR_CAP_Q:int = 0x51;
		private static const CHAR_CAP_R:int = 0x52;
		private static const CHAR_CAP_S:int = 0x53;
		private static const CHAR_CAP_T:int = 0x54;
		private static const CHAR_CAP_U:int = 0x55;
		private static const CHAR_CAP_V:int = 0x56;
		private static const CHAR_CAP_W:int = 0x57;
		private static const CHAR_CAP_X:int = 0x58;
		private static const CHAR_CAP_Y:int = 0x59;
		private static const CHAR_CAP_Z:int = 0x5a;

		private static const CHAR_0:int = 0x30;
		private static const CHAR_1:int = 0x31;
		private static const CHAR_2:int = 0x32;
		private static const CHAR_3:int = 0x33;
		private static const CHAR_4:int = 0x34;
		private static const CHAR_5:int = 0x35;
		private static const CHAR_6:int = 0x36;
		private static const CHAR_7:int = 0x37;
		private static const CHAR_8:int = 0x38;
		private static const CHAR_9:int = 0x39;

		private static const ERROR_LEX_STRING_INVALID_HEX_CHAR:String = "Lexer error: Invalid hex character.";
		private static const ERROR_LEX_STRING_INVALID_ESCAPED_CHAR:String = "Lexer error: Invalid escaped character.";
		private static const ERROR_LEX_STRING_INVALID_JSON_CHAR:String = "Lexer error: Invalid json character.";
		private static const ERROR_LEX_INVALID_CHAR:String = "Lexer error: Invalid character.";
		private static const ERROR_LEX_MISSING_INTEGER_AFTER_MINUS:String = "Lexer error: Missing integer after minus.";
		private static const ERROR_LEX_MISSING_INTEGER_AFTER_DECIMAL:String = "Lexer error: Missing integer after decimal.";
		private static const ERROR_LEX_MISSING_INTEGER_AFTER_EXPONENT:String = "Lexer error: Missing integer after exponent.";

		private static const PARSE_STATE_START:int = 0;
		private static const PARSE_STATE_PARSE_COMPLETE:int = 1;
		private static const PARSE_STATE_PARSE_ERROR:int = 2;
		private static const PARSE_STATE_LEXICAL_ERROR:int = 3;
		private static const PARSE_STATE_MAP_START:int = 4;
		private static const PARSE_STATE_MAP_SEP:int = 5;
		private static const PARSE_STATE_MAP_NEED_VAL:int = 6;
		private static const PARSE_STATE_MAP_GOT_VAL:int = 7;
		private static const PARSE_STATE_MAP_NEED_KEY:int = 8;
		private static const PARSE_STATE_ARRAY_START:int = 9;
		private static const PARSE_STATE_ARRAY_GOT_VAL:int = 10;
		private static const PARSE_STATE_ARRAY_NEED_VAL:int = 11;

		private static function parseStateToString(s:int):String{
			switch(s){
				case PARSE_STATE_START: return "PARSE_STATE_START";
				case PARSE_STATE_PARSE_COMPLETE: return "PARSE_STATE_PARSE_COMPLETE";
				case PARSE_STATE_PARSE_ERROR: return "PARSE_STATE_PARSE_ERROR";
				case PARSE_STATE_LEXICAL_ERROR: return "PARSE_STATE_LEXICAL_ERROR";
				case PARSE_STATE_MAP_START: return "PARSE_STATE_MAP_START";
				case PARSE_STATE_MAP_SEP: return "PARSE_STATE_MAP_SEP";
				case PARSE_STATE_MAP_NEED_VAL: return "PARSE_STATE_MAP_NEED_VAL";
				case PARSE_STATE_MAP_GOT_VAL: return "PARSE_STATE_MAP_GOT_VAL";
				case PARSE_STATE_MAP_NEED_KEY: return "PARSE_STATE_MAP_NEED_KEY";
				case PARSE_STATE_ARRAY_START: return "PARSE_STATE_ARRAY_START";
				case PARSE_STATE_ARRAY_GOT_VAL: return "PARSE_STATE_ARRAY_GOT_VAL";
				case PARSE_STATE_ARRAY_NEED_VAL: return "PARSE_STATE_ARRAY_NEED_VAL";
			}
			return "Unknown parse state!";
		}


		private static function readChar(jsonText:ByteArray):int{
			return jsonText.readByte();
		}

		private static function unreadChar(jsonText:ByteArray):int{
			return jsonText.position--;
		}

		/* a lookup table which lets us quickly determine three things:
		* VEC - valid escaped conrol char
		* IJC - invalid json char
		* VHC - valid hex char
		* note. the solidus '/' may be escaped or not.
		* note. the
		*/
		private static const VEC:int =  1
		private static const IJC:int =  2
		private static const VHC:int =  4
		private static const charLookupTable:Array =
		[
			/*00*/ IJC , IJC , IJC , IJC , IJC , IJC , IJC , IJC ,
			/*08*/ IJC , IJC , IJC , IJC , IJC , IJC , IJC , IJC ,
			/*10*/ IJC , IJC , IJC , IJC , IJC , IJC , IJC , IJC ,
			/*18*/ IJC , IJC , IJC , IJC , IJC , IJC , IJC , IJC ,
			
			/*20*/ 0 , 0 , VEC|IJC, 0 , 0 , 0 , 0 , 0 ,
			/*28*/ 0 , 0 , 0 , 0 , 0 , 0 , 0 , VEC ,
			/*30*/ VHC , VHC , VHC , VHC , VHC , VHC , VHC , VHC ,
			/*38*/ VHC , VHC , 0 , 0 , 0 , 0 , 0 , 0 ,
			
			/*40*/ 0 , VHC , VHC , VHC , VHC , VHC , VHC , 0 ,
			/*48*/ 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			/*50*/ 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			/*58*/ 0 , 0 , 0 , 0 , VEC|IJC, 0 , 0 , 0 ,
			
			/*60*/ 0 , VHC , VEC|VHC, VHC , VHC , VHC , VEC|VHC, 0 ,
			/*68*/ 0 , 0 , 0 , 0 , 0 , 0 , VEC , 0 ,
			/*70*/ 0 , 0 , VEC , 0 , VEC , 0 , 0 , 0 ,
			/*78*/ 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			
			/* include these so we don't have to always check the range of the char */
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
		];



		/** process a variable length utf8 encoded codepoint.
		*
		* returns:
		* yajl_tok_string - if valid utf8 char was parsed and offset was
		* advanced
		* yajl_tok_eof - if end of input was hit before validation could
		* complete
		* yajl_tok_error - if invalid utf8 was encountered
		*
		* NOTE: on error the offset will point to the first char of the
		* invalid utf8 */
		// 		private static Token lexUTF8Char(
		// 			jsonText:ByteArray,
		//             jsonTextLen:int, 
		//             curChar:int)
		// 		{
		// 			if (curChar <= 0x7f) {
		// 				/* single byte */
		// 				return yajl_tok_string;
		// 			} else if ((curChar >> 5) == 0x6) {
		// 				/* two byte */
		// 				curChar = readChar(jsonText);
		// 				if ((curChar >> 6) == 0x2) return yajl_tok_string;
		// 			} else if ((curChar >> 4) == 0x0e) {
		// 				/* three byte */
		// 				curChar = readChar(jsonText);
		// 				if ((curChar >> 6) == 0x2) {
		// 					curChar = readChar(jsonText);
		// 					if ((curChar >> 6) == 0x2) return yajl_tok_string;
		// 				}
		// 			} else if ((curChar >> 3) == 0x1e) {
		// 				/* four byte */
		// 				curChar = readChar(jsonText);
		// 				if ((curChar >> 6) == 0x2) {
		// 					curChar = readChar(jsonText);
		// 					if ((curChar >> 6) == 0x2) {
		// 						curChar = readChar(jsonText);
		// 						if ((curChar >> 6) == 0x2) return yajl_tok_string;
		// 					}
		// 				}
		// 			}
		
		// 			return yajl_tok_error;
		// 		}



		private static function unescapeString(source:String) : String {
			var result:String = "";
			var curPos:int = 0;
			var endPos:int = source.length;
			while (curPos < endPos) {
				// we do not go character-by-character, so we speed up
				// process greatly compare to how JSON parser does it
				var si:int = source.indexOf("\\", curPos);
				if (si > -1) {
					// found escape character
					result += source.substring(curPos, si);
					curPos = si+2;
					// part of below code is similar to what is in JSONTokenizer
					var c:String = source.charAt(si+1);
					switch ( c ) {
						case '"': result += '"'; break;
						case '/': result += '/'; break;
						case '\\': result += '\\'; break;
						case 'b': result += '\b'; break;
						case 'f': result += '\f'; break;
						case 'n': result += '\n'; break;
						case 'r': result += '\r'; break;
						case 't': result += '\t'; break;
						case 'u': {
							// convert 4 next hex digits into unicode char
							// unlike in JSON parser, here we ignore any errors
							// checking for the sake of performance
							var hexValue:String = source.substr(si+2, 4);
							result += String.fromCharCode(parseInt(hexValue, 16));
							curPos += 4;
							break;
						}
						default: result += '\\' + c;
					}
				} else {
					result += source.substr(curPos);
					break;
				}
			}
			return result;
		}


		/* lex a string. input is the lexer, pointer to beginning of
		* json text, and start of string (offset).
		* a token is returned which has the following meanings:
		* yajl_tok_string: lex of string was successful. offset points to
		* terminating '"'.
		* yajl_tok_eof: end of text was encountered before we could complete
		* the lex.
		* yajl_tok_error: embedded in the string were unallowable chars. offset
		* points to the offending char
		*/
		private static function lexString(jsonText:ByteArray):Token
		{
			var tok:Token = Token.ERROR;
			var hasEscapes:Boolean = false;
			var startOffset:int = jsonText.position;
			
			for (;;) {
				var curChar:int;

				curChar = readChar(jsonText);
				
				/* quote terminates */
				if (curChar == CHAR_DOUBLE_QUOTE) {
					// Read the string data
					var p:int = jsonText.position;
					jsonText.position = startOffset;
					var s:String = jsonText.readUTFBytes(p - startOffset - 1);
					jsonText.position = p;

					if (hasEscapes) {
						return Token.STRING(unescapeString(s))
					}
					else{
						return Token.STRING(s);
					}
				}
				/* backslash escapes a set of control chars, */
				else if (curChar == CHAR_BACK_SLASH) {
					hasEscapes = true;
					
					/* special case \u */
					curChar = readChar(jsonText);
					if (curChar == CHAR_U) {
						var i:int = 0;
						for (i=0; i < 4; i++) {
							curChar = readChar(jsonText);
							if (!(charLookupTable[curChar] & VHC)){
								/* back up to offending char */
								unreadChar(jsonText);
								throw new Error(ERROR_LEX_STRING_INVALID_HEX_CHAR);
							}
						}
					} else if (!(charLookupTable[curChar] & VEC)) {
						/* back up to offending char */
						unreadChar(jsonText);
						throw new Error(ERROR_LEX_STRING_INVALID_ESCAPED_CHAR);
					}
				}
				/* when not validating UTF8 it's a simple table lookup to determine
				* if the present character is invalid */
				else if(charLookupTable[curChar] & IJC) {
					/* back up to offending char */
					unreadChar(jsonText);
					throw new Error(ERROR_LEX_STRING_INVALID_JSON_CHAR);
				}
				/* when in validate UTF8 mode we need to do some extra work */
				// 				else if (lexer->validateUTF8) {
				// 					yajl_tok t = yajl_lex_utf8_char(lexer, jsonText, jsonTextLen,
				//                         offset, curChar);
				
				// 					if (t == yajl_tok_eof) {
				// 						tok = yajl_tok_eof;
				// 						goto finish_string_lex;
				// 					} else if (t == yajl_tok_error) {
				// 						lexer->error = yajl_lex_string_invalid_utf8;
				// 						goto finish_string_lex;
				// 					}
				// 				}
				/* accept it, and move on */
			}
			
			return tok;
		}



		private static function lexNumber(jsonText:ByteArray):Token{
			/** XXX: numbers are the only entities in json that we must lex
			* _beyond_ in order to know that they are complete. There
			* is an ambiguous case for integers at EOF. */
			
			var c:int;
			//			var tok:Token = Token.INTEGER(NaN);
			var startOffset:int = jsonText.position;

			c = readChar(jsonText);
			
			/* optional leading minus */
			if (c == CHAR_MINUS) {
				c = readChar(jsonText);
			}
			
			/* a single zero, or a series of integers */
			if (c == CHAR_0) {
				c = readChar(jsonText);
			} else if (c >= CHAR_1 && c <= CHAR_9) {
				do {
					c = readChar(jsonText);
				} while (c >= CHAR_0 && c <= CHAR_9);
			} else {
				unreadChar(jsonText);
				throw new Error(ERROR_LEX_MISSING_INTEGER_AFTER_MINUS);
			}
			
			/* optional fraction (indicates this is floating point) */
			if (c == CHAR_PERIOD) {
				var numRd:int = 0;
				c = readChar(jsonText);
				
				while (c >= CHAR_0 && c <= CHAR_9) {
					numRd++;
					c = readChar(jsonText);
				}
				if (!numRd) {
					unreadChar(jsonText);
					throw new Error(ERROR_LEX_MISSING_INTEGER_AFTER_DECIMAL);
				}
				//tok = Token.DOUBLE(NaN);
			}
			
			/* optional exponent (indicates this is floating point) */
			if (c == CHAR_E || c == CHAR_CAP_E) {
				c = readChar(jsonText);

				/* optional sign */
				if (c == CHAR_PLUS || c == CHAR_MINUS) {
					c = readChar(jsonText);
				}
				
				if (c >= CHAR_0 && c <= CHAR_9) {
					do {
						c = readChar(jsonText);
					} while (c >= CHAR_0 && c <= CHAR_9);
				} else {
					unreadChar(jsonText);
					throw new Error(ERROR_LEX_MISSING_INTEGER_AFTER_EXPONENT);
				}
				//tok = Token.DOUBLE(NaN);
			}
			
			/* we always go "one too far" */
			unreadChar(jsonText);

			// parse the number data.
			var p:int = jsonText.position;
			jsonText.position = startOffset;
			var s:String = jsonText.readUTFBytes(p - startOffset);
			jsonText.position = p;

			// TODO ints and doubles are getting smooshed into Numbers. 
			// They should be seperate tokens.
			return Token.DOUBLE(Number(s));
		}


		public static function lex(jsonText:ByteArray, jsonTextLen:int):Token
		{
			var tok:Token = Token.ERROR;
			var c:int;
			var startOffset:int = jsonText.position;
			
			for (;;) {
				assert(jsonText.position <= jsonText.length);
				
				if (jsonText.position >= jsonText.length) {
					return Token.EOF;
				}
				
				c = readChar(jsonText);
				
				switch (c) {
					case CHAR_LBRACE:
					return Token.LBRACE;

					case CHAR_RBRACE:
					return Token.RBRACE;

					case CHAR_LBRACKET:
					return Token.LBRACKET;

					case CHAR_RBRACKET:
					return Token.RBRACKET;

					case CHAR_COMMA:
					return Token.COMMA;

					case CHAR_COLON:
					return Token.COLON;

					case CHAR_TAB: case CHAR_LF: case CHAR_VTAB: case CHAR_FORM_FEED: case CHAR_CARRIAGE_RETURN: case CHAR_SPACE:
					startOffset++;
					break;
					case CHAR_T: {
						c = readChar(jsonText);
						if(c != CHAR_R) throw new Error(ERROR_LEX_INVALID_CHAR);
						c = readChar(jsonText);
						if(c != CHAR_U) throw new Error(ERROR_LEX_INVALID_CHAR);
						c = readChar(jsonText);
						if(c != CHAR_E) throw new Error(ERROR_LEX_INVALID_CHAR);
						return Token.TRUE;
					}
					case CHAR_F: {
						c = readChar(jsonText);
						if(c != CHAR_A) throw new Error(ERROR_LEX_INVALID_CHAR);
						c = readChar(jsonText);
						if(c != CHAR_L) throw new Error(ERROR_LEX_INVALID_CHAR);
						c = readChar(jsonText);
						if(c != CHAR_S) throw new Error(ERROR_LEX_INVALID_CHAR);
						c = readChar(jsonText);
						if(c != CHAR_E) throw new Error(ERROR_LEX_INVALID_CHAR);
						return Token.FALSE;
					}
					case CHAR_N: {
						c = readChar(jsonText);
						if(c != CHAR_U) throw new Error(ERROR_LEX_INVALID_CHAR);
						c = readChar(jsonText);
						if(c != CHAR_L) throw new Error(ERROR_LEX_INVALID_CHAR);
						c = readChar(jsonText);
						if(c != CHAR_L) throw new Error(ERROR_LEX_INVALID_CHAR);
						return Token.NULL;
					}
					case CHAR_DOUBLE_QUOTE: {
						return lexString(jsonText);
					}
					case CHAR_MINUS:
					case CHAR_0: case CHAR_1: case CHAR_2: case CHAR_3: case CHAR_4:
					case CHAR_5: case CHAR_6: case CHAR_7: case CHAR_8: case CHAR_9: {
						/* integer parsing wants to start from the beginning */
						unreadChar(jsonText);
						return lexNumber(jsonText);
					}
					case CHAR_FORWARD_SLASH:
					/* hey, look, a probable comment! If comments are disabled
					* it's an error. */
					throw new Error("Comments not supported!")

					default:
					throw new Error(ERROR_LEX_INVALID_CHAR);
				}
			}
			return tok;
		}


		private static function doParse(jsonText:ByteArray, jsonTextLen:int):*
		{
			var tok:Token;
			var result:* = "dude";

			var curVal:*;
			var curKey:String;
			var arrayStack:Array = [];
			var mapStack:Object = [];

			var stateStack:Array = [PARSE_STATE_START];

			aroundAgain: while(true){
				switch (stateStack[stateStack.length - 1]) {
					case PARSE_STATE_PARSE_COMPLETE:
					result = curVal;
					return result;

					case PARSE_STATE_LEXICAL_ERROR:
					throw new Error("Lexical error.");

					case PARSE_STATE_PARSE_ERROR:
					throw new Error("Parse error.");

					case PARSE_STATE_START:
					case PARSE_STATE_MAP_NEED_VAL:
					case PARSE_STATE_ARRAY_NEED_VAL:
					case PARSE_STATE_ARRAY_START: {
						/* for arrays and maps, we advance the state for this
						* depth, then push the state of the next depth.
						* If an error occurs during the parsing of the nesting
						* enitity, the state at this level will not matter.
						* a state that needs pushing will be anything other
						* than state_start */
						var stateToPush:int = PARSE_STATE_START;

						var mapToPush:Object = null;
						var arrayToPush:Array = null;
						
						tok = lex(jsonText, jsonTextLen);

						switch (tok.type) {
							case Token.TYPE_EOF:
							throw new Error("Insufficient data");

							case Token.TYPE_ERROR:
							throw new Error("Lexer error: found error token.");

							case Token.TYPE_STRING:
							curVal = tok.data;
							break;

							case Token.TYPE_BOOL:
							curVal = tok.data;
							break;

							case Token.TYPE_NULL:
							curVal = tok.data;
							break;

							case Token.TYPE_LBRACE:
							var m:Object = {};
							curVal = m;
							mapToPush = m;
							stateToPush = PARSE_STATE_MAP_START;
							break;

							case Token.TYPE_LBRACKET:
							var a:Array = [];
							curVal = a;
							arrayToPush = a;
							stateToPush = PARSE_STATE_ARRAY_START;
							break;

							case Token.TYPE_INTEGER:
							curVal = tok.data;
							break;

							case Token.TYPE_DOUBLE:
							curVal = tok.data;
							break;

							case Token.TYPE_RBRACKET: {
								switch (stateStack[stateStack.length - 1]) {
									case PARSE_STATE_ARRAY_START:{
										curVal = arrayStack.pop();
										stateStack.pop();
										continue aroundAgain;
									}
								}
							}
							
							case Token.TYPE_COLON:
							case Token.TYPE_COMMA:

							case Token.TYPE_RBRACE:
							throw new Error("Parser error: unallowed token at this point in JSON text: " + tok);

							default:
							throw new Error("Parser error: invalid token, internal error");
						}

						/* Got a value. transition depends on the state we're in. */
						{
							var s:int = stateStack[stateStack.length - 1];
							if (s == PARSE_STATE_START) {
								stateStack[stateStack.length - 1] = PARSE_STATE_PARSE_COMPLETE;
							} 
							else if (s == PARSE_STATE_MAP_NEED_VAL){
								mapStack[mapStack.length - 1][curKey] = curVal;
								stateStack[stateStack.length - 1] = PARSE_STATE_MAP_GOT_VAL;
							} 
							else {
								arrayStack[arrayStack.length - 1].push(curVal);
								stateStack[stateStack.length - 1] = PARSE_STATE_ARRAY_GOT_VAL;
							}
						}

						if (stateToPush != PARSE_STATE_START) {
							stateStack.push(stateToPush);
						}
						if (arrayToPush != null) {
							arrayStack.push(arrayToPush);
						}
						if (mapToPush != null) {
							mapStack.push(mapToPush);
						}
						
						continue aroundAgain;
					}
					case PARSE_STATE_MAP_START:
					case PARSE_STATE_MAP_NEED_KEY: {
						/* only difference between these two states is that in
						* start '}' is valid, whereas in need_key, we've parsed
						* a comma, and a string key _must_ follow */
						tok = lex(jsonText, jsonTextLen);

						switch (tok.type) {
							case Token.TYPE_EOF:
							throw new Error("Insufficient data.");

							case Token.TYPE_ERROR:
							throw new Error("Lexer error: found error token.");

							case Token.TYPE_STRING:
							curKey = tok.data;
							stateStack[stateStack.length - 1] = PARSE_STATE_MAP_SEP;
							continue aroundAgain;

							case Token.TYPE_RBRACE:
							switch(stateStack[stateStack.length - 1]){
								case PARSE_STATE_MAP_START:{
									curVal = mapStack.pop();
									stateStack.pop();
									continue aroundAgain;
								}
							}

							default:
							throw new Error("Parser error: invalid object key (must be a string)");
						}
					}
					case PARSE_STATE_MAP_SEP: {
						tok = lex(jsonText, jsonTextLen);

						switch (tok.type) {
							case Token.TYPE_COLON:
							stateStack[stateStack.length - 1] = PARSE_STATE_MAP_NEED_VAL;
							continue aroundAgain;

							case Token.TYPE_EOF:
							throw new Error("Insufficient data.");

							case Token.TYPE_ERROR:
							throw new Error("Lexer error: found error token.");

							default:
							throw new Error("Parser error: object key and value must be separated by a colon (':').");
						}
					}
					case PARSE_STATE_MAP_GOT_VAL: {
						tok = lex(jsonText, jsonTextLen);

						switch (tok.type) {
							case Token.TYPE_RBRACE:{
								curVal = mapStack.pop();
								stateStack.pop();
								continue aroundAgain;
							}

							case Token.TYPE_COMMA:
							stateStack[stateStack.length - 1] = PARSE_STATE_MAP_NEED_KEY;
							continue aroundAgain;

							case Token.TYPE_EOF:
							throw new Error("Insufficient data.");

							case Token.TYPE_ERROR:
							throw new Error("Lexer error: found error token.");

							default:
							throw new Error("Parse error: after key and value, inside map, I expect ',' or '}'");
						}
					}
					case PARSE_STATE_ARRAY_GOT_VAL: {
						tok = lex(jsonText, jsonTextLen);

						switch (tok.type) {
							case Token.TYPE_RBRACKET:{
								curVal = arrayStack.pop();
								stateStack.pop();
								continue aroundAgain;
							}

							case Token.TYPE_COMMA:
							stateStack[stateStack.length - 1] = PARSE_STATE_ARRAY_NEED_VAL;
							continue aroundAgain;


							case Token.TYPE_EOF:
							throw new Error("Insufficient data");

							case Token.TYPE_ERROR:
							throw new Error("Lexical error: found error token.");

							default:
							throw new Error("Parser error: after array element, I expect ',' or ']'");
						}
					}

				} // end main switch
				break;
			} // end loop

			return result;
		}


		private static function stateStackToString(stack:Array):String{
			return "[" + stack.map(function(ea:int, i:int, a:Array):String{ 
					return parseStateToString(ea); 
				}).join(", ")  + "]";
		}


		private static function assert(val:Boolean):void{
			if(!val) throw new Error("Assertion failed.")
		}


		private static function lexPeek(jsonText:ByteArray, jsonTextLen:int):Token{
			var off:int = jsonText.position;
			var tok:Token = lex(jsonText, jsonTextLen);
			jsonText.position = off;
			return tok;
		}

		public static function parse(bytes:ByteArray, len:int):*{
			return doParse(bytes, len);
		}


	}
}