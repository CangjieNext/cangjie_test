/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_01_a02_01

  @Level:         1

  @Assertion:   4.17.1(2) When the runtime type R of e is a subtype of T, the value of e is T is true, otherwise the
                value is false.
  @Description: Check that when the runtime type R of e is a subtype of T, the value of e is T is true, otherwise the
                value is false for various types.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

interface I {}
interface J <: I {}
interface K <: J {}
interface L <: I {}

open class A <: J {}
open class B <: A {}
class C <: B {}
class D <: A {}

class CI <: I { }
func i() : I { CI() }
class CJ <: J { }
func j() : J { CJ() }
class CK <: K { }
func k() : K { CK() }
class CL <: L { }
func l() : L { CL() }

func f(a : A) : A {
  return a
}

func simpleFunction() {}

func getTuple(i: Int64, j: Int64) {
    (i, j)
}

var res = 0
var counter = 0
var expected = 1

func checkTypeInner(b : Bool) {
    if (b) {
      res += 1 << counter
    }
    counter++
}

func checkType<T>(t : T) {
    counter = 0
    res = 0

    // If 𝑇 1 ≡ 𝑇 2
    checkTypeInner(t is Int8)
    checkTypeInner(t is Int16)
    checkTypeInner(t is Int32)
    checkTypeInner(t is Int64)
    checkTypeInner(t is UInt8)
    checkTypeInner(t is UInt16)
    checkTypeInner(t is UInt32)
    checkTypeInner(t is UInt64)
    checkTypeInner(t is Float16)
    checkTypeInner(t is Float32)
    checkTypeInner(t is Float64)
    checkTypeInner(t is Bool)
    checkTypeInner(t is Rune)
    checkTypeInner(t is String)
    checkTypeInner(t is Array<String>)
    checkTypeInner(t is C)
    checkTypeInner(t is D)
    checkTypeInner(t is (Int64, Int64))
    checkTypeInner(t is (Int64, String))
    checkTypeInner(t is Unit)
    checkTypeInner(t is () -> Unit)
    checkTypeInner(t is (Int64, Int64) -> (Int64, Int64))
    // T1 is Nothing type
    do { Assert.isTrue(break is T) } while (false)
    // T1 is any class/interface type, and T2 is the Object type
    Assert.equals(t is C || t is D, t is Object)

    Assert.equals(expected, res)
    expected <<= 1
}

