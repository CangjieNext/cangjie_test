# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
Methods for getting booleans.

The grammar is:

BOOLEAN: 'Bool' ;

TRUE: 'true';
FALSE: 'false';

booleanLiteral
    : TRUE
    | FALSE ;

'''

import random

_BOOL_LITERALS = {
    'Bool': ['true', 'false']
}

class Bool():
    '''Boolean representation'''
    def __init__(self, value = None) -> None:
        self._type = 'Bool'
        if value is None or value not in _BOOL_LITERALS[self._type]:
            self._value = random.choice(_BOOL_LITERALS[self._type])
        else:
            self._value = value

    @property
    def value(self) -> str:
        '''Value of Bool type'''
        return self._value

    @property
    def type(self) -> str:
        '''Boolean type string'''
        return self._type

def get_bool(value = None):
    '''Get random boolean'''
    return Bool(value)

def get_all_booleans():
    '''Get all variations of booleans'''
    res = [Bool(_BOOL_LITERALS['Bool'][0]), Bool(_BOOL_LITERALS['Bool'][1])]
    return res
