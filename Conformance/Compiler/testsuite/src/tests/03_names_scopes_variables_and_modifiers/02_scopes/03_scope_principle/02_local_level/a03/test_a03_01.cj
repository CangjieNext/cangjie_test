/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a03_01

  @Level:         1

  @Assertion:    3.2.3.2(3) The scope of local variables starts after the variable declaration 
                 and ends with the closing of the block.

  @Description:  Checks that variable defined within some blocks is accessible within it's scope.

  @Mode:        run

  @Negative:    no

  @Structure:    single

*/

import utils.assert.Assert

main() {
// test case #1
    if (true) { 
        let v1 : Int32 = 0
        let v2 : Int64 = 1
        let v3 : String = "block #1"
        Assert.equals(0, v1)
        Assert.equals(1, v2)
        Assert.equals("block #1", v3)
    }

// test case #2
    func foo2(a : Int32, b : Int64, s : String) {
        let v1 : Int32 = a
        let v2 : Int64 = b
        let v3 : String = s
        Assert.equals(-1, v1)
        Assert.equals(-2, v2)
        Assert.equals("foo2", v3)
    }
    foo2(-1, -2, "foo2")

// test case #3
    if (true) {
        let v1 : Int64 = 10 ** 2
        let v2 = 11 / 11
        let v3 = "test case #3"
        Assert.equals(100, v1)
        Assert.equals(1, v2)
        Assert.equals("test case #3", v3)
    }

// test case #4
    try { 
        let num = - 5 
        Assert.equals(-5, num)
        throw ArithmeticException()
    } catch (e: ArithmeticException) {
        let num = -10
        Assert.equals(-10, num)
    }

// test case #5
    var cnt = 1
    do {
       cnt--
       let v5 = 10
       Assert.equals(10, v5)
    } while (cnt > 0)   

// test case #6
    var num = 1
    while (num != 0) {
       num--
       let v6 = 10
       Assert.equals(10, v6)
    }

// test case #7
    for (item in [0, 1, 2, 3]) {
       var v7 = -10
       Assert.equals(-10, v7)
       v7++
       Assert.equals(-9, v7)
    }  

// test case #8
    let foo : (Int64, Int64) -> Unit = { a: Int64, b: Int64 =>
    (
        if ( a < b ) {
            let a : Int64 = a + 1
            let b : Int64 = b + 1;
            Assert.equals(1, a)
            Assert.equals(2, b)
        } else {
            let a : Int64 = a << 1
            let b : Int64 = b + a
            Assert.equals(4, a)
            Assert.equals(5, b)
        }
    )
    }

    foo(0, 1)
    foo(2, 1)
}
