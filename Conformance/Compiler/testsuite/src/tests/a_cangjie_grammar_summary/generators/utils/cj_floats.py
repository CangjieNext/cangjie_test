# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
Methods for getting floats.

The grammar is:

FloatLiteralSuffix
: 'f16' | 'f32' | 'f64'
;
FloatLiteral
: (DecimalLiteral DecimalExponent | DecimalFraction DecimalExponent? | (DecimalLiteral
DecimalFraction) DecimalExponent?) FloatLiteralSuffix? ↪
| ( Hexadecimalprefix (HexadecimalDigits | HexadecimalFraction | (HexadecimalDigits
HexadecimalFraction)) HexadecimalExponent) ↪
;
fragment DecimalFraction : '.' DecimalFragment ;
fragment DecimalExponent : FloatE Sign? DecimalFragment ;
fragment Sign : [-] ;
fragment Hexadecimalprefix : '0' [xX] ;
DecimalFraction : '.' DecimalLiteral ;
DecimalExponent : FloatE Sign? DecimalLiteral ;
HexadecimalFraction : '.' HexadecimalDigits ;
HexadecimalExponent : FloatP Sign? DecimalFragment ;
FloatE : [eE] ;
FloatP : [pP] ;
Sign : [-] ;
Hexadecimalprefix : '0' [xX] ;
'''

import random
import enum
import json
from os.path import join, pardir, dirname

class FloatTypes(str, enum.Enum):
    '''Float types enum'''
    FLOAT16 = 'Float16'
    FLOAT32 = 'Float32'
    FLOAT64 = 'Float64'

class Float():
    '''Float representation'''
    DATA_FILE = join(dirname(__file__), pardir, 'data', 'floats', 'samples.json')
    def __init__(self, type = None, value = None) -> None:
        if type is None:
            self._type = random.choice(list(FloatTypes))
        else:
            self._type = type
        if value is None:
            # Read data from json file
            with open(Float.DATA_FILE, 'r', encoding='utf-8') as read_file:
                data = json.load(read_file) # data is dict
            self._value = random.choice(data[self._type])
        else:
            self._value = value

    @property
    def value(self) -> str:
        '''Value of Float type'''
        return self._value

    @property
    def type(self) -> str:
        '''Float type string'''
        return self._type.value

def get_float(type = None, value = None):
    '''Get random float'''
    return Float(type, value)

def get_all_floats() -> list[Float]:
    '''Get all variations of floats from predefined pool'''
    res = []
    with open(Float.DATA_FILE, 'r', encoding='utf-8') as read_file:
        data = json.load(read_file) # data is dict
    for type in FloatTypes:
        for value in data[type]:
            res.append(Float(type, value))
    return res
