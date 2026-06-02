# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
Methods for getting ByteStringArrayLiteral.

The grammar is:

ByteStringArrayLiteral
: 'b' '"' (SingleCharByte | ByteEscapeSeq)* '"'
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
from utils.cj_char_bytes import get_char

class ByteStringArray():
    '''ByteStringArray representation'''
    def __init__(self, value = None, max_len = None) -> None:
        self._type = 'Array<UInt8>'
        if max_len is None:
            max_len = 50
        if value is None:
            string_len = random.randint(0, max_len)
            self._value = ''
            for _ in range(string_len):
                self._value += get_char().clean_value
        else:
            self._value = value

    @property
    def value(self) -> str:
        '''Value of ByteStringArray type'''
        return 'b"' + self._value + '"'

    @property
    def type(self) -> str:
        '''ByteStringArray type string'''
        return self._type

def get_byte_string(value = None, max_len = None):
    '''Get random char'''
    return ByteStringArray(value, max_len)

def get_all_byte_strings(max_number = 5):
    '''Get some variations of byte string arrays'''
    res = []
    for _ in range(max_number):
        res.append(get_byte_string())
    return res
