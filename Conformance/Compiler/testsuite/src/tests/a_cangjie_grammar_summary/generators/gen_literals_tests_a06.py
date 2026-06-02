'''
Test generator for verifying java string literals
'''

import random
from os.path import basename, dirname, join, pardir
from utils.cj_jstring import get_all_jstrings

RND_SEED = 1
random.seed(RND_SEED)
ouput_path = join(dirname(__file__), pardir, '01_lexical_grammar', '05_literals', 'a06')

test_char_template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Name:        A_01_05_a06_01
  @Assertion:   A.1.5(6)
                JStringLiteral
                      : 'J' '"' (SingleChar | EscapeSeq)* '"'
                      ;

  @Description: Check various symbols as JStringLiteral
  @Comment:     Auto-generated tests by SCRIPT_NAME with seed = SEED
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       6623
*/

from std import ffi.java.JString
from utils import utils.assert.Assert

main() {
  CODE
  return 0
}
'''
code_line = '''
    // Check STR symbol is TYPE type 
    Assert.isTrue(STR is TYPE)
'''
test_char_template = test_char_template.replace('SCRIPT_NAME', basename(__file__))
test_char_template = test_char_template.replace('SEED', str(RND_SEED))

code_text = ''
for jstr in get_all_jstrings(50):
    code_text += code_line.replace('STR', jstr.value).replace('TYPE', jstr.type)

test_text = test_char_template.replace('CODE', code_text)

with open(join(ouput_path, 'test_a06_01.cj'), 'w', encoding='utf-8') as f:
    f.write(test_text)
