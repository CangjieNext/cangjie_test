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
from utils.cj_ws_nl import get_multiple_white_spaces

RND_SEED = 1
random.seed(RND_SEED)
ouput_path = join(dirname(__file__), pardir, '01_lexical_grammar', '02_whitespace_and_newline', 'a01')

test_ws_template = '''
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
                WS
                    : [\\u0020\\u0009\\u000C]
                    ;
  @Description: Check usage white spaces in diffent places
  @Comment:     Auto-generated tests by SCRIPT_NAME with seed = SEED
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       6212
*/
from utils import utils.assert.Assert

WS1

main() WS2 {
  var WS3 t1: Int64 = WS4 123
  Assert.equals(123, WS5 t1)
  return WS6 0
}
WS7
'''

test_ws_template = test_ws_template.replace('SCRIPT_NAME', basename(__file__))
test_ws_template = test_ws_template.replace('SEED', str(RND_SEED))

counter = 1
for i in range(counter, counter + 10):
    num = f'{counter:02d}'
    test_text = test_ws_template.replace('NUM', num)
    ws1 = get_multiple_white_spaces()
    ws2 = get_multiple_white_spaces()
    ws3 = get_multiple_white_spaces()
    ws4 = get_multiple_white_spaces()
    ws5 = get_multiple_white_spaces()
    ws6 = get_multiple_white_spaces()
    ws7 = get_multiple_white_spaces()
    test_text = test_text.replace('WS1', ws1)
    test_text = test_text.replace('WS2', ws2)
    test_text = test_text.replace('WS3', ws3)
    test_text = test_text.replace('WS4', ws4)
    test_text = test_text.replace('WS5', ws5)
    test_text = test_text.replace('WS6', ws6)
    test_text = test_text.replace('WS7', ws7)
    file_name = f'test_a01_{num}.cj'
    with open(join(ouput_path, file_name), 'w', encoding='utf-8') as f:
        f.write(test_text)
    counter += 1
