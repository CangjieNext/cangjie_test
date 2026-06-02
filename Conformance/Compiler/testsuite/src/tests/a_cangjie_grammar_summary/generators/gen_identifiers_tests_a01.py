'''
Test generator for verifying identifiers
'''

import random
from os.path import basename, dirname, join, pardir
from utils.cj_identifiers import get_all_identifiers

RND_SEED = 1
random.seed(RND_SEED)
ouput_path = join(dirname(__file__), pardir, '01_lexical_grammar', '06_identifiers', 'a01')

test_char_template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Name:        A_01_06_a01_01
  @Assertion:   A.1.6(1)
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

  @Description: Check various identifiers
  @Comment:     Auto-generated tests by SCRIPT_NAME with seed = SEED
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

main() {
  CODE
  return 0
}
'''
code_line = '''
    // Check ID symbol as identifier 
    var ID = 1
'''
test_char_template = test_char_template.replace('SCRIPT_NAME', basename(__file__))
test_char_template = test_char_template.replace('SEED', str(RND_SEED))

code_text = ''
for id1 in get_all_identifiers():
    code_text += code_line.replace('ID', id1.value)

test_text = test_char_template.replace('CODE', code_text)

with open(join(ouput_path, 'test_a01_01.cj'), 'w', encoding='utf-8') as f:
    f.write(test_text)
