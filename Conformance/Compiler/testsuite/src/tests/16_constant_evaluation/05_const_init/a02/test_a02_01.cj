
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_05_a02_01

  @Level:         1

  @Assertion:   16.5(2) 2.The unrefined init of type Object is also a const init, so subclasses of Object can use the
                const init.
  @Description: Check that Object has const init, and if a class inherits it explicitly, this class can define
                const init as well.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert
    
class C <: Object {
    static const c = 1
    let l: Int64

    const init() {
        l = 2
    }

    const func f() { 3 }
}

main() {
    const o = Object()
    Assert.isTrue(o is Object)

    const c = C()
    Assert.equals(1, C.c)
    Assert.equals(2, c.l)
    Assert.equals(3, c.f())
}
