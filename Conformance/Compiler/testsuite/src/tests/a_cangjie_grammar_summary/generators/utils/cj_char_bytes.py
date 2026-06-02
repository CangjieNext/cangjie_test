# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
Methods for getting byte characters.

The grammar is:

CharacterByteLiteral
: 'b' '\'' (SingleCharByte | ByteEscapeSeq) '\''
;
ByteEscapeSeq
: HexCharByte
| ByteEscapedIdentifier
;
SingleCharByte
// ASCII 0x00~0x7F without \n \r \' \" \\
// +-------+-----+-----+
// | Rune | Hex | Dec |
// +-------+-----+-----+
// | \n | 0A | 10 |
// | \r | 0D | 13 |
// | \" | 22 | 34 |
// | \' | 27 | 39 |
// | \\ | 5C | 92 |
// +-------+-----+-----+
: [\u0000-\u0009\u000B\u000C\u000E-\u0021\u0023-\u0026\u0028-\u005B\u005D-\u007F]
;
fragment ByteEscapedIdentifier
: '\\' ('t' | 'b' | 'r' | 'n' | '\'' | '"' | '\\' | 'f' | 'v' | '0')
;
fragment HexCharByte
: '\\' 'u' '{' HexadecimalDigit '}'
| '\\' 'u' '{' HexadecimalDigit HexadecimalDigit '}'
;
'''

import random

def get_random_uni_char_literal(ch_len = -1):
    '''Get random UniCharacterLiteral value'''
    if ch_len == -1:
        ch_len = random.randint(1,8)
    res = '\\u{'
    for _ in range(ch_len):
        hex_digit = random.choice('0123456789abcdefABCDEF')
        res += hex_digit
    res += '}'
    return res

class CharByte():
    '''CharByte representation'''
    # SingleCharByte
    CHARS = [chr(i) for i in range(int('0x0000', 16), int('0x0009', 16))]
    CHARS.append(chr(int('0x000B',16)))
    CHARS.append(chr(int('0x000C',16)))
    CHARS.extend([chr(i) for i in range(int('0x000E', 16), int('0x0021', 16))])
    CHARS.extend([chr(i) for i in range(int('0x0023', 16), int('0x0026', 16))])
    CHARS.extend([chr(i) for i in range(int('0x0028', 16), int('0x005B', 16))])
    CHARS.extend([chr(i) for i in range(int('0x005D', 16), int('0x007F', 16))])
    #EscapedIdentifier
    ESCAPED_IDENTIFIER = ['\\t', '\\b', '\\r', '\\n', '\\\'', '\\"', '\\\\', '\\f', '\\v', '\\0']

    def __init__(self, value = None) -> None:
        self._type = 'UInt8'
        if value is None:
            ch_type = random.randint(0,2)
            if ch_type == 0:
                self._value = random.choice(CharByte.CHARS)
            elif ch_type == 1:
                self._value = random.choice(CharByte.ESCAPED_IDENTIFIER)
            else: #UniCharacterLiteral
                self._value = get_random_uni_char_literal(2)
        else:
            self._value = value

    @property
    def value(self) -> str:
        '''Value of CharByte type'''
        return "b'" + self._value + "'"

    @property
    def clean_value(self) -> str:
        '''Value of CharByte type without b' prefix and ' posfix'''
        return self._value

    @property
    def type(self) -> str:
        '''CharByte type string'''
        return self._type

def get_char(value = None):
    '''Get random char'''
    return CharByte(value)

def get_all_chars():
    '''Get all variations of characters from predefined pool'''
    res = []
    for value in CharByte.CHARS:
        res.append(CharByte(value))
    for value in CharByte.ESCAPED_IDENTIFIER:
        res.append(CharByte(value))
    for ch_len in range(1,3):
        res.append(CharByte(get_random_uni_char_literal(ch_len)))
        res.append(CharByte(get_random_uni_char_literal(ch_len)))
    return res
