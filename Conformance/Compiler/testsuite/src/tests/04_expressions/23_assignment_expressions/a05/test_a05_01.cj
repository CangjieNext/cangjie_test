/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_23_a05_01

  @Level:         1

  @Assertion: 4.23(5)
              Assignment operators are divided into ordinary and compound assignment operators, and the syntax of an
              assignment expression is defined as follows.

              assignmentExpression
                  : leftValueExpressionWithoutWildCard assignmentOperator flowExpression
                  | leftValueExpression '=' flowExpression
                  | tupleLeftValueExpression `=` flowExpression
                  | flowExpression
                  ;

              tupleLeftValueExpression
                  : `(` (leftValueExpression | tupleLeftValueExpression)
                        (`,` (leftValueExpression | tupleLeftValueExpression))+ `,`?
                     `)`
                  ;

              leftValueExpression
                  : leftValueExpressionWithoutWildCard
                  | '_'
                  ;

              leftValueExpressionWithoutWildCard
                  : identifier
                  | leftAuxExpression '?'? assignableSuffix
                  ;

              leftAuxExpression
                  : identifier typeArguments?
                  | type
                  | thisSuperExpression
                  | leftAuxExpression ('?')? '.' identifier typeArguments?
                  | leftAuxExpression ('?')? callSuffix
                  | leftAuxExpression ('?')? indexAccess
                  ;

              assignableSuffix
                  : fieldAccess
                  | indexAccess
                  ;

              fieldAccess
                  : '.' identifier
                  ;

              assignmentOperator
                  : '='
                  | '+='
                  | '-='
                  | '**='
                  | '*='
                  | '/='
                  | '%='
                  | '&&='
                  | '||='
                  | '&='
                  | '|='
                  | '^='
                  | '<<='
                  | '>>='
                  ;

  @Description: Check assignment expression syntax examples.

  @Mode: run

  @Negative: no

  @CompileWarning: Ignore

  @Issue: 0006488, 0006489
*/

func sqr(x: Int64) {
    x * x
}

func add5(x: Int64) {
    x + 5
}

class A {
    var x: Int64 = 0
}

open class C {
    static var s: Int64 = 0

    var x: Int64 = 0
    var a: A = A()

    operator func()() {
        return a
    }
}

class D <: C {
    func foo() {
        // Rule: leftAuxExpression = thisSuperExpression
        // Case: leftAuxExpression = this
        this.z = 3

        // Rule: leftAuxExpression = thisSuperExpression
        // Case: leftAuxExpression = super
        super.x = 3
    }

    var z: Int64 = 0
}

