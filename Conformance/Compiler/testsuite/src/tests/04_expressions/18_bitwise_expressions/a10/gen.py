# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.


import os

dir = os.path.dirname(os.path.realpath(__file__))
path = dir + '/test_' + os.path.basename(dir) + '_{}.cj'
types = { prefix + str(size) : (size, prefix) for size in [8, 16, 32, 64] for prefix in ('Int', 'UInt') }
template = '''
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion:   4.18(10) If the operand to the left of the operator is an unsigned integer or a positive integer, the
                bits are shifted to the left or right accordingly and zeros are used to fill the trailing positions
                after the shift (on the left if it is the right shift operator, or on the right if it is the left shift
                operator)
  @Description: Checks the semantics of operators << and >> for types {t1} and {t2} when the left operand is not
                negative. 
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a10.cj
  @CompileWarning: no
*/

from std import random.Random

main() {{
    let rnd = Random(123)

    for (_ in 0..2**8) {{
        let lhs = rnd.next{t1}({t1}.Max)
        for (i in 0u8..{size}u8) {{
            let rhs = {t2}(i)
            let shl = lhs << rhs
            let shr = lhs >> rhs
            for (j in 0u8..({size}u8-i)) {{
                Assert.equals(getBit(shr, j), getBit(lhs, j + i))
                Assert.equals(getBit(lhs, j), getBit(shl, j + i))
            }}
            for (j in 0u8..i) {{
                Assert.equals(0, getBit(shl, j))
                Assert.equals(0, getBit(shr, {size}-j-1))
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

for t1, (size, prefix) in types.items():
  for t2 in types:
    write_counted(template.format(size=size, t1=t1, t2=t2))
  