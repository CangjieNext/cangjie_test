/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a16_01

  @Level:         1

  @Assertion: 4.3(16) When the context does require a specific type, then both
              branches of the if expression must be a subtype of the specific
              type required by the context.
  @Description: Checks that when the context requires a specific type, 
                if-expression branch types should return subtype of the type 
                required by the context.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

var x = Assert.getRuntimeZero()

open class C {}
open class C1 <: C {}
open class C2 <: C1 {}
class C3 <: C {}

struct S {
    let id: Int64
    
    init(i: Int64) {
        id = i
    }
}

func checkCustomClass() {
    var v1: C =
        if (x == 0) {
            C()
        } else {
            C()
        } 
    Assert.isTrue(v1 is C)

    var v2: C =
        if (x == 1) {
            C()
        } else {
            C1()
        } 
    Assert.isTrue(v2 is C)

    var v3: C =
        if (x == 0) {
            C1()
        } else {
            C()
        } 
    Assert.isTrue(v3 is C)

    var v4: C  =
        if (x == 0) {
            C2()
        } else {
            C()
        } 
    Assert.isTrue(v4 is C)

    var v5: C =
        if (x == 0) {
            C1()
        } else {
            C2()
        } 
    Assert.isTrue(v5 is C1)

    var v6: C1 =
        if (x == 0) {
            C2()
        } else {
            C1()
        } 
    Assert.isTrue(v6 is C1)

    var v7: C =
        if (x == 0) {
            C1()
        } else {
            C3()
        } 
    Assert.isTrue(v7 is C)

    var v8: C =
        if (x == 0) {
            C2()
        } else {
            C3()
        } 
    Assert.isTrue(v8 is C)

    var v9: C =
        if (x == 0) {
            C1()
        } else {
            C1()
        } 
    Assert.isTrue(v9 is C)

    var v10: C1 =
        if (x == 0) {
            C1()
        } else {
            C1()
        } 
    Assert.isTrue(v10 is C1)

    var v11: C =
        if (x == 0) {
            C2()
        } else {
            C2()
        } 
    Assert.isTrue(v11 is C)

    var v12: C1 =
        if (x == 0) {
            C2()
        } else {
            C2()
        } 
    Assert.isTrue(v12 is C1)

    var v13: C2 =
        if (x == 0) {
            C2()
        } else {
            C2()
        } 
    Assert.isTrue(v13 is C2)

    var v14: C =
        if (x == 0) {
            C2()
        } else if (x < 0) {
            C1() 
        } else {
            C()
        }
    Assert.isTrue(v14 is C)

    var v15: C =
        if (x == 0) {
            C()
        } else if (x < 0) {
            C1() 
        } else {
            C3()
        }
    Assert.isTrue(v15 is C)

    var v16: C =
        if (x == 0) {
            C()
        } else if (x < 0) {
            C2() 
        } else {
            C3()
        }
    Assert.isTrue(v16 is C)

    var v17: C =
        if (x == 0) {
            C2()
        } else if (x < 0) {
            C1() 
        } else {
            C3()
        }
    Assert.isTrue(v17 is C)

    var v18: C = 
        if (x == 0) {
            C()
        } else if (x == 1) {
            C1()
        } else if (x == 2) {
            C2()
        } else if (x == 3) {
            C3()
        } else {
            C()
        } 
    Assert.isTrue(v18 is C)
}

func checkCustomStruct() {
    var v1: S =
        if (x == 0) {
            S(1)
        } else {
            S(2)
        } 
    Assert.isTrue(v1 is S)

    var v2: S = 
        if (x == 0) {
            S(1)
        } else if (x == 1) {
            S(2)
        } else if (x == 2) {
            S(3)
        } else if (x == 3) {
            S(4)
        } else {
            S(5)
        } 
    Assert.isTrue(v2 is S)
}

main() {
    var v1: Int64 =
        if (x == 0) {
            1
        } else {
            2
        } 
    Assert.isTrue(v1 is Int64)

    var v2: Bool =
        if (x == 0) {
            true
        } else {
            false
        } 
    Assert.isTrue(v2 is Bool)

    var v3: Unit = 
        if (x != 0) {
            println("1")
        } else {
            println("2")
        } 
    Assert.isTrue(v3 is Unit)

     var v4: String = 
        if (x == 0) {
            "1"
        } else if (x == 1) {
            "2"
        } else if (x == 2) {
            "3"
        } else {
            "4"
        }
    Assert.isTrue(v4 is String)

    checkCustomClass()
    checkCustomStruct()
}
