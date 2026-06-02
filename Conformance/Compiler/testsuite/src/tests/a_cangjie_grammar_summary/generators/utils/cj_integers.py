# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
Methods for getting integers.

The grammar is:

IntegerLiteralSuffix
: 'i8' |'i16' |'i32' |'i64' |'u8' |'u16' |'u32' | 'u64'
;
IntegerLiteral
: BinaryLiteral IntegerLiteralSuffix?
| OctalLiteral IntegerLiteralSuffix?
| DecimalLiteral '_'* IntegerLiteralSuffix?
| HexadecimalLiteral IntegerLiteralSuffix?
;
BinaryLiteral
: '0' [bB] BinDigit (BinDigit | '_')*
;
BinDigit
: [01]
;
OctalLiteral
: '0' [oO] OctalDigit (OctalDigit | '_')*
;
OctalDigit
: [0-7]
;
DecimalLiteral
: (DecimalDigitWithOutZero (DecimalDigit | '_')*) | DecimalDigit
;
fragment DecimalFragment
: DecimalDigit (DecimalDigit | '_')*
;
fragment DecimalDigit
: [0-9]
;
fragment DecimalDigitWithOutZero
: [1-9]
;
HexadecimalLiteral
: '0' [xX] HexadecimalDigits
;
HexadecimalDigits
: HexadecimalDigit (HexadecimalDigit | '_')*
;
HexadecimalDigit
: [0-9a-fA-F]
;
'''

import random
import enum
import json
from os.path import join, pardir, dirname

class IntegerTypes(str, enum.Enum):
    '''Integer types enum'''
    INT8 = 'Int8'
    INT16 = 'Int16'
    INT32 = 'Int32'
    INT64 = 'Int64'
    INTNATIVE = 'IntNative'
    UINT8 = 'UInt8'
    UINT16 = 'UInt16'
    UINT32 = 'UInt32'
    UINT64 = 'UInt64'
    UINTNATIVE = 'UIntNative'


class Integer():
    '''Integer representation'''
    DATA_FILE = join(dirname(__file__), pardir, 'data', 'integers', 'samples.json')
    def __init__(self, type = None, value = None) -> None:
        if type is None:
            self._type = random.choice(list(IntegerTypes))
        else:
            self._type = type
        if value is None:
            # Read data from json file
            with open(Integer.DATA_FILE, 'r', encoding='utf-8') as read_file:
                data = json.load(read_file) # data is dict
            self._value = random.choice(data[self._type])
        else:
            self._value = value

    @property
    def value(self) -> str:
        '''Value of Integer type'''
        return self._value

    @property
    def type(self) -> str:
        '''Integer type string'''
        return self._type.value

def get_integer(type = None, value = None):
    '''Get random char'''
    return Integer(type, value)

def get_all_integers():
    '''Get all variations of characters from predefined pool'''
    res = []
    with open(Integer.DATA_FILE, 'r', encoding='utf-8') as read_file:
        data = json.load(read_file) # data is dict
    for type in IntegerTypes:
        for value in data[type]:
            res.append(Integer(type, value))
    return res
