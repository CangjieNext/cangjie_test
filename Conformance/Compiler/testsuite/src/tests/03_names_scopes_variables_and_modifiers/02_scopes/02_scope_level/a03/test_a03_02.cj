/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            03_02_02_a03_02

  @Level:         1
  @Assertion:       3.2.2(3) Names in its nested scope can be accessed directly by using the name without 
                    any qualifier, if they are not shadowed or overridden.

  @Description:     Check that we can access an entity by the name without any qualifier. In this case, the result of a
                    direct call by the name will be exactly the same as a call by the name with a qualifier.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import {utils.macros.*, utils.assert.Assert}

struct S {
    func b() {
        Assert.equals(f(), this.f())
    }

    func f() { 0.01 }
}

enum A { B | Unused
    func b() {
        Assert.equals(f(), this.f())
    }
    func f() { 0.1 }
}

func f() { 1.0 }

main() {
    // Class
    S().b()
    let a = S().f()
    // Enum
    let b = A.B
    let c = B
    A.B.b()
    B.b()
    let d = A.B.f()
    let e = B.f()
    // Func
    let g = f()

    @matchOrThrow[B](b)
    @matchOrThrow[A.B](c)
    Assert.notEquals(a, d)
    Assert.notEquals(a, e)
    Assert.equals(d, e)
    Assert.notEquals(a, g)
    Assert.notEquals(d, g)
    Assert.notEquals(e, g)
}
