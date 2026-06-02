/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_02_a01_02

  @Level:         1

  @Assertion: 4.13.2(1) The syntax of a function invocation expression is defined as the rule 4
              of the syntax of the postfix
              expression above, where the syntax of callSuffix and valueArgument is defined as.

              callSuffix
                  : '(' (valueArgument (',' valueArgument)*)? ')'
                  ;

              valueArgument
                  : identifier ':' expression
                  | expression
                  | refTransferExpression
                  ;

              refTransferExpression
                  : 'inout' (expression '.')? identifier
                  ;

  @Description: Check usage of reference transfer expression.

  @Mode: compileonly

  @Negative: no

  @Issue: 0006353
*/

// NOTE: Rule 4: "postfixExpression callSuffix"

@C
func foo(ptr: CPointer<Int32>): Unit {
    let _ = ptr
}

struct S {
    var x: Int32 = 0
}

main() {
    var n: Int32 = 0
    var s = S()

    unsafe {
        // Case: valueArgument = "refTransferExpression"
        //       No 'expression' in reference transfer expression.
        // Pass by reference.
        foo(inout n)

        // Case: valueArgument = "refTransferExpression"
        //       Expression present in reference transfer expression.
        // Pass by reference.
        foo(inout s.x)
    }
    return Int64(n + s.x)
}

