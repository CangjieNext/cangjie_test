# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import string

test_template = '''
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a04_NUM
  @Assertion:   12.1.1.1(4) Decimal literals do not require a prefix.
  @Description: Checks that '0CHAR' can't be used as decimal prefix
  @Comment:     Auto-generated test by gen_tests.py
  @Mode:        compileOnly
  @Negative:    yes
  @Structure:   single
*/

main() {
  let value = VALUE
  return 0
}
'''


letters = string.ascii_letters
letters = letters.replace('b','').replace('B','') # cut binary character prefix
letters = letters.replace('o','').replace('O','') # cut octal character prefix
letters = letters.replace('x','').replace('X','') # cut hexadecimal character prefix
letters = letters.replace('e','').replace('E','') # cut exponent character

letters = list(letters)

counter = 2
for ch in letters:
    value = f'0{ch}12345'
    num = f'{counter:02d}'
    test_text = test_template.replace('CHAR', ch).replace('NUM', num).replace('VALUE', value)
    file_name = f'test_a04_{num}.cj'
    with open(file_name, 'w') as f:
      f.write(test_text)
    counter += 1