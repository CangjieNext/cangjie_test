# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
Methods for creating whitespaces and new lines.

The grammar is:
WS
    : [\u0020\u0009\u000C]
    ;
NL
    : '\u000A' | '\u000D' '\u000A'
    ;

'''

import random

def get_white_space():
    '''Get one random white space'''
    ws_choice = random.randint(0,2)
    if ws_choice == 0:
        return '\u0020'
    elif ws_choice == 1:
        return '\u0009'
    else:
        return '\u000C'

def get_multiple_white_spaces(max_num = 10):
    '''Get random number of whitespaces but less than max_num'''
    num_ws = random.randint(0, max_num)
    res = ''
    for _ in range(num_ws):
        res += get_white_space()
    return res

def get_new_line():
    '''Get one random new line'''
    ws_choice = random.randint(0,1)
    if ws_choice == 0:
        return '\u000A'
    else:
        return '\u000D\u000A'

def get_multiple_new_lines(min_num = 1, max_num = 10):
    '''Get random number of new lines but less than max_num'''
    num_nl = random.randint(min_num, max_num)
    res = ''
    for _ in range(num_nl):
        res += get_new_line()
    return res
