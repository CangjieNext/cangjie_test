
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Comment:     This assertion is a part of the list with the heading
                "The following expressions are all const expressions."
  @Name:     16_02_a04_01

  @Level:         1

  @Assertion:   16.2(4) 2.Array literals (cannot be of type Array) and tuple literals whose elements are all const.
  @Description: Checks that literals of type Numeric, Bool, Unit, Rune, String are const expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6077, 6614

*/

import utils.assert.Assert

const func f() { 1 }

class A {
    static const c = 2
}

main() {
    
    const a2 : VArray<Int64, $3> = [1, 2, 3]
    const a4 : VArray<Int64, $3> = [f(), A.c, 3]

    Assert.equals([1, 2, 3], Array(a2.size) { i => a2[i] })
    Assert.equals([1, 2, 3], Array(a4.size) { i => a2[i] })

    const t1 = (1, 2, "3")
    const t2 : (Int64, Int64, String) = (1, 2, "3")
    const t3 = (f(), A.c, "3")
    const t4 : (Int64, Int64, String) = (f(), A.c, "3")

    Assert.isTrue((1, 2, "3") == t1)
    Assert.isTrue((1, 2, "3") == t2)
    Assert.isTrue((1, 2, "3") == t3)
    Assert.isTrue((1, 2, "3") == t4)

    return 0
}
