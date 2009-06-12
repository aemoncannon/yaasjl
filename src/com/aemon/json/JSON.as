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
			var hasEscapes:int = 0;
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

					tok = Token.STRING(s);
					break;
				}
				/* backslash escapes a set of control chars, */
				else if (curChar == CHAR_BACK_SLASH) {
					hasEscapes = 1;
					
					/* special case \u */
					curChar = readChar(jsonText);
					if (curChar == CHAR_U) {
						var i:int = 0;
						for (i=0; i<4; i++) {
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
			/* tell our buddy, the parser, wether he needs to process this string
			* again */
			if (hasEscapes && tok.type == Token.TYPE_STRING) {
				// TODO: not sure what this is for
			 	//tok = stringTokenWithEscapes(jsonText, startOffset, jsonText.position);
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
			return Token.NUMBER(parseFloat(s));
		}


		public static function lex(jsonText:ByteArray, jsonTextLen:int):Token
		{
			var tok:Token = Token.ERROR;
			var c:int;
			var startOffset:int = jsonText.position;
			
			for (;;) {
				assert(jsonText.position <= jsonTextLen);
				
				if (jsonText.position >= jsonTextLen) {
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


		private static doParse(jsonText:ByteArray, jsonTextLen:int)
		{
			var tok:Token;
			
			around_again:
			switch (yajl_bs_current(hand->stateStack)) {
				case PARSE_STATE_PARSE_COMPLETE:
				return yajl_status_ok;
				case PARSE_STATE_LEXICAL_ERROR:
				case PARSE_STATE_PARSE_ERROR:
				hand->errorOffset = *offset;
				return yajl_status_error;
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
					
					tok = yajl_lex_lex(hand->lexer, jsonText, jsonTextLen,
                        offset, &buf, &bufLen);
					
					switch (tok) {
						case yajl_tok_eof:
						return yajl_status_insufficient_data;
						case yajl_tok_error:
						yajl_bs_set(hand->stateStack, PARSE_STATE_LEXICAL_ERROR);
						goto around_again;
						case yajl_tok_string:
						if (hand->callbacks && hand->callbacks->yajl_string) {
							_CC_CHK(hand->callbacks->yajl_string(hand->ctx,
                                    buf, bufLen));
						}
						break;
						case yajl_tok_string_with_escapes:
						if (hand->callbacks && hand->callbacks->yajl_string) {
							yajl_buf_clear(hand->decodeBuf);
							yajl_string_decode(hand->decodeBuf, buf, bufLen);
							_CC_CHK(hand->callbacks->yajl_string(
                                    hand->ctx, yajl_buf_data(hand->decodeBuf),
                                    yajl_buf_len(hand->decodeBuf)));
						}
						break;
						case yajl_tok_bool:
						if (hand->callbacks && hand->callbacks->yajl_boolean) {
							_CC_CHK(hand->callbacks->yajl_boolean(hand->ctx,
                                    *buf == 't'));
						}
						break;
						case yajl_tok_null:
						if (hand->callbacks && hand->callbacks->yajl_null) {
							_CC_CHK(hand->callbacks->yajl_null(hand->ctx));
						}
						break;
						case yajl_tok_left_bracket:
						if (hand->callbacks && hand->callbacks->yajl_start_map) {
							_CC_CHK(hand->callbacks->yajl_start_map(hand->ctx));
						}
						stateToPush = PARSE_STATE_MAP_START;
						break;
						case yajl_tok_left_brace:
						if (hand->callbacks && hand->callbacks->yajl_start_array) {
							_CC_CHK(hand->callbacks->yajl_start_array(hand->ctx));
						}
						stateToPush = PARSE_STATE_ARRAY_START;
						break;
						case yajl_tok_integer:
						/*
						* note. strtol does not respect the length of
						* the lexical token. in a corner case where the
						* lexed number is a integer with a trailing zero,
						* immediately followed by the end of buffer,
						* sscanf could run off into oblivion and cause a
						* crash. for this reason we copy the integer
						* (and doubles), into our parse buffer (the same
						* one used for unescaping strings), before
						* calling strtol. yajl_buf ensures null padding,
						* so we're safe.
						*/
						if (hand->callbacks) {
							if (hand->callbacks->yajl_number) {
								_CC_CHK(hand->callbacks->yajl_number(
                                        hand->ctx,(const char *) buf, bufLen));
							} else if (hand->callbacks->yajl_integer) {
								long int i = 0;
								yajl_buf_clear(hand->decodeBuf);
								yajl_buf_append(hand->decodeBuf, buf, bufLen);
								buf = yajl_buf_data(hand->decodeBuf);
								i = strtol((const char *) buf, NULL, 10);
								if ((i == LONG_MIN || i == LONG_MAX) &&
									errno == ERANGE)
								{
									yajl_bs_set(hand->stateStack,
                                        PARSE_STATE_PARSE_ERROR);
									hand->parseError = "integer overflow" ;
									/* try to restore error offset */
									if (*offset >= bufLen) *offset -= bufLen;
									else *offset = 0;
									goto around_again;
								}
								_CC_CHK(hand->callbacks->yajl_integer(hand->ctx,
                                        i));
							}
						}
						break;
						case yajl_tok_double:
						if (hand->callbacks) {
							if (hand->callbacks->yajl_number) {
								_CC_CHK(hand->callbacks->yajl_number(
                                        hand->ctx, (const char *) buf, bufLen));
							} else if (hand->callbacks->yajl_double) {
								double d = 0.0;
								yajl_buf_clear(hand->decodeBuf);
								yajl_buf_append(hand->decodeBuf, buf, bufLen);
								buf = yajl_buf_data(hand->decodeBuf);
								d = strtod((char *) buf, NULL);
								if ((d == HUGE_VAL || d == -HUGE_VAL) &&
									errno == ERANGE)
								{
									yajl_bs_set(hand->stateStack,
                                        PARSE_STATE_PARSE_ERROR);
									hand->parseError = "numeric (floating point) "
                                    "overflow";
									/* try to restore error offset */
									if (*offset >= bufLen) *offset -= bufLen;
									else *offset = 0;
									goto around_again;
								}
								_CC_CHK(hand->callbacks->yajl_double(hand->ctx,
                                        d));
							}
						}
						break;
						case yajl_tok_right_brace: {
							if (yajl_bs_current(hand->stateStack) ==
								PARSE_STATE_ARRAY_START)
							{
								if (hand->callbacks &&
									hand->callbacks->yajl_end_array)
								{
									_CC_CHK(hand->callbacks->yajl_end_array(hand->ctx));
								}
								yajl_bs_pop(hand->stateStack);
								goto around_again;
							}
							/* intentional fall-through */
						}
						case yajl_tok_colon:
						case yajl_tok_comma:
						case yajl_tok_right_bracket:
						yajl_bs_set(hand->stateStack, PARSE_STATE_PARSE_ERROR);
						hand->parseError =
                        "unallowed token at this point in JSON text";
						goto around_again;
						default:
						yajl_bs_set(hand->stateStack, PARSE_STATE_PARSE_ERROR);
						hand->parseError = "invalid token, internal error";
						goto around_again;
					}
					/* got a value. transition depends on the state we're in. */
					{
						yajl_state s = yajl_bs_current(hand->stateStack);
						if (s == PARSE_STATE_START) {
							yajl_bs_set(hand->stateStack, PARSE_STATE_PARSE_COMPLETE);
						} else if (s == PARSE_STATE_MAP_NEED_VAL) {
							yajl_bs_set(hand->stateStack, PARSE_STATE_MAP_GOT_VAL);
						} else {
							yajl_bs_set(hand->stateStack, PARSE_STATE_ARRAY_GOT_VAL);
						}
					}
					if (stateToPush != PARSE_STATE_START) {
						yajl_bs_push(hand->stateStack, stateToPush);
					}
					
					goto around_again;
				}
				case PARSE_STATE_MAP_START:
				case PARSE_STATE_MAP_NEED_KEY: {
					/* only difference between these two states is that in
					* start '}' is valid, whereas in need_key, we've parsed
					* a comma, and a string key _must_ follow */
					tok = yajl_lex_lex(hand->lexer, jsonText, jsonTextLen,
						offset, &buf, &bufLen);
					switch (tok) {
						case yajl_tok_eof:
						return yajl_status_insufficient_data;
						case yajl_tok_error:
						yajl_bs_set(hand->stateStack, PARSE_STATE_LEXICAL_ERROR);
						goto around_again;
						case yajl_tok_string_with_escapes:
						if (hand->callbacks && hand->callbacks->yajl_map_key) {
							yajl_buf_clear(hand->decodeBuf);
							yajl_string_decode(hand->decodeBuf, buf, bufLen);
							buf = yajl_buf_data(hand->decodeBuf);
							bufLen = yajl_buf_len(hand->decodeBuf);
						}
						/* intentional fall-through */
						case yajl_tok_string:
						if (hand->callbacks && hand->callbacks->yajl_map_key) {
							_CC_CHK(hand->callbacks->yajl_map_key(hand->ctx, buf,
									bufLen));
						}
						yajl_bs_set(hand->stateStack, yajl_state_map_sep);
						goto around_again;
						case yajl_tok_right_bracket:
						if (yajl_bs_current(hand->stateStack) ==
							PARSE_STATE_MAP_START)
						{
							if (hand->callbacks && hand->callbacks->yajl_end_map) {
								_CC_CHK(hand->callbacks->yajl_end_map(hand->ctx));
							}
							yajl_bs_pop(hand->stateStack);
							goto around_again;
						}
						default:
						yajl_bs_set(hand->stateStack, PARSE_STATE_PARSE_ERROR);
						hand->parseError =
						"invalid object key (must be a string)";
						goto around_again;
					}
				}
				case yajl_state_map_sep: {
					tok = yajl_lex_lex(hand->lexer, jsonText, jsonTextLen,
						offset, &buf, &bufLen);
					switch (tok) {
						case yajl_tok_colon:
						yajl_bs_set(hand->stateStack, PARSE_STATE_MAP_NEED_VAL);
						goto around_again;
						case yajl_tok_eof:
						return yajl_status_insufficient_data;
						case yajl_tok_error:
						yajl_bs_set(hand->stateStack, PARSE_STATE_LEXICAL_ERROR);
						goto around_again;
						default:
						yajl_bs_set(hand->stateStack, PARSE_STATE_PARSE_ERROR);
						hand->parseError = "object key and value must "
						"be separated by a colon (':')";
						goto around_again;
					}
				}
				case PARSE_STATE_MAP_GOT_VAL: {
					tok = yajl_lex_lex(hand->lexer, jsonText, jsonTextLen,
						offset, &buf, &bufLen);
					switch (tok) {
						case yajl_tok_right_bracket:
						if (hand->callbacks && hand->callbacks->yajl_end_map) {
							_CC_CHK(hand->callbacks->yajl_end_map(hand->ctx));
						}
						yajl_bs_pop(hand->stateStack);
						goto around_again;
						case yajl_tok_comma:
						yajl_bs_set(hand->stateStack, PARSE_STATE_MAP_NEED_KEY);
						goto around_again;
						case yajl_tok_eof:
						return yajl_status_insufficient_data;
						case yajl_tok_error:
						yajl_bs_set(hand->stateStack, PARSE_STATE_LEXICAL_ERROR);
						goto around_again;
						default:
						yajl_bs_set(hand->stateStack, PARSE_STATE_PARSE_ERROR);
						hand->parseError = "after key and value, inside map, "
						"I expect ',' or '}'";
						/* try to restore error offset */
						if (*offset >= bufLen) *offset -= bufLen;
						else *offset = 0;
						goto around_again;
					}
				}
				case PARSE_STATE_ARRAY_GOT_VAL: {
					tok = yajl_lex_lex(hand->lexer, jsonText, jsonTextLen,
						offset, &buf, &bufLen);
					switch (tok) {
						case yajl_tok_right_brace:
						if (hand->callbacks && hand->callbacks->yajl_end_array) {
							_CC_CHK(hand->callbacks->yajl_end_array(hand->ctx));
						}
						yajl_bs_pop(hand->stateStack);
						goto around_again;
						case yajl_tok_comma:
						yajl_bs_set(hand->stateStack, PARSE_STATE_ARRAY_NEED_VAL);
						goto around_again;
						case yajl_tok_eof:
						return yajl_status_insufficient_data;
						case yajl_tok_error:
						yajl_bs_set(hand->stateStack, PARSE_STATE_LEXICAL_ERROR);
						goto around_again;
						default:
						yajl_bs_set(hand->stateStack, PARSE_STATE_PARSE_ERROR);
						hand->parseError =
						"after array element, I expect ',' or ']'";
						goto around_again;
					}
				}
			}
			
			abort();
			return yajl_status_error;
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


		public static function parse(bytes:ByteArray, len:int):void{
			while(true){
				var t:Token = lex(bytes, len);
				if( t == Token.EOF) break;
			}
		}




	}
}