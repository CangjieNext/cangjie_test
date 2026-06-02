
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_02_a06_05

  @Level:         1

  @Assertion:   16.2(6) 4.const functions, which contain function names declared using const, lambda's that match the
                requirements of const functions, and the function expressions returned by those functions.
  @Description: Check that const functions, lambda's that match the requirements of const functions and the function
                expressions are const expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

const func f() { 
    const func f0() {
        const func f1() {
            const func f2() {
                const func f3() {
                    1
                }
                f3()
            }
            f2()
        }
        f1()
    }
    f0()
}

main() {
    const c1 = f
    Assert.equals(1, c1())
}
