/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a15_01

  @Level:         1

  @Assertion: 4.3(15) When the context does not require some specific type, if
              the two branch types of ifexpression are T1 and T2, then the type
              of the if expression is the least common supertype T of T1 and T2.
              If the least common super type does not exist, a compilation 
              error is reported.
  @Description: Checks that when the context does not require some specific 
              type, if the two branch types of ifexpression are T1 and T2, 
              then the type of the `if` expression is the least common 
              supertype T of T1 and T2.
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
    var v1 =
        if (x == 0) {
            C()
        } else {
            C()
        } 
    Assert.isTrue(v1 is C)

    var v2 =
        if (x == 1) {
            C()
        } else {
            C1()
        } 
    Assert.isTrue(v2 is C)

    var v3 =
        if (x == 0) {
            C()
        } else {
            C2()
        } 
    Assert.isTrue(v3 is C)

    var v4 =
        if (x == 0) {
            C3()
        } else {
            C()
        } 
    Assert.isTrue(v4 is C)

    var v5 =
        if (x == 0) {
            C2()
        } else {
            C1()
        } 
    Assert.isTrue(v5 is C1)

    var v6 =
        if (x == 0) {
            C1()
        } else {
            C3()
        } 
    Assert.isTrue(v6 is C)

    var v7 =
        if (x == 0) {
            C2()
        } else {
            C3()
        } 
    Assert.isTrue(v7 is C)

    var v8 = 
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
    Assert.isTrue(v8 is C)

}

func checkCustomStruct() {
    var v1 =
        if (x == 0) {
            S(1)
        } else {
            S(2)
        } 
    Assert.isTrue(v1 is S)

    var v2 = 
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
    var v1 =
        if (x == 0) {
            1
        } else {
            2
        } 
    Assert.isTrue(v1 is Int64)

    var v2 =
        if (x == 0) {
            "Hello"
        } else {
            "Goodby"
        } 
    Assert.isTrue(v2 is String)

    var v3 = 
        if (x != 0) {
            println("1")
        } else {
            println("2")
        } 
    Assert.isTrue(v3 is Unit)

     var v4= 
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