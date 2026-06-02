'''
Test generator for verifying integer literals
'''

import random
from os.path import basename, dirname, join, pardir
from utils.cj_floats import get_all_floats

RND_SEED = 1
random.seed(RND_SEED)
ouput_path = join(dirname(__file__), pardir, '01_lexical_grammar', '05_literals', 'a02')

test_char_template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Name:        A_01_05_a02_01
  @Assertion:   A.1.5(2) 
                FloatLiteralSuffix
                    : 'f16' | 'f32' | 'f64'
                    ;
                FloatLiteral
                    : (DecimalLiteral DecimalExponent | DecimalFraction DecimalExponent? | (DecimalLiteral DecimalFraction) DecimalExponent?) FloatLiteralSuffix?
                    | ( Hexadecimalprefix (HexadecimalDigits | HexadecimalFraction | (HexadecimalDigits HexadecimalFraction)) HexadecimalExponent)
                    ;
                fragment DecimalFraction : '.' DecimalFragment;
                fragment DecimalExponent : FloatE Sign? DecimalFragment;
                fragment Sign : [-] ;
                fragment Hexadecimalprefix : '0' [xX] ;
                DecimalFraction : '.' DecimalLiteral ;
                DecimalExponent : FloatE Sign? DecimalLiteral ;
                HexadecimalFraction : '.' HexadecimalDigits ;
                HexadecimalExponent : FloatP Sign? DecimalFragment;
                FloatE : [eE] ;
                FloatP : [pP] ;
                Sign : [-] ;
                Hexadecimalprefix : '0' [xX] ;

  @Description: Check various floating point number representations as FloatLiteral
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
    // Check FLOAT symbol is TYPE type
    Assert.equals(FLOAT, TYPE(FLOAT))
'''
test_char_template = test_char_template.replace('SCRIPT_NAME', basename(__file__))
test_char_template = test_char_template.replace('SEED', str(RND_SEED))

code_text = ''
for float1 in get_all_floats():
    if float1.value == '-0xFFffFFffp-1': # see test_a02_01.cj
        continue
    code_text += code_line.replace('FLOAT', float1.value).replace('TYPE', float1.type)

test_text = test_char_template.replace('CODE', code_text)

with open(join(ouput_path, 'test_a02_02.cj'), 'w', encoding='utf-8') as f:
    f.write(test_text)
