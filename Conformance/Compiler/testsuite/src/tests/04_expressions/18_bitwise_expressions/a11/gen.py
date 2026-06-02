# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.


import os

dir = os.path.dirname(os.path.realpath(__file__))
path = dir + '/test_' + os.path.basename(dir) + '_{}.cj'
signed_types = { 'Int' + str(size) : size for size in [8, 16, 32, 64] }
template = '''
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion:   4.18(11) Otherwise (i.e., the operand to the left of the operator is a signed negative integer), 1 is
                used to fill the trailing positions after the shift (on the left it is the right shift operator or on
                the right if it is the left shift operator).
  @Description: Checks the bits on trailing positions after the left and right shifts for types {t1} and {t2} when
                the left operand is negative.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a11.cj
  @CompileWarning: no
*/

from std import random.Random

main() {{
    let rnd = Random(123)

    for (_ in 0..2**10) {{
        let lhs = rnd.next{t1}({t1}.Max) + {t1}.Min
        for (i in 0u8..{size}u8) {{
            let rhs = {t2}(i)
            let shl = lhs << rhs
            let shr = lhs >> rhs
            for (j in 0u8..i) {{
                Assert.equals(0, getBit(shl, j))
                Assert.equals(1, getBit(shr, {size}-j-1))
            }}
        }}
    }}
}}
'''
counter = 1

def write_counted(contents : str):
  global counter
  with open(path.format(str(counter).zfill(2)), 'w') as file:
    file.write(contents)
    counter += 1

for t1, size in signed_types.items():
  for t2, size2 in signed_types.items():
    write_counted(template.format(size=size, t1=t1, t2=t2))
    write_counted(template.format(size=size, t1=t1, t2='UInt' + str(size2)))
