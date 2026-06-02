
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a09_01

  @Level:         1

  @Assertion:   4.23(9) The leftAuxExpression can be one of the following forms: 1. An identifier followed by an
                optional type argument list (i.e., typeArguments); 2. this or super; 3. A leftAuxExpression followed
                by a . (before which there may be an optional ? operator) and an identifier with an optional type
                argument list; 4. A leftAuxExpression followed by a function call suﬀix callSuffix or an index access
                suﬀix indexAccess (callSuffix or indexAccess may be preceded by an optional ? operator).
  @Description: Program that contains assignments to values having listed types of leftAuxExpression.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

class A {
    var c = C()
    var o = Some(C())
} 

func foo() { C() }

open class C {
    var x = 0
    var a = [1, 2, 3]
    var aq = Some([1, 2, 3])
    var fq = Some(foo)
    func f<T>() { this }

    func getX() { x }
}

class D <: C {
    func g() {
        // this or super
        this.x <<= 1
        super.x >>= 2
    }
}

func f<T>() { C() }

main() {
    // An identifier
    var c = C()
    var a = A()
    c.x += 1

    // An identifier followed by an optional type argument list
    f<String>().x -= 2

    // A leftAuxExpression followed by . and an identifier
    a.c.x *= 3

    // A leftAuxExpression followed by . (before which there may be an optional ? operator)
    a.o?.x |= 1

    // A leftAuxExpression followed by . and an identifier with an optional type argument list
    a.c.f<Rune>().x %= 4

    // A leftAuxExpression followed by a function call suﬀix callSuffix
    c.f<Nothing>().x = 5

    // A leftAuxExpression followed by an index access indexAccess
    c.a[0] ^= 3

    // callSuffix or indexAccess may be preceded by an optional ? operator
    c.fq?().x &= 6
    c.aq?[1] = 5
}