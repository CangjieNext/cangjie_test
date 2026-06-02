/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a21_01

  @Level:         1
  @Assertion:   A.2.5(21) 
                expressionOrDeclarations
                    : end* (expressionOrDeclaration (end+ expressionOrDeclaration?)*)?
                    ;
                expressionOrDeclaration
                    : expression
                    | varOrfuncDeclaration
                    ;
                varOrfuncDeclaration
                    : functionDefinition
                    | variableDeclaration
                    ;


  @Description: Check some expressionOrDeclarations expressions.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

main() {
    //empty expressionOrDeclarations

    //expressionOrDeclarations is varOrfuncDeclaration
    let l0: (Int8, Int8) -> Int8 = {a: Int8, b: Int8 => a + b }
    var v0: Float32 = 4.6
    func a() { 123 }
    var v1 = 1

    //expressionOrDeclarations is expression
    let unused = 2 + 2
    v1++
    if ({=> v0 is Float32}()) {
        v1--
    } else {
        v1++
    }
    //expressionOrDeclarations is a combination of varOrfuncDeclaration and expression
    var arr = [1.0, 2.0, 3.0, 4.0]
    a()
    var big = 1000.0
    for (x in arr) {
        big /= x
    }
    var f1 = {a: Int8, b: Int8 => a + b }(1, 2)

    return 0
}
