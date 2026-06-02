
import os

operators = ['as', 'is']
dir = os.path.dirname(os.path.realpath(__file__))
aux_path = dir + '/aux_' + os.path.basename(dir) + '.cj'
path = dir + '/test_' + os.path.basename(dir) + '_{}.cj'
sizes = [8, 16, 32, 64]
aux_template = '''
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.
/*
  @Description:  Aux file with functions
  @Structure:    complex-aux
*/

from utils import utils.assert.Assert

{}
'''
aux_def_template = '''
func toUInt{size}(x : Int{size}) {{
    let xU : UInt{size}
    if (x < 0) {{
        xU = UInt{size}(x + Int{size}.Max + 1) + (1u{size} << {size_minus_1})
    }} else {{
        xU = UInt{size}(x)
    }}
    return xU
}}

func toInt{size}(x : UInt{size}) {{
    let xI : Int{size}
    if (x > UInt{size}(Int{size}.Max)) {{
        xI = Int{size}(x - (1u{size} << {size_minus_1})) + Int{size}.Min 
    }} else {{
        xI = Int{size}(x)
    }}
    return xI
}}

func getBit(x : UInt{size}, idx : UInt8) {{
    Assert.isTrue(idx < {size})
    var val = x
    for (i in 0..idx) {{
        val = val / 2
    }}
    return val % 2
}}

func getBit(x : Int{size}, idx : UInt8) {{
    return toInt{size}(getBit(toUInt{size}(x), idx))
}}
'''
logic_template = '''
/*
 * Copyright (c). 2023-2023. All rights reserved.
 */

/*
  @Assertion:   4.18(3) The operand is regarded as a bit vector and the bitwise operator is applied bit-by-bit
                (for logic operations, regarding 0 as false and 1 as true).
  @Description: Checks that changing an operand's bits in several positions only affects result in these very positions
                for &, ^, | for {type}.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a03.cj
  @CompileWarning: no
*/

from std import random.Random

main() {{
    let rnd = Random(123)

    let lhs = rnd.next{type}()
    let rhs = rnd.next{type}()
    let and = lhs & rhs
    let xor = lhs ^ rhs
    let or = lhs | rhs
    let inv = !lhs

    for (i in 0..1024) {{
        let newLhs = rnd.next{type}()
        let newRhs = rnd.next{type}()
        let newAndLhs = newLhs & rhs
        let newAndRhs = lhs & newRhs
        let newXorLhs = newLhs ^ rhs
        let newXorRhs = lhs ^ newRhs
        let newOrLhs = newLhs | rhs
        let newOrRhs = lhs | newRhs
        let newInv = !newLhs
        for (j in 0u8..{}u8) {{
            let andBit = getBit(and, j)
            let xorBit = getBit(xor, j)
            let orBit = getBit(or, j)

            if (getBit(lhs, j) == getBit(newLhs, j)) {{
                Assert.equals(andBit, getBit(newAndLhs, j))
                Assert.equals(xorBit, getBit(newXorLhs, j))
                Assert.equals(orBit, getBit(newOrLhs, j))
                Assert.equals(getBit(inv, j), getBit(newInv, j))
            }}

            if (getBit(rhs, j) == getBit(newRhs, j)) {{
                Assert.equals(andBit, getBit(newAndRhs, j))
                Assert.equals(xorBit, getBit(newXorRhs, j))
                Assert.equals(orBit, getBit(newOrRhs, j))
            }}
        }}
    }}
}}

'''
shift_template = '''
/*
 * Copyright (c). 2023-2023. All rights reserved.
 */

/*
  @Assertion:   4.18(3) The operand is regarded as a bit vector and the bitwise operator is applied bit-by-bit
                (for logic operations, regarding 0 as false and 1 as true).
  @Description: Checks match between bit vectors of left operand of shift and result for {type}.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a03.cj
  @CompileWarning: no
*/

from std import random.Random

main() {{
    let rnd = Random(123)

    for (i in 0..512) {{
        let lhs = rnd.nextUInt64()
        for (j in 0u8..{size}u8) {{
            let shl = lhs << j
            let shr = lhs >> j
            for (k in 0u8..({size}-j)) {{
                Assert.equals(getBit(shr, k), getBit(lhs, k + j))
                Assert.equals(getBit(lhs, k), getBit(shl, k + j))
            }}
        }}
    }}
}}

'''

def write_counted(contents : str):
  global counter
  with open(path.format(str(counter).zfill(2)), 'w') as file:
    file.write(contents)
    counter += 1

with open(aux_path, 'w') as file:
  aux_def = ''.join((aux_def_template.format(size=s, size_minus_1=s-1) for s in sizes))
  file.write(aux_template.format(aux_def))

counter = 1
for size in sizes:
  for sign in ['Int', 'UInt']:
    write_counted(logic_template.format(size, type=sign + str(size)))
    write_counted(shift_template.format(size=size, type=sign + str(size)))
  
