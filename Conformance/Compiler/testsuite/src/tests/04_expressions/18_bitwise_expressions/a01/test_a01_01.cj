
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a01_01

  @Level:         1

  @Assertion:   4.18(1) Bitwise expressions are expressions that contain bitwise operators. There are one unary bitwise
                operator, i.e., bitwise NOT (!), and five binary bitwise operators, i.e., bitwise left shift (<<),
                bitwise right shift (>>), bitwise AND (&), bitwise XOR (^) and bitwise OR (|).
  @Description: Checks compilation and execution of a program that uses bitwise operators. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let x = 0x123
    let y = 0x12

    Assert.equals(4, 1<<2)
    Assert.equals(1164, x<<2)
    Assert.equals(1164, (x)<<2)
    Assert.equals(1164, (x)<<2)
    Assert.equals(262144, 1<<y)
    Assert.equals(76283904, x<<y)
    Assert.equals(76283904, (x)<<y)
    Assert.equals(76283904, (x)<<y)
    Assert.equals(262144, 1<<(y))
    Assert.equals(76283904, x<<(y))
    Assert.equals(76283904, (x)<<(y))
    Assert.equals(76283904, (x)<<(y))
    Assert.equals(262144, 1<<(y))
    Assert.equals(76283904, x<<(y))
    Assert.equals(76283904, (x)<<(y))
    Assert.equals(76283904, (x)<<(y))

    Assert.equals(0, 1>>2)
    Assert.equals(72, x>>2)
    Assert.equals(72, (x)>>2)
    Assert.equals(72, (x)>>2)
    Assert.equals(0, 1>>y)
    Assert.equals(0, x>>y)
    Assert.equals(0, (x)>>y)
    Assert.equals(0, (x)>>y)
    Assert.equals(0, 1>>(y))
    Assert.equals(0, x>>(y))
    Assert.equals(0, (x)>>(y))
    Assert.equals(0, (x)>>(y))
    Assert.equals(0, 1>>(y))
    Assert.equals(0, x>>(y))
    Assert.equals(0, (x)>>(y))
    Assert.equals(0, (x)>>(y))

    Assert.equals(0, 1&2)
    Assert.equals(2, x&2)
    Assert.equals(2, (x)&2)
    Assert.equals(2, (x)&2)
    Assert.equals(0, 1&y)
    Assert.equals(2, x&y)
    Assert.equals(2, (x)&y)
    Assert.equals(2, (x)&y)
    Assert.equals(0, 1&(y))
    Assert.equals(2, x&(y))
    Assert.equals(2, (x)&(y))
    Assert.equals(2, (x)&(y))
    Assert.equals(0, 1&(y))
    Assert.equals(2, x&(y))
    Assert.equals(2, (x)&(y))
    Assert.equals(2, (x)&(y))

    Assert.equals(3, 1^2)
    Assert.equals(289, x^2)
    Assert.equals(289, (x)^2)
    Assert.equals(289, (x)^2)
    Assert.equals(19, 1^y)
    Assert.equals(305, x^y)
    Assert.equals(305, (x)^y)
    Assert.equals(305, (x)^y)
    Assert.equals(19, 1^(y))
    Assert.equals(305, x^(y))
    Assert.equals(305, (x)^(y))
    Assert.equals(305, (x)^(y))
    Assert.equals(19, 1^(y))
    Assert.equals(305, x^(y))
    Assert.equals(305, (x)^(y))
    Assert.equals(305, (x)^(y))

    Assert.equals(3, 1|2)
    Assert.equals(291, x|2)
    Assert.equals(291, (x)|2)
    Assert.equals(291, (x)|2)
    Assert.equals(19, 1|y)
    Assert.equals(307, x|y)
    Assert.equals(307, (x)|y)
    Assert.equals(307, (x)|y)
    Assert.equals(19, 1|(y))
    Assert.equals(307, x|(y))
    Assert.equals(307, (x)|(y))
    Assert.equals(307, (x)|(y))
    Assert.equals(19, 1|(y))
    Assert.equals(307, x|(y))
    Assert.equals(307, (x)|(y))
    Assert.equals(307, (x)|(y))

    Assert.equals(-2, !1)
    Assert.equals(-292, !x)
    Assert.equals(-292, !(x))
}
