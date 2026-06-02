/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            03_02_03_02_a06_01

  @Level:         1

  @Assertion:       3.2.3.2(6) Local function scope starts after the function defined 
                    and ends with the closing of the block.

  @Description:     Checks that declaration of local functions for different blocks and verification whether the 
                    assertion is not violated.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/

import utils.assert.Assert

func foo() : Int32 { return 0 }

class Test {
    func foo() : Int32 { return -1 }    
}

func myBoolFunc(i: Int64){
    if(i > 0){
        return false
    }
    return true
}

main() {
// test case #1
    if (true) {
        func foo() : Int32 { return 1 }
        Assert.equals(1, foo())
    }
    Assert.equals(0, foo())

// test case #2
    if (myBoolFunc(1)) {
    } else {
        func foo() : Int32 { return 2 }
        Assert.equals(2, foo())
    }
    Assert.equals(0, foo())

// test case #3
    var cnt3 = 1
    while (cnt3 > 0) {
        cnt3--
        func foo() : Int32 { return 3 }
        Assert.equals(3, foo())
    }
    Assert.equals(0, foo())

// test case #4
    var cnt4 = 0
    do {
        cnt4++
        func foo() : Int32 { return 4 }
        Assert.equals(4, foo())
    } while (cnt4 < 1)

// test case #5
    let intArray: Array<Int32> = [ 0, 1, 2 ]
    for (item in intArray) {
        func foo() : Int32 { return 5 }
        Assert.equals(5, foo())
    }

// test case #6
    try {
        func foo() : Int32 { return 6 }
        Assert.equals(6, foo())
    } catch (_) {
        func foo() : Int32 { return -1 }
        Assert.equals(-1, foo())
    }

// test case #7
    try {
    } catch (_) {
    } finally {
        func foo() : Int32 { return 7 }
        Assert.equals(7, foo())
    }

// test case #8
    func foo8() {
        func foo() : Int32 { return 8 }
        Assert.equals(8, foo())
    }
    foo8()

// test case #9
    Assert.equals(-1, Test().foo())

// test case #10
    func foo10() : Int32 { func foo() : Int32 { return 10 } ; return foo() }
    Assert.equals(10, foo10())

// test case #11
    func bar() : Int32 { return 11 }
    Assert.equals(11, bar())
}