main() {
    checkType(1i8)
    checkType(1i16)
    checkType(1i32)
    checkType(1i64)
    checkType(1u8)
    checkType(1u16)
    checkType(1u32)
    checkType(1u64)
    checkType(1.0f16)
    checkType(1.0f32)
    checkType(1.0f64)
    checkType(true)
    checkType(r'1')
    checkType("1")
    checkType(["1"])
    checkType(C())
    checkType(D())
    checkType(getTuple(1, 1))
    checkType((1, "1"))
    checkType(simpleFunction())
    checkType(simpleFunction)
    checkType(getTuple)
    // T1 and T2 are Tuple types,
    // and the type of each element in T1 is the subtype of the type of the corresponding element in T2.
    let tuple = (A(), B(), C())
    Assert.isTrue(tuple is (A, A, A))
    Assert.isTrue(tuple is (A, A, B))
    Assert.isFalse(tuple is (D, B, C))
    // T1 and T2 are Function types, and the parameter type of T2 is the subtype of the parameter type of T1
    // and the return type of T1 is the subtype of the return type of T2 
    let fn = { a : A, b : B => (A(), C()) }
    Assert.isFalse(fn is (A, A) -> (A, A))
    Assert.isFalse(fn is (A, A) -> (A, B))
    Assert.isTrue(fn is (A, C) -> (A, A))
    Assert.isTrue(fn is (A, C) -> (A, B))
    Assert.isTrue(fn is (A, B) -> (A, A))
    Assert.isTrue(fn is (A, B) -> (A, B))

    Assert.isTrue(fn is (D, B) -> (A, C))
    Assert.isFalse(fn is (A, D) -> (A, C))
    Assert.isFalse(fn is (A, B) -> (D, C))
    Assert.isFalse(fn is (A, B) -> (A, D))
    // T1 is any class/interface type, and T2 is the Object type
    Assert.isTrue(i() is Object)
    Assert.isTrue(j() is Object)
    // There exists a type 𝑇 𝑘 which satisfies that 𝑇 1 <∶ 𝑇 𝑘 and 𝑇 𝑘 <∶ 𝑇 2 (transitive property).
    // (included in the rest of Assert checks; for classes and interfaces)

    // T1 and T2 are interface types, and T1 inherits T2.
    Assert.isTrue(i() is I)
    Assert.isTrue(j() is I)
    Assert.isTrue(k() is I)
    Assert.isTrue(l() is I)

    Assert.isFalse(i() is J)
    Assert.isTrue(j() is J)
    Assert.isTrue(k() is J)
    Assert.isFalse(l() is J)

    Assert.isFalse(i() is K)
    Assert.isFalse(j() is K)
    Assert.isTrue(k() is K)
    Assert.isFalse(l() is K)

    Assert.isFalse(i() is L)
    Assert.isFalse(j() is L)
    Assert.isFalse(k() is L)
    Assert.isTrue(l() is L)
    // T1 and T2 are class types, and T1 inherits T2.
    Assert.isTrue(A() is A)
    Assert.isTrue(B() is A)
    Assert.isTrue(C() is A)
    Assert.isTrue(D() is A)

    Assert.isFalse(A() is B)
    Assert.isTrue(B() is B)
    Assert.isTrue(C() is B)
    Assert.isFalse(D() is B)

    Assert.isFalse(A() is C)
    Assert.isFalse(B() is C)
    Assert.isTrue(C() is C)
    Assert.isFalse(D() is C)

    Assert.isFalse(A() is D)
    Assert.isFalse(B() is D)
    Assert.isFalse(C() is D)
    Assert.isTrue(D() is D)

    Assert.isTrue(f(A()) is A)
    Assert.isTrue(f(B()) is A)
    Assert.isTrue(f(C()) is A)
    Assert.isTrue(f(D()) is A)

    Assert.isFalse(f(A()) is B)
    Assert.isTrue(f(B()) is B)
    Assert.isTrue(f(C()) is B)
    Assert.isFalse(f(D()) is B)

    Assert.isFalse(f(A()) is C)
    Assert.isFalse(f(B()) is C)
    Assert.isTrue(f(C()) is C)
    Assert.isFalse(f(D()) is C)

    Assert.isFalse(f(A()) is D)
    Assert.isFalse(f(B()) is D)
    Assert.isFalse(f(C()) is D)
    Assert.isTrue(f(D()) is D)
    // T1 is a class type and T2 is an interface type, and T1 implements T2.
    Assert.isTrue(CI() is I)
    Assert.isTrue(CJ() is I)
    Assert.isTrue(CK() is I)
    Assert.isTrue(CL() is I)

    Assert.isFalse(CI() is J)
    Assert.isTrue(CJ() is J)
    Assert.isTrue(CK() is J)
    Assert.isFalse(CL() is J)

    Assert.isFalse(CI() is K)
    Assert.isFalse(CJ() is K)
    Assert.isTrue(CK() is K)
    Assert.isFalse(CL() is K)

    Assert.isFalse(CI() is L)
    Assert.isFalse(CJ() is L)
    Assert.isFalse(CK() is L)
    Assert.isTrue(CL() is L)

    Assert.isTrue(A() is I)
    Assert.isTrue(B() is I)
    Assert.isTrue(C() is I)
    Assert.isTrue(D() is I)
    Assert.isTrue(f(A()) is I)
    Assert.isTrue(f(B()) is I)
    Assert.isTrue(f(C()) is I)
    Assert.isTrue(f(D()) is I)

    Assert.isTrue(A() is J)
    Assert.isTrue(B() is J)
    Assert.isTrue(C() is J)
    Assert.isTrue(D() is J)
    Assert.isTrue(f(A()) is J)
    Assert.isTrue(f(B()) is J)
    Assert.isTrue(f(C()) is J)
    Assert.isTrue(f(D()) is J)

    Assert.isFalse(A() is K)
    Assert.isFalse(B() is K)
    Assert.isFalse(C() is K)
    Assert.isFalse(D() is K)
    Assert.isFalse(f(A()) is K)
    Assert.isFalse(f(B()) is K)
    Assert.isFalse(f(C()) is K)
    Assert.isFalse(f(D()) is K)

    Assert.isFalse(A() is L)
    Assert.isFalse(B() is L)
    Assert.isFalse(C() is L)
    Assert.isFalse(D() is L)
    Assert.isFalse(f(A()) is L)
    Assert.isFalse(f(B()) is L)
    Assert.isFalse(f(C()) is L)
    Assert.isFalse(f(D()) is L)

  0
}
