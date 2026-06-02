'''
Test generator for verifying numeric types
'''

import random
from os.path import basename, dirname, join, pardir
from utils.cj_chars import get_char
from utils.cj_bools import get_bool
from utils.cj_units import get_unit
from utils.cj_identifiers import get_identifier

RND_SEED = 1
random.seed(RND_SEED)
ouput_path = join(dirname(__file__), pardir, '02_syntactic_grammar', '04_types', 'a06')

test_char_template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Name:        A_02_04_a06_NUM
  @Assertion:   A.2.4(6)
                charLangTypes
                    : numericTypes
                    | CHAR
                    | BOOLEAN
                    | Nothing
                    | UNIT
                    | THISTYPE
                    ;
  @Description: Check various char lang types as variable type
  @Comment:     Auto-generated tests by SCRIPT_NAME with seed = SEED.
                The numericTypes was skipped because they checked in A.2.4(7)
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
ch1 = get_char()
code_text += code_line.replace('TYPE', ch1.type)\
    .replace('ID', get_identifier().value)\
    .replace('VALUE', ch1.value)

bool1 = get_bool()
code_text += code_line.replace('TYPE', bool1.type)\
    .replace('ID', get_identifier().value)\
    .replace('VALUE', bool1.value)

test_text = test_char_template.replace('CODE', code_text)
test_text = test_text.replace('NUM', '03')

with open(join(ouput_path, 'test_a06_03.cj'), 'w', encoding='utf-8') as f:
    f.write(test_text)

code_line2 = '''
    Assert.isTrue(VALUE is TYPE)
'''
code_text = ''
previous_values = []
for _ in range(10):
    while True:
        unit1 = get_unit()
        if unit1.value not in previous_values:
            previous_values.append(unit1.value)
            break
    code_text += code_line2.replace('TYPE', unit1.type)\
        .replace('VALUE', unit1.value)

test_text = test_char_template.replace('CODE', code_text)
test_text = test_text.replace('NUM', '04')
with open(join(ouput_path, 'test_a06_04.cj'), 'w', encoding='utf-8') as f:
    f.write(test_text)
