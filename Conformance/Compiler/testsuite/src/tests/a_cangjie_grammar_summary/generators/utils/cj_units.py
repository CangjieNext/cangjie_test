# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
Methods for getting unit.

The grammar is:

UNIT: 'Unit' ;

LPAREN: '(' ;
RPAREN: ')' ;

unitLiteral
: LPAREN NL* RPAREN
;

'''

import random
from utils.cj_ws_nl import get_multiple_new_lines

class Unit():
    '''Unit representation'''
    def __init__(self, value = None) -> None:
        self._type = 'Unit'
        if value is None:
            self._value = '(' + get_multiple_new_lines(min_num=0) + ')'
        else:
            self._value = value

    @property
    def value(self) -> str:
        '''Value of Unit type'''
        return self._value

    @property
    def type(self) -> str:
        '''Unitean type string'''
        return self._type

def get_unit(value = None):
    '''Get random unit'''
    return Unit(value)

def get_all_units(num_variations = 5):
    '''Get some variations of unit's. By default 5'''
    res = []
    for _ in range(num_variations):
        res.append(Unit())
    return res
