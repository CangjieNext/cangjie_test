/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_01_a03_01

  @Level:         1

  @Assertion:    12.1.1.1(3) 3. If the context does explicitly require a certain type, the try block and
                                each of the catch blocks (ifpresent) are required to be a subtype of the required type.
                                In this case, however, they are not required to have their least common super type. 

  @Description:  Checks the try & catch blocks are required to be a subtype of the required type
                 when certain one is used.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class A {}
open class B <: A {}
open class C <: B {}
main() {
// test case #1
    let e1 : Float64 = try {
        1.0
    } catch(_){
        2.0
    }
    Assert.isTrue(e1 is Float64)
// test case #2
    let v21 : Float64 = 1.0
    let v22 : Float64 = 2.0
    let e2 : Float64 = try {
        v21
    } catch(_) {
        v22
    }
    Assert.isTrue(e2 is Float64)
// test case #3
    let v31 : B = B()
    let v32 : C = C()
    let e3  : A = try {
        v31
    } catch(_) {
        v32
    }
    Assert.isTrue(e3 is A)

// test case #4
    try {
        A()
    } catch(_) {
        B()
    }
    
    return
}
