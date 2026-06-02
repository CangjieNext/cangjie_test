# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
Test generator for check whitespaces and new lines
'''

import random
from os.path import basename, dirname, join, pardir
from utils.cj_ws_nl import get_multiple_new_lines

RND_SEED = 1
random.seed(RND_SEED)
ouput_path = join(dirname(__file__), pardir, '01_lexical_grammar', '02_whitespace_and_newline', 'a02')

test_NL1_template = '''
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_01_02_a01_NUM
  @Assertion:   A.1.2(1) 
                NL: '\\u000A' | '\\u000D' '\\u000A' ;
  @Description: Check usage white spaces in diffent places
  @Comment:     Auto-generated tests by SCRIPT_NAME with seed = SEED
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @CompileWarning: Ignore
*/
packageNL1myNL1.NL1pack

fromNL1utilsNL1importNL1utils.assert.Assert

// Modifiers: Present, Parameters: OuOnCn, Super call: Present, Body content: Full
openNL1classNL1UiB6gn1xsONL1{
  initNL1(NL1`FYjB`: (Range<Int8>NL1,NL1 Range<Int8>NL1,NL1 Bool) -> (Array<Float16>) -> Int64, W8p: CharNL1)NL1 {NL1}NL1
}
classNL1mYc86_DYWNL1<:NL1UiB6gn1xsONL1{
  protectedNL1mYc86_DYWNL1(NL1wbIaZNL1:NL1 CharNL1,NL1 `UK1YJ`NL1:NL1 BoolNL1,NL1 R!NL1:NL1 UnitNL1,NL1 `Fj`!NL1:NL1 Unit = ()NL1,NL1 private var MfnuDga7Q!NL1:NL1 Rune = 'm'NL1)NL1 {NL1
    super(NL1{`Qn2PTov3N`NL1:NL1Range<Int8>NL1,NL1 kgOiS7i_ZpNL1:NL1Range<Int8>NL1,NL1 I8hPPNeNL1:NL1Bool => return {`UqYerH_7cP`:Array<Float16> => return 0b0}}NL1,NL1 'g'NL1)
    this.MfnuDga7Q = 'O'NL1
    funcNL1nsQbfU28<`vMBoilz`>NL1(NL1`wOmo`NL1:NL1 CharNL1,NL1 OVNL1:NL1 Float64NL1)NL1 {}NL1
    letNL1`lAn`NL1=NL1-24.74e29NL1
  NL1}NL1
}


main() NL1 {
  varNL1t1: Int64 =NL1123
  Assert.equals(123,NL1 t1)
  returnNL10
}
NL1
'''

test_NL1_template = test_NL1_template.replace('SCRIPT_NAME', basename(__file__))
test_NL1_template = test_NL1_template.replace('SEED', str(RND_SEED))

counter = 1
for i in range(counter, counter + 10):
    num = f'{counter:02d}'
    test_text = test_NL1_template.replace('NUM', num)
    test_splitted = test_text.split('NL1')
    result_test = ''
    for chunk in test_splitted:
        result_test += chunk
        result_test += get_multiple_new_lines()
    file_name = f'test_a01_{num}.cj'
    with open(join(ouput_path, file_name), 'w', encoding='utf-8') as f:
        f.write(result_test)
    counter += 1
