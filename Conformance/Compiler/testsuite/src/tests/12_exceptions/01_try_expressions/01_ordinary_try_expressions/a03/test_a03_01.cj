/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a03_01

  @Level:         1

  @Assertion:    12.1.1(3) 1. A try block starts with the keyword try and is followed by a block consisting
                              of expressions and declarations (defined in a pair of braces) which creating
                              a new local scope and can contain any expression   and declaration).

  @Description:  Checks of local scope for some variants of ordinary try expression.

  @Mode:         run 

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
main() {
// test case #1
    try {
        let a = 0
        func foo() : Int32 {
            return 100
        }
        Assert.equals(100, foo())
    } catch (_) {}
// test case #2
    try {
        func foo() : Float64 {
            return 1.0
        }
        Assert.equals(1.0, foo())
    } finally {}
// test case #3
    try {
        let a : Int32 = 1
        let foo : () -> Int32 = {=>
            return 10
        }
        var b = a + foo()
        Assert.equals(11, b)
    } catch (_) {
    } finally {}
// test case #4
    try {
        var a : Int32 = 0
        func foo() : Int32 {
            a = 20
            return a
        }
        Assert.equals(20, foo())
    } catch (_) {
    } finally {}
// test case #5
    let arr : Array<Int32> = [0, 1, 2]
    var arr1: Array<Int32> = [0, 0, 0]
    try {
        var ind = 2
        while (ind >= 0) {
            arr1[ind] = arr[ind] / arr[ind]
            ind--
        }
    } catch (e: ArithmeticException) {
        Assert.equals(0, arr1[0])
        Assert.equals(1, arr1[1])
        Assert.equals(1, arr1[2])
    }
}
