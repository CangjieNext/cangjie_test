# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
Methods for getting identifiers.

The grammar is:

identifier
: Identifier
| PUBLIC
| PRIVATE
| PROTECTED
| OVERRIDE
| ABSTRACT
| OPEN
| REDEF
| GET
| SET
;
Identifier
: Letter (Letter | '_' | DecimalDigit)*
| '`' Letter (Letter | '_' | DecimalDigit)* '`'
;
Letter
: [a-zA-Z]
;
DollarIdentifier
: '$' Identifier
;
'''
import enum
import random
import string
from utils.cj_keywords import get_all_keywords

class KeywordsIdentifiers(str, enum.Enum):
    '''Keywords which can be used as identifier'''
    PUBLIC = 'public'
    PRIVATE = 'private'
    PROTECTED = 'protected'
    OVERRIDE = 'override'
    ABSTRACT = 'abstract'
    OPEN = 'open'
    REDEF = 'redef'
    GET = 'get'
    SET = 'set'

class IdentifierType(str, enum.Enum):
    '''Identifier types enum'''
    ORDINARY = 'ordinary'
    RAW = 'raw'

class Identifier():
    '''Identifier representation'''
    LETTER = list(string.ascii_letters)
    NUM = list(string.digits)
    UNDERSCORE = '_'
    def __init__(self, type = None, value = None, length = 8, exclude_keywords = False) -> None:
        if type is None:
            self._type = random.choice(list(IdentifierType))
        else:
            self._type = type
        id_type = random.choice(list(IdentifierType))
        if value is None:
            res = ''
            if id_type == IdentifierType.RAW and random.randint(0,5) == 0 and not exclude_keywords:
                res = random.choice(get_all_keywords())
            if id_type == IdentifierType.ORDINARY and random.randint(0,5) == 0 and not exclude_keywords:
                res = random.choice(list(KeywordsIdentifiers)).value
            if res == '':
                res = random.choice(Identifier.LETTER)
                for _ in range(length - 1):
                    char_type = random.randint(0,2)
                    if char_type == 0:
                        res += random.choice(Identifier.LETTER)
                    elif char_type == 1:
                        res += random.choice(Identifier.NUM)
                    else:
                        res += Identifier.UNDERSCORE
            if id_type == IdentifierType.RAW:
                self._value = '`' + res + '`'
            else:
                self._value = res
        else:
            self._value = value

    @property
    def value(self) -> str:
        '''Value of identifier'''
        return self._value

    @property
    def type(self) -> str:
        '''Identifier type'''
        return self._type

def get_identifier(type = None, value = None, max_length = None, exclude_keywords = False):
    '''Get random identifier'''
    if max_length is None:
        max_length = random.randint(1,8)
    return Identifier(type, value, max_length, exclude_keywords)

def get_all_identifiers(type=None, max_num=20, max_length=8):
    '''Get some variations of identifiers with max_length max length '''
    res = []
    if type is None:
        for _ in range(max_num):
            res.append(get_identifier(type=type, max_length=max_length, exclude_keywords=True))
        for val in list(KeywordsIdentifiers):
            val = val.value
            res.append(get_identifier(type=IdentifierType.ORDINARY, value=val, max_length=max_length))
        for val in get_all_keywords():
            val = '`' + val + '`'
            res.append(get_identifier(type=IdentifierType.RAW, value=val, max_length=max_length))
    else:
        for _ in range(max_num):
            res.append(get_identifier(type = type, max_length=max_length))
    return res

class DollarIdentifier(Identifier):
    '''DollarIdentifier representation'''
    def __init__(self, type = None, value = None, length = 8) -> None:
        super().__init__(type, value, length, exclude_keywords=True)
        self._value = '$' + self._value

def get_dollar_identifier(type = None, value = None, max_length = None):
    '''Get random dollar identifier'''
    if max_length is None:
        max_length = random.randint(1,8)
    return DollarIdentifier(type, value, max_length)

def get_all_dollar_identifiers(type = None, max_num = 20, max_length = 8):
    '''Get some variations of dollar identifiers with max_length max length '''
    res = []
    for _ in range(max_num):
        res.append(get_dollar_identifier(type=type, max_length=max_length))
    return res
