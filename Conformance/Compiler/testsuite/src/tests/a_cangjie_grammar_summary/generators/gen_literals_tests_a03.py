'''
Test generator for verifying char literals
'''

import random
from os.path import basename, dirname, join, pardir
from utils.cj_chars import get_all_chars, get_char

RND_SEED = 1
random.seed(RND_SEED)
ouput_path = join(dirname(__file__), pardir, '01_lexical_grammar', '05_literals', 'a03')

test_char_template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Name:        A_01_05_a03_01
  @Assertion:   A.1.5(3)
                CharacterLiteral
                    : '\'' (SingleChar | EscapeSeq ) '\''
                    ;
                SingleChar
                    : ~['\\r\\n]
                    ;
                EscapeSeq
                    : UniCharacterLiteral
                    | EscapedIdentifier
                    ;  
                UniCharacterLiteral
                    : '\\\\' 'u' '{' HexadecimalDigit '}'
                    | '\\\\' 'u' '{' HexadecimalDigit HexadecimalDigit '}'
                    | '\\\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit '}'
                    | '\\\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit '}'
                    | '\\\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
                      HexadecimalDigit '}'
                    | '\\\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
                      HexadecimalDigit HexadecimalDigit '}'
                    | '\\\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
                      HexadecimalDigit HexadecimalDigit HexadecimalDigit '}'
                    | '\\\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
                      HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit '}'
                    ; 
                EscapedIdentifier
                    : '\\\\' ('t' | 'b' | 'r' | 'n' | '\\'' | '"' | '\\\\' | 'f' | 'v' | '0' | '$')
                    ;
  @Description: Check various symbols as CharacterLiteral
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
  // Check CHAR symbol as CharacterLiteral
  Assert.isTrue(CHAR is TYPE)
'''
test_char_template = test_char_template.replace('SCRIPT_NAME', basename(__file__))
test_char_template = test_char_template.replace('SEED', str(RND_SEED))

code_text = ''
for char1 in get_all_chars():
    code_text += code_line.replace('CHAR', char1.value).replace('TYPE', char1.type)

test_text = test_char_template.replace('CODE', code_text)

with open(join(ouput_path, 'test_a03_01.cj'), 'w', encoding='utf-8') as f:
    f.write(test_text)
