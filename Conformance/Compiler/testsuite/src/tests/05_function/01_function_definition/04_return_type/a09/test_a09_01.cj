/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_01_04_a09_01

  @Level:         1

  @Assertion:       5.1.4(9) The rules for deriving the return type of a function are as follows: the function body is
                    a sequence of expressions and declarations;  we denote the type of the last item of the sequence 
                    as T0 (if the last item of the block is an expression, it is the type of the expression; if the 
                    last item is a declaration, then T0 = Unit). 
                    Then we find all the return e expressions in the function body (including the ones in all 
                    sub-expressions) and denote the type of e as T1 ... Tn. The return type of the function is the 
                    least common super type of T0, T1, ..., Tn. If the least common super type does not exist, a 
                    compilation error is reported.

  @Description:     Check that return type can be calculated if return expressions have common super type.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

type myType = Int64
extend myType {
    func add() {111}
}

open class A { } 
open class B <: A { }
class C <: A { }
class D <: B { }

func f(a: Int32) {
    if (a == 50) {
        return B()
    } 
    if (a == 75) {
        return C()
    } 
    if (a == 100) {
        return D()
    }
    return A() 
}

func funcMyType(): myType { 12 }
func funcInt64(): Int64 { 12 }

func funcNumber(a: String) {
    var defaultRet: Int64 = 12
    if(a == "myType") {
        funcMyType()
    }
    if(a == "Int64") {
        funcInt64()
    }
    defaultRet
}

func funcUnit() {
    var aaaa = "aaaa"
}

main() {
    Assert.isTrue(funcUnit() is Unit)
    Assert.isTrue(funcUnit is () -> Unit)

    Assert.isTrue(f(50) is B)
    Assert.isTrue(f(50) is A)
    Assert.isTrue(f(75) is C)
    Assert.isTrue(f(75) is A)
    Assert.isTrue(f(100) is D)
    Assert.isTrue(f(100) is B)
    Assert.isTrue(f(100) is A)
    Assert.isTrue(f(10) is A)
    Assert.isTrue(f is (Int32) -> A)

    Assert.isTrue(funcNumber("myType") is myType)
    Assert.isTrue(funcNumber("myType") is Int64)
    Assert.isTrue(funcNumber("Int64") is Int64)
    Assert.isTrue(funcNumber is (String) -> Int64)
}
