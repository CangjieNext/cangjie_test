'''
Test generator for verifying char byte literals
'''

import random
from os.path import basename, dirname, join, pardir
from utils.cj_bytestring_array import get_all_byte_strings

RND_SEED = 1
random.seed(RND_SEED)
ouput_path = join(dirname(__file__), pardir, '01_lexical_grammar', '05_literals', 'a05')

test_char_template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Name:        A_01_05_a05_01
  @Assertion:   A.1.5(5)
                ByteStringArrayLiteral
                    : 'b' '"' (SingleCharByte | ByteEscapeSeq)* '"'
                    ;

  @Description: Check various symbols as ByteStringArrayLiteral
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
    // Check STR symbol is TYPE type 
    Assert.isTrue(STR is TYPE)
'''
test_char_template = test_char_template.replace('SCRIPT_NAME', basename(__file__))
test_char_template = test_char_template.replace('SEED', str(RND_SEED))

code_text = ''
for char1 in get_all_byte_strings(50):
    code_text += code_line.replace('STR', char1.value).replace('TYPE', char1.type)

test_text = test_char_template.replace('CODE', code_text)

with open(join(ouput_path, 'test_a05_01.cj'), 'w', encoding='utf-8') as f:
    f.write(test_text)
