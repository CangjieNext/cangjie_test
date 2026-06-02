/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_01_a02_01

  @Level:         1

  @Assertion:    12.1.1.1(2) 2. If the context does not explicitly require a certain type, the try block and
                                all catch blocks (if present) are required to have their least common super type,
                                which is also the type of the entire try expression. 


  @Description:  Checks the try & catch blocks have to have the common super type when no certain one is required.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class A {}
open class B <: A {}
open class C <: B {}
open class MyException <: Exception {}
open class E <: MyException {}
main() {
// test case #1
    let e1 = try {
        1
    } catch(_) {
        2
    }
    Assert.isTrue(e1 is Int64)
// test case #2
    let v21 : Int64 = 1
    let v22 : Int64 = 2

    let e2 = try {
        v21
    } catch(_) {
        v22
    }
    Assert.isTrue(e2 is Int64)
// test case #3
    let e3 = try {
        1.0
    } catch(_) {
        2.0
    }
    Assert.isTrue(e3 is Float64)
// test case #4
    let v41 : Float64 = 1.0
    let v42 : Float64 = 2.0
    let e4 = try {
        v41
    } catch(_) {
        v42
    }
    Assert.isTrue(e4 is Float64)
// test case #5
    let e5 = try {
        "String #1"
    } catch(_) {
        "String #2"
    }
    Assert.isTrue(e5 is String)
// test case #6
    let v61 : String = "1"
    let v62 : String = "2"
    let e6 = try {
        v61
    } catch(_) {
        v62
    }
    Assert.isTrue(e6 is String)
// test case #7
    let b : B = B()
    let c : C = C()
    let e7 = try {
        b
    } catch(_) {
        c
    }
    Assert.isTrue(e7 is A)
// test case #8
    let e8 = try {
    } catch(_) {
        C()
    }
    Assert.isTrue(e8 is Unit)
// test case #9
    let e9 = try {
        B()
    } catch(_) {
    }
    Assert.isTrue(e9 is A)
// test case #10
    let e10 = try {
    } catch(_) {
    }
    Assert.isTrue(e10 is Unit)
// test case #11
    let e11 = try {
        Exception()
    } catch(e: MyException) {
        MyException()
    } catch(e: Exception) {
        Exception()
    }
    Assert.isTrue(e11 is Exception)
}
