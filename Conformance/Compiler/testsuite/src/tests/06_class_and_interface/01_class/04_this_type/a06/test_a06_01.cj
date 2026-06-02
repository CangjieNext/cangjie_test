/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_04_a06_01

  @Level:         1

  @Assertion: 6.1.4(6)
              If the instance member function does not declare a return type
              and only an expression of type This is present,
              the return type of the current function is inferred to be This.

  @Description: Check that functions without explicit return type and returning This expressions
                can be used in the return statement of a functions with explicit This return type

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Test {
    func this_func(): This {
        this
    }

    func f1() {
        this
    }
    
    func f2() {
        return this
    }

    func f3() {
        this_func()
    }

    func f4() {
        return this_func()
    }

    func t1(): This {
        f1()
    }

    func t2(): This {
        return f2()
    }

    func t3(): This {
        f3()
    }

    func t4(): This {
        return f4()
    }
}

main() {
    let tst = Test()
    Assert.isTrue(tst.t1() is Test)
    Assert.isTrue(tst.t2() is Test)
    Assert.isTrue(tst.t3() is Test)
    Assert.isTrue(tst.t4() is Test)
}