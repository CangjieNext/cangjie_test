# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.


import os

operators = ['as', 'is']
dir = os.path.dirname(os.path.realpath(__file__))
aux_path = dir + '/aux_' + os.path.basename(dir) + '.cj'
path = dir + '/test_' + os.path.basename(dir) + '_{}.cj'
sizes = [8, 16, 32, 64]
template = '''
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion:   4.18(4) For &, ^ and |, the value of the operation is a bit vector such that each bit is the value of
                applying the respective logical operations (i.e., logic AND and logic OR) on the bits of the
                corresponding operands. See the Logical Expressions for the semantics of each logic operation. Refer to
                the last section for the precedence and associativity of bitwise operators.
  @Description: Checks for random {type} numbers a, b that corresponding bits of a, b and a & b, a ^ b, a | b satisfy
                the semantic requirements for these operations. Check for these numbers that operations are preserved
                in the {{0, 1, &, |}} -> {{false, true, &&, ||}} homomorphism.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a04.cj
  @CompileWarning: no
*/

from std import random.Random

main() {{
    let rnd = Random(123)

    for (_ in 0..1024) {{
        let lhs = rnd.next{type}()
        let rhs = rnd.next{type}()
        let and = lhs & rhs
        let xor = lhs ^ rhs
        let or = lhs | rhs

        for (i in 0u8..{}u8) {{
            let lhsBit = getBit(lhs, i)
            let rhsBit = getBit(rhs, i)
            let andBit = getBit(and, i)
            let xorBit = getBit(xor, i)
            let orBit = getBit(or, i)

            var andBitCheck : {type}
            if (lhsBit != 0 && rhsBit != 0) {{
                andBitCheck = 1
            }} else {{
                andBitCheck = 0
            }}
            Assert.equals(andBitCheck, andBit)

            var xorBitCheck : {type}
            if (lhsBit != rhsBit) {{
                xorBitCheck = 1
            }} else {{
                xorBitCheck = 0
            }}
            Assert.equals(xorBitCheck, xorBit)

            var orBitCheck : {type}
            if (lhsBit != 0 || rhsBit != 0) {{
                orBitCheck = 1
            }} else {{
                orBitCheck = 0
            }}
            Assert.equals(orBitCheck, orBit)

            var lhsBitBool = lhsBit != 0
            var rhsBitBool = rhsBit != 0
            var andBitBool = andBit != 0
            var orBitBool = orBit != 0
            Assert.equals(andBitBool, lhsBitBool && rhsBitBool)
            Assert.equals(orBitBool, lhsBitBool || rhsBitBool)
        }}
    }}
}}
'''

counter = 1
for size in sizes:
  for sign in ['Int', 'UInt']:
    with open(path.format(str(counter).zfill(2)), 'w') as file:
      file.write(template.format(size, type=sign + str(size)))
    counter += 1
