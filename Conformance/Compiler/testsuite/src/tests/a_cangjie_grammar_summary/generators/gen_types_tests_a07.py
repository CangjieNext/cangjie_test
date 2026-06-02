'''
Test generator for verifying numeric types
'''

import random
from os.path import basename, dirname, join, pardir
from utils.cj_integers import get_integer, IntegerTypes
from utils.cj_floats import get_float, FloatTypes
from utils.cj_identifiers import get_identifier

RND_SEED = 1
random.seed(RND_SEED)
ouput_path = join(dirname(__file__), pardir, '02_syntactic_grammar', '04_types', 'a07')

test_char_template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Name:        A_02_04_a07_01
  @Assertion:   A.2.4(7)
                numericTypes
                    : INT8
                    | INT16
                    | INT32
                    | INT64
                    | INTNATIVE
                    | UINT8
                    | UINT16
                    | UINT32
                    | UINT64
                    | UINTNATIVE
                    | FLOAT16
                    | FLOAT32
                    | FLOAT64
                    ;
  @Description: Check various numeric types as variable type
  @Comment:     Auto-generated tests by SCRIPT_NAME with seed = SEED
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
from utils import utils.assert.Assert

main() {
CODE
    return 0
}
'''
code_line = '''
    var ID: TYPE = VALUE
    Assert.equals(VALUE, ID)
'''
test_char_template = test_char_template.replace('SCRIPT_NAME', basename(__file__))
test_char_template = test_char_template.replace('SEED', str(RND_SEED))

code_text = ''
for int_type in list(IntegerTypes):
    code_text += code_line.replace('TYPE', int_type.value)\
        .replace('ID', get_identifier().value)\
        .replace('VALUE', get_integer(type=int_type).value)

for float_type in list(FloatTypes):
    code_text += code_line.replace('TYPE', float_type.value)\
        .replace('ID', get_identifier().value)\
        .replace('VALUE', get_float(type=float_type).value)

test_text = test_char_template.replace('CODE', code_text)

with open(join(ouput_path, 'test_a07_01.cj'), 'w', encoding='utf-8') as f:
    f.write(test_text)
