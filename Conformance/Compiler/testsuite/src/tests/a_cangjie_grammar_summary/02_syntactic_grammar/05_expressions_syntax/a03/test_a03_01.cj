/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a03_01

  @Level:         1
  @Assertion:   A.2.5(3)
                atomicExpression
                    : literalConstant
                    | collectionLiteral
                    | tupleLiteral
                    | identifier (NL* typeArguments)?
                    | unitLiteral
                    | ifExpression
                    | matchExpression
                    | loopExpression
                    | tryExpression
                    | jumpExpression
                    | numericTypeConvExpr
                    | thisSuperExpression
                    | spawnExpression
                    | synchronizedExpression
                    | parenthesizedExpression
                    | lambdaExpression
                    | quoteExpression
                    | macroExpression
                    | unsafeExpression
                    ;


  @Description: Check various atomic expressions.
  @Mode:        run
  @Negative:    no
  @Structure: complex-main
  @Dependencies: aux_macros_01.cj
*/

import aux_macros_01.*
import std.sync.*
import std.ast.*

func a(s : String) { s + 'a' }

func b(s : String) { s + 'b' }

class C {
    var v = 442
    public func foo() {}
}

func jumpCheck(){
    //jumpExpression
    var result = false
    for (x in [1, 2, 3, 4]) {
        result = x != 2 || break
    }
}
// thisSuperExpression
open class A {
    open public func foo() {
        return 1
    }
}

open class B <: A {
    open public func foo() {
        return 2
    }

    open public func thisFoo() {
        // Case: this
        return this.foo()
    }

    open public func superFoo() {
        // Case: super
        return super.foo()
    }
}
// synchronizedExpression
func sync(m: Mutex) {
    var s: Unit = synchronized (m) {
        return
    }
}

main() {
    // literalConstant
    var a1 = 1123
    var a2 = 11.23
    var a3 = 1123_u16
    var a4 = "1123"
    var a5 = 'f'

    // collectionLiteral
    var a6 = [1,2,3,4,5]
    // tupleLiteral
    var a7 = (123, true, "Bingo")
    // identifier (NL* typeArguments)?
    var a8 = a1
    // unitLiteral
    var a9 = ()
    // ifExpression
    var a10 = if ({=> true}()) {
        10
    } else {
        -10
    }
    // matchExpression
    let e = 1
    var a11 = match ({=> e}()) {
        case 0 => "0"
        case 1 => "2"
        case 3 => "3"
        case _ => "fail"
    }
    // loopExpression
    var x = 1
    var mul = 1
    var a12 = do {
        mul *= x
        x++
    } while (x <= 4)
    // tryExpression
    var a13 = try {
        12
    } finally {
        {=> 0}()
    }
    // jumpExpression
    jumpCheck()
    // numericTypeConvExpr
    var a14 = Int16(123_i64)
    // spawnExpression
    let a15 = spawn {
        2
    }
    // parenthesizedExpression
    var a16 = (2 + 3)
    var a17 = (if ({=> true}()) {
        10
    } else {
        -10
    })
    // lambdaExpression
    var a18: (Int64) -> Int64 = {a: Int64 => a * 2 }
    // quoteExpression
    var a19 = quote(..)
    // macroExpression
    var a20 = @Identity(2 + 2)
    // unsafeExpression
    var a21 : Int32 = unsafe { var v : Int32 = 0x7FFFFFFF; v };

    return 0
}