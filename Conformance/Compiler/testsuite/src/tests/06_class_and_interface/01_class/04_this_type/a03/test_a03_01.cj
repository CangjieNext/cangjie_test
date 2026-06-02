/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_04_a03_01

  @Level:         1

  @Assertion: 6.1.4(3)
              This type is a subtype of the current type,
              and This can be automatically cast to the current type,
              but not vice versa.

  @Description: Check that This type is automatically cast to the current type

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

class Test {
    func f(): This {
        this
    }

    func g(x: Test) {
        if (x is Test) {
            return true
        } else {
            return false
        }
    }

    func h(): Test {
        return f()
    }

    mut prop p: Test {
        get() {
            f()
        }
        set(v) {
            Assert.isTrue(v is Test)
        }
    }

    func test() {
        Assert.isTrue(f() is Test)
        Assert.isTrue(g(f()))
        let x: Test
        x = f()
        Assert.isTrue(x is Test)
        Assert.isTrue(h() is Test)
        Assert.isTrue(p is Test)
        p = f()
    }
}

main() {
    Test().test()
}