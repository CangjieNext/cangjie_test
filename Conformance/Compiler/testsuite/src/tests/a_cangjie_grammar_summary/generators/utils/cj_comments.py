# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
Methods for creating comments.

The grammar is:
DelimitedComment
    : '/*' ( DelimitedComment | . )*? '*/'
    ;
LineComment
    : '//' ~[\u000A\u000D]*
    ;
'''

import random
from utils.markov_text_gen import generate_random_text

def get_line_comment(max_length = 100):
    '''Get random one line comment'''
    return f'//{generate_random_text(random.randint(1, max_length))}'

def _get_endline():
    endl_choice = random.randint(0,3)
    if endl_choice == 0:
        return '\u000A'
    elif endl_choice == 1:
        return '\u000D'
    elif endl_choice == 2:
        return '\u000A\u000D'
    return ''

def get_delimited_comment(max_recursion = 7):
    '''Get random multiline comment'''
    comment = '/* '  # pylint: disable=trailing-whitespace
    for _ in range(10):
        choice = random.randint(0,2) # 0 - line, 1 - one more comment, 2 - stop
        if choice == 0:
            comment += generate_random_text(random.randint(1,15)).replace('/*','').replace('*/','')
        elif choice == 1 and max_recursion > 0:
            comment += get_delimited_comment(max_recursion = max_recursion - 1)            
        else:
            break
        comment += _get_endline()
    comment += ' */'
    return comment