main() {
    var x = 0
    var y = 0
    var b = true
    var c = C()
    var oc: ?C = C()
    var arr = [1, 2, 3, 4, 5]
    var oarr = Option<Array<Int64>>.None

    // Rule: assignmentExpression
    // Case: assignmentExpression = leftValueExpressionWithoutWildCard assignmentOperator flowExpression
    var f1 = add5 ~> sqr
    x = 3
    x = 3 |> sqr
    x = sqr(3)
    x = 3 + 4
    x = 3 * 4
    x = 3 - 4
    x = 3 / 4
    x = 3 % 4
    x = 3 | 4
    x = 3 & 4
    x = 3 ^ 4
    x = -3
    x = !3
    x = 3 << 4
    x = 3 >> 4
    b = false
    b = true || false
    b = true && false
    b = !true

    // Rule: assignmentExpression
    // Case: assignmentExpression = leftValueExpression = flowExpression
    x = 3 |> sqr
    c.x = 3 + 4 |> add5
    oc?.x = 5 |> sqr

    // Rule: assignmentExpression
    // Case: assignmentExpression = tupleLeftValueExpression `=` flowExpression
    (x, c.x) = (3, 4)
    (x, b) = (5, true)

    // Rule: assignmentExpression
    // Case: assignmentExpression = flowExpression
    3 |> sqr;

    // Rule: tupleLeftValueExpression =
    //           `(` (leftValueExpression | tupleLeftValueExpression)
    //               (`,` (leftValueExpression | tupleLeftValueExpression))+ `,`?
    //           `)`
    // Case: tupleLeftValueExpression = `(` leftValueExpression `,` leftValueExpression `)`
    (x, b) = (3, true)

    // Rule: tupleLeftValueExpression =
    //           `(` (leftValueExpression | tupleLeftValueExpression)
    //               (`,` (leftValueExpression | tupleLeftValueExpression))+ `,`?
    //           `)`
    // Case: tupleLeftValueExpression = `(` leftValueExpression `,` tupleLeftValueExpression `)`
    (x, (b, c)) = (3, (true, C()))

    // Rule: tupleLeftValueExpression =
    //           `(` (leftValueExpression | tupleLeftValueExpression)
    //               (`,` (leftValueExpression | tupleLeftValueExpression))+ `,`?
    //           `)`
    // Case: tupleLeftValueExpression = `(` tupleLeftValueExpression `,` leftValueExpression `)`
    ((x, c), b) = ((3, C()), true)

    // Rule: tupleLeftValueExpression =
    //           `(` (leftValueExpression | tupleLeftValueExpression)
    //               (`,` (leftValueExpression | tupleLeftValueExpression))+ `,`?
    //           `)`
    // Case: tupleLeftValueExpression = `(` tupleLeftValueExpression `,` tupleLeftValueExpression `)`
    ((x, c), (y, b)) = ((3, C()), (4, true))

    // Rule: leftValueExpression
    // Case: leftValueExpression = leftValueExpressionWithoutWildCard
    x = 3
    (x, b) = (4, true)

    // Rule: leftValueExpression
    // Case: leftValueExpression = '_'
    _ = 3
    (_, b) = (4, true)

    // Rule: leftValueExpressionWithoutWildCard
    // Case: leftValueExpressionWithoutWildCard = identifier
    x = 3

    // Rule: leftValueExpressionWithoutWildCard = leftAuxExpression '?'? assignableSuffix
    // Case: leftValueExpressionWithoutWildCard = leftAuxExpression assignableSuffix
    arr[2] = 3
    c.x = 4

    // Rule: leftValueExpressionWithoutWildCard = leftAuxExpression '?'? assignableSuffix
    // Case: leftValueExpressionWithoutWildCard = leftAuxExpression '?' assignableSuffix
    oarr?[2] = 3
    oc?.x = 4

    // Rule: leftAuxExpression = identifier typeArguments?
    // Case: leftAuxExpression = identifier typeArguments?
    c.x = 3

    // Rule: leftAuxExpression = type
    // Case: leftAuxExpression = type
    C.s = 3

    // Rule: leftAuxExpression = leftAuxExpression ('?')? '.' identifier typeArguments?
    // Case: leftAuxExpression = leftAuxExpression '.' identifier
    c.x = 3

    // Rule: leftAuxExpression = leftAuxExpression ('?')? '.' identifier typeArguments?
    // Case: leftAuxExpression = leftAuxExpression '?' '.' identifier
    oc?.x = 3

    // Rule: leftAuxExpression = leftAuxExpression ('?')? callSuffix
    // Case: leftAuxExpression = leftAuxExpression callSuffix
    c().x = 42

    // Rule: leftAuxExpression = leftAuxExpression ('?')? callSuffix
    // Case: leftAuxExpression = leftAuxExpression ? callSuffix
    oc?().x = 35

    // Rule: leftAuxExpression = leftAuxExpression ('?')? indexAccess
    // Case: leftAuxExpression = leftAuxExpression indexAccess
    arr[1] = 2

    // Rule: leftAuxExpression = leftAuxExpression ('?')? indexAccess
    // Case: leftAuxExpression = leftAuxExpression ? indexAccess
    oarr?[1] = 2

    // Rule: assignableSuffix = fieldAccess
    // Case: assignableSuffix = fieldAccess
    c.x = 3

    // Rule: assignableSuffix = indexAccess
    // Case: assignableSuffix = indexAccess
    arr[1] = 2

    // Rule: fieldAccess = '.' identifier
    // Case: fieldAccess = '.' identifier
    c.x = 4

    // Rule: assignmentOperator
    // Case: assignmentOperator = '='
    c.x = 5

    // Rule: assignmentOperator
    // Case: assignmentOperator = '+='
    x += 5

    // Rule: assignmentOperator
    // Case: assignmentOperator = '-='
    x -= 5

    // Rule: assignmentOperator
    // Case: assignmentOperator = '**='
    x **= 5

    // Rule: assignmentOperator
    // Case: assignmentOperator = '*='
    x *= 2

    // Rule: assignmentOperator
    // Case: assignmentOperator = '/='
    x /= 2

    // Rule: assignmentOperator
    // Case: assignmentOperator = '%='
    x %= 10

    // Rule: assignmentOperator
    // Case: assignmentOperator = '&&='
    b &&= true

    // Rule: assignmentOperator
    // Case: assignmentOperator = '||='
    b ||= true

    // Rule: assignmentOperator
    // Case: assignmentOperator = '&='
    x &= 1

    // Rule: assignmentOperator
    // Case: assignmentOperator = '|='
    x |= 1

    // Rule: assignmentOperator
    // Case: assignmentOperator = '^='
    x ^= 1

    // Rule: assignmentOperator
    // Case: assignmentOperator = '<<='
    x <<= 1

    // Rule: assignmentOperator
    // Case: assignmentOperator = '>>='
    x >>= 1
}

