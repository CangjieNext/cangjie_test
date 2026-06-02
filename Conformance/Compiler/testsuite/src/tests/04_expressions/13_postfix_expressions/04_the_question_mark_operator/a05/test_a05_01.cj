/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a05_01

  @Level:         1

  @Assertion: 4.13.4(5) The syntax of an optional chaining is defined as the last rule of the syntax of
              the postfix expression
              above, where the syntax of questSeperatedItems is defined as follows:

              questSeperatedItems
                  : questSeperatedItem+
                  ;

              questSeperatedItem
                  : itemAfterQuest (callSuffix | callSuffix? trailingLambdaExpression | indexAccess)?
                  ;

              itemAfterQuest
                  : '.' identifier typeArguments?
                  | callSuffix
                  | indexAccess
                  | trailingLambdaExpression
                  ;

  @Description: Check optional chaining expressions usage patterns.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class GetTupleKey {}

class GetFuncKey {}

struct S {
    func foo() {
        return 42
    }

    func id<T>(t: T) {
        return t
    }

    operator func() () {
        return 7
    }

    operator func() (fn: () -> Unit) {
        return 8
    }

    operator func() (x: GetFuncKey) {
        return { => 9 }
    }

    operator func() (x: GetTupleKey) {
        return t
    }

    func getInvokableFromFun(fn: () -> Unit) {
        return { => 10 }
    }

    func getInvokableFromFunGeneric<T>(fn: () -> Unit) {
        return { => 11 }
    }

    func getTuple() {
        return t
    }

    func getTupleFromFun(fn: () -> Unit) {
        return t
    }

    var x: Int64 = 3
    var t: (Int64, Int64) = (4, 5)
}

struct S2 {
    var s: ?S = S()
}

main() {
    // NOTE: According to "5.3.3. Trailing lambda" trailing closure syntax can only be used on function calls with
    //       function/variable names. So, some invalid cases which are formally allowed by this syntax are ommited.

    var s: ?S = S()
    var s2: ?S2 = S2()

    // Case: Single quest separated item.
    let x1 = s?.x
    Assert.equals(3, x1.getOrThrow())

    // Case: Several quest separated items.
    let x2 = s2?.s?.x
    Assert.equals(3, x2.getOrThrow())


    //
    // Cases: questSeperatedItem = "itemAfterQuest"
    //

    // Case: itemAfterQuest = "'.' identifier"
    let x3 = s?.x
    Assert.equals(3, x3.getOrThrow())

    // Case: itemAfterQuest = "'.' identifier typeArguments"
    let f4 = s?.id<Int64>
    Assert.equals(4, f4.getOrThrow()(4))

    // Case: itemAfterQuest = "callSuffix"
    let x5 = s?()
    Assert.equals(7, x5.getOrThrow())

    // Case: itemAfterQuest = "indexAccess"
    let a6: ?Array<Int64> = [1, 2, 3]
    let x7 = a6?[1]
    Assert.equals(2, x7.getOrThrow())

    // Case: itemAfterQuest = "trailingLambdaExpression"
    let x8 = s?{}
    Assert.equals(8, x8.getOrThrow())


    //
    // Cases: questSeperatedItem = "itemAfterQuest callSuffix"
    //

    // Case: itemAfterQuest = "'.' identifier"
    let y1 = s?.foo()
    Assert.equals(42, y1.getOrThrow())

    // Case: itemAfterQuest = "'.' identifier typeArguments"
    let y2 = s?.id<Int64>(35)
    Assert.equals(35, y2.getOrThrow())

    // Case: itemAfterQuest = "callSuffix"
    let y3 = s?(GetFuncKey())()
    Assert.equals(9, y3.getOrThrow())

    // Case: itemAfterQuest = "indexAccess"
    let t4: ?(() -> Int64, () -> Int64) = ({ => 1240 }, { => 1242 })
    let y5 = t4?[0]()
    Assert.equals(1240, y5.getOrThrow())

    // Case: itemAfterQuest = "trailingLambdaExpression"
    let f6 = s?.getInvokableFromFun
    let y7 = f6?{}()
    Assert.equals(10, y7.getOrThrow())


    //
    // Cases: questSeperatedItem = "itemAfterQuest trailingLambdaExpression"
    //

    // Case: itemAfterQuest = "'.' identifier"
    let z1 = s?.getInvokableFromFun{}
    Assert.equals(10, z1.getOrThrow()())

    // Case: itemAfterQuest = "'.' identifier typeArguments"
    let z2 = s?.getInvokableFromFunGeneric<String>{}
    Assert.equals(11, z2.getOrThrow()())

    // Case: itemAfterQuest = "indexAccess"
    let zt4: ?((() -> Unit) -> Int64, (() -> Unit) -> Int64) = (
        { x => 100 },
        { x => 200 }
    )
    let z5 = zt4?[0]({=>})
    Assert.equals(100, z5.getOrThrow())


    //
    // Cases: questSeperatedItem = "itemAfterQuest callSuffix trailingLambdaExpression"
    //

    // Case: itemAfterQuest = "'.' identifier"
    let p1 = s?.getInvokableFromFun(){}
    Assert.equals(10, p1.getOrThrow()())

    // Case: itemAfterQuest = "'.' identifier typeArguments"
    let p2 = s?.getInvokableFromFunGeneric<String>(){}
    Assert.equals(11, p2.getOrThrow()())

    // Case: itemAfterQuest = "indexAccess"
    let pt4: ?((() -> Unit) -> Int64, (() -> Unit) -> Int64) = (
        { x => 100 },
        { x => 200 }
    )
    let p5 = pt4?[0]({=>})
    Assert.equals(100, p5.getOrThrow())


    //
    // Cases: questSeperatedItem = "itemAfterQuest indexAccess"
    //

    // Case: itemAfterQuest = "'.' identifier"
    let q1 = s?.t[0]
    Assert.equals(4, q1.getOrThrow())

    // Case: itemAfterQuest = "callSuffix"
    let q2 = s?(GetTupleKey())[0]
    Assert.equals(4, q2.getOrThrow())

    // Case: itemAfterQuest = "indexAccess"
    let it3: ?(Array<Int64>, Array<Int64>) = (
        [1, 2, 3, 4],
        [5, 6, 7, 8]
    )
    let q4 = it3?[0][2]
    Assert.equals(3, q4.getOrThrow())

    // Case: itemAfterQuest = "trailingLambdaExpression"
    let f5 = s?.getTupleFromFun
    let q5 = f5?{}[0]
    Assert.equals(4, q5.getOrThrow())
}

