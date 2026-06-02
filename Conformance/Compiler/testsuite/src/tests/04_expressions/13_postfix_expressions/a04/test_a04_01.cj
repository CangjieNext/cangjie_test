/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_a04_01

  @Level:         1

  @Assertion: 4.13(4) The syntax of the postfix expression is defined as.

              postfixExpression
                  : atomicExpression
                  | type '.' identifier
                  | postfixExpression '.' identifier typeArguments?
                  | postfixExpression callSuffix
                  | postfixExpression indexAccess
                  | postfixExpression '.' identifier callSuffix? trailingLambdaExpression
                  | identifier callSuffix? trailingLambdaExpression
                  | postfixExpression ('?' questSeperatedItems)+
                  ;

  @Description: Check postfix expressions usage.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

struct S {
    S(var x!: Int64) {}

    func genFun<T>(t: T) {
        return t
    }

    func invoke(invokable: () -> Int64) {
        return invokable()
    }

    static func staticFun() {
        return 100
    }
}

func foo() {
    return 42
}

func makeS(x: Int64) {
    return S(x: x)
}

class C {
    init() {
        s = makeS(42)
    }

    var s :? S
}

main(inp: Array<String>) {
    let s = S(x: 42)
    let sFun = s.invoke
    let t = (42, 35)

    // NOTE: No need to check all atomic expressions, because it is a task for atomic expressions assertion coverage.
    //       Just check some examples.

    // Atomic expression. Literal constant.
    let x: Int64 = 3
    Assert.equals(3, x)

    // Atomic expression. Tuple literal.
    let tup = (42, 35)
    Assert.isTrue(tup == (42, 35))

    // Atomic expression. Identifier.
    let y = x
    Assert.equals(3, y)

    // Atomic expression. Parenthesized if expression.
    let z = (if (Assert.getRuntimeZero(inp) + x < 5) { 2 } else { 7 })
    Assert.equals(2, z)

    // type '.' identifier.
    let p = S.staticFun
    Assert.equals(100, p())

    // postfixExpression '.' identifer typeArguments?
    //
    // Case: no type arguments.
    let q = makeS(53).x
    Assert.equals(53, q)

    // postfixExpression '.' identifer typeArguments?
    //
    // Case: type arguments present.
    let r = s.genFun<String>
    Assert.isTrue(r is (String) -> String)

    // postfixExpression callSuffix
    //
    // NOTE: identifier is an atomic expression which is a postfix expression.
    let u = r("hello")
    Assert.equals("hello", u)

    // postfixExpression indexAccess
    let v = t[0]
    Assert.equals(42, v)

    // postfixExpression '.' identifier callSuffix? trailingLambdaExpression
    //
    // Case: no call suffix
    let i = makeS(42).invoke { => 13 }
    Assert.equals(13, i)

    // postfixExpression '.' identifier callSuffix? trailingLambdaExpression
    //
    // Case: call suffix present
    let m = makeS(42).invoke() { => 23 }
    Assert.equals(23, m)

    // identifier callSuffix? trailingLambdaExpression
    //
    // Case: no call suffix
    let j = sFun { => 14 }
    Assert.equals(14, j)

    // identifier callSuffix? trailingLambdaExpression
    //
    // Case: call suffix present
    let n = sFun() { => 24 }
    Assert.equals(24, n)

    // postfixExpression ('?' questSeperatedItems)+
    //
    // Case: single question mark separated item.
    let optionS : ?S = makeS(15)
    let k = optionS?.x
    Assert.equals(15, k.getOrThrow())

    // postfixExpression ('?' questSeperatedItems)+
    //
    // Case: two question mark separated items.
    let optionC : ?C = C()
    let l = optionC?.s?.x
    Assert.equals(42, l.getOrThrow())
}

