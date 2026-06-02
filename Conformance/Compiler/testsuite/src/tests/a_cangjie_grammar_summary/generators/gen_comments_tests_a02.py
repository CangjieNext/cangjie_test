# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
Test generator for verifying single-line comments
'''

import random
from os.path import basename, dirname, join, pardir
from utils.markov_text_gen import generate_random_text
from utils.cj_comments import get_line_comment

RND_SEED = 1
random.seed(RND_SEED)
ouput_path = join(dirname(__file__), pardir, '01_lexical_grammar', '01_comments', 'a02')

test_line_comment_template = '''
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_01_01_a02_NUM
  @Assertion:   A.1.1(2)
                LineComment
                    : '//' ~[\\u000A\\u000D]*
                    ;
  @Description: Check line comment syntax
  @Comment:     Auto-generated tests by SCRIPT_NAME with seed = SEED
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
from utils import utils.assert.Assert

COMMENT1

main() { COMMENT2
  var t1: Int64 = 123 COMMENT3 ; t1 = 321
  Assert.equals(123, t1)
  return 0
}

COMMENT4
'''

test_line_comment_template = test_line_comment_template.replace('SCRIPT_NAME', basename(__file__))
test_line_comment_template = test_line_comment_template.replace('SEED', str(RND_SEED))

counter = 1
for i in range(counter, counter + 10):
    num = f'{counter:02d}'
    test_text = test_line_comment_template.replace('NUM', num)
    comment1 = get_line_comment()
    comment2 = get_line_comment()
    comment3 = get_line_comment()
    comment4 = get_line_comment()
    test_text = test_text.replace('COMMENT1', comment1)
    test_text = test_text.replace('COMMENT2', comment2)
    test_text = test_text.replace('COMMENT3', comment3)
    test_text = test_text.replace('COMMENT4', comment4)
    file_name = f'test_a02_{num}.cj'
    with open(join(ouput_path, file_name), 'w', encoding='utf-8') as f:
        f.write(test_text)
    counter += 1
