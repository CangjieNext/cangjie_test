'''
Test generator for verifying integer literals
'''

import random
from os.path import basename, dirname, join, pardir
from utils.cj_integers import get_all_integers, Integer, IntegerTypes

RND_SEED = 1
random.seed(RND_SEED)
ouput_path = join(dirname(__file__), pardir, '01_lexical_grammar', '05_literals', 'a01')

test_char_template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Name:        A_01_05_a01_01
  @Assertion:   A.1.5(1) 
                IntegerLiteralSuffix
                    : 'i8' |'i16' |'i32' |'i64' |'u8' |'u16' |'u32' | 'u64'
                    ; 
                IntegerLiteral
                    : BinaryLiteral IntegerLiteralSuffix?
                    | OctalLiteral IntegerLiteralSuffix?
                    | DecimalLiteral '_'* IntegerLiteralSuffix?
                    | HexadecimalLiteral IntegerLiteralSuffix?
                    ;
                BinaryLiteral
                    : '0' [bB] BinDigit (BinDigit | '_')*
                    ;
                BinDigit
                    : [01]
                    ;
                OctalLiteral
                    : '0' [oO] OctalDigit (OctalDigit | '_')*
                    ;
                OctalDigit
                    : [0-7]
                    ;
                DecimalLiteral
                    : (DecimalDigitWithOutZero (DecimalDigit | '_')*) | DecimalDigit
                    ;
                fragment DecimalFragment
                    : DecimalDigit (DecimalDigit | '_')*
                    ;
                fragment DecimalDigit
                    : [0-9]
                    ;
                fragment DecimalDigitWithOutZero
                    : [1-9]
                    ;
                HexadecimalLiteral
                    : '0' [xX] HexadecimalDigits
                    ;
                HexadecimalDigits
                    : HexadecimalDigit (HexadecimalDigit | '_')*
                    ;
                HexadecimalDigit
                    : [0-9a-fA-F]
                    ;

  @Description: Check various symbols as CharacterByteLiteral
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
  // Check INT symbol is TYPE type
  Assert.isTrue(INT is TYPE)
'''
test_char_template = test_char_template.replace('SCRIPT_NAME', basename(__file__))
test_char_template = test_char_template.replace('SEED', str(RND_SEED))

code_text = ''
for int1 in get_all_integers():
    if IntegerTypes(int1.type) == IntegerTypes.INTNATIVE or IntegerTypes(int1.type) == IntegerTypes.UINTNATIVE:
        continue # Skip native types because it is not clear how to get them correctly
    code_text += code_line.replace('INT', int1.value).replace('TYPE', int1.type)

test_text = test_char_template.replace('CODE', code_text)

with open(join(ouput_path, 'test_a01_01.cj'), 'w', encoding='utf-8') as f:
    f.write(test_text)
