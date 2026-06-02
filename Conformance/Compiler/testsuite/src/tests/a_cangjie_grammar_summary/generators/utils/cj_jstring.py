# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
Methods for getting JStringLiteral.

The grammar is:

JStringLiteral
: 'J' '"' (SingleChar | EscapeSeq)* '"'
;
SingleChar
: ~['\\\r\n]
;
EscapeSeq
: UniCharacterLiteral
| EscapedIdentifier
;
UniCharacterLiteral
: '\\' 'u' '{' HexadecimalDigit '}'
| '\\' 'u' '{' HexadecimalDigit HexadecimalDigit '}'
| '\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit '}'
| '\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit '}'
| '\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
HexadecimalDigit '}'
| '\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
HexadecimalDigit HexadecimalDigit '}' ↪
| '\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
HexadecimalDigit HexadecimalDigit HexadecimalDigit '}' ↪
| '\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit '}' ↪
;
EscapedIdentifier
: '\\' ('t' | 'b' | 'r' | 'n' | '\'' | '"' | '\\' | 'f' | 'v' | '0' | '$')
;
'''

import random
from utils.cj_chars import get_char

class JString():
    '''JStringLiteral representation'''
    def __init__(self, value = None, max_len = None) -> None:
        self._type = 'JString'
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
        '''Value of JStringLiteral type'''
        return 'J"' + self._value + '"'

    @property
    def type(self) -> str:
        '''JStringLiteral type string'''
        return self._type

def get_jstring(value = None, max_len = None):
    '''Get random java string'''
    return JString(value, max_len)

def get_all_jstrings(max_number = 5):
    '''Get some variations of java strings'''
    res = []
    for _ in range(max_number):
        res.append(get_jstring())
    return res
