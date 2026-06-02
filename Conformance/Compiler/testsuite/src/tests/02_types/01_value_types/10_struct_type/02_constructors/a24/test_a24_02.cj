/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:02_01_10_02_a24_02

  @Level:         1

  @Assertion: 2.1.10.2(24)
              Declarations and expressions are allowed in the primary constructor body
              but must meet the requirements of init constructors.

  @Description: Check the allowed uses of this

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006194, 0006124

  @Comment: The behaviour of properties is not well described.
            From some of the statements it seems that properties behave like functions.
            But since there's no clear explanation, the issue 6194 is filed.

*/

import utils.assert.Assert

struct A {
    A() {
        // It's allowed to access initialized 'this' instance member variables
        let c = this.init_x
        Assert.equals(10, c)
        let d = this.init_y
        Assert.equals(20, d)

        // Initialize uninitialized instance member variables
        this.uninit_x = 30
        this.uninit_y = 40

        // After initializing all instance variables it's allowed to access them by 'this'
        let e = this.uninit_x
        Assert.equals(30, e)
        let f = this.uninit_y
        Assert.equals(40, f)

        // After all instance variables are initialized it's allowed
        // to call 'this' instance functions
        let h = this.this_f()
        Assert.equals(1, h)

        // The rules for properties are likely the same as the rules for functions,
        // i.e. they can be accessed after every instance variable is initialized
        let l = this.this_mut_prop
        Assert.equals(-3, l)
        let m = this.this_immut_prop
        Assert.equals(-4, m)
    }

    init(x: Int64) {
        uninit_x = 1
        uninit_y = 1
    }

    var init_x = 10
    let init_y = 20

    var uninit_x: Int64
    let uninit_y: Int64

    func this_f() {
        return 1
    }

    mut prop this_mut_prop: Int64 {
        get() {
        -3
        }
        set(v) {}
    }

    prop this_immut_prop: Int64 {
        get() {
        -4
        }
    }
}

main() {
    let tst = A()
}