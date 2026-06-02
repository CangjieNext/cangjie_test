/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a13_02

  @Level:         1

  @Assertion: 4.3(13) For if expressions without else branch, its type is Unit
              and its value is (). This is because if expr1{expr2} is the 
              syntactic sugar of if expr1 {expr2; ()} else {()}.
  @Description: Checks that `if expr1{expr2}` produces the same result as
                `if expr1 {expr2; ()} else {()}`
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

var res = false

func returnBool(b: Bool) {
    b
}

func checkIfBlock() {
    res = true
}

main() {   
    res = false
    if (returnBool(true)) {
        checkIfBlock()
    }
    Assert.isTrue(res)


    res = false
    if (returnBool(true)) {
        checkIfBlock()
        ()
    } else {
        ()
    }
    Assert.isTrue(res)

    res = false
    if (returnBool(false)) {
        checkIfBlock()
    }
    Assert.isFalse(res)

    if (returnBool(false)) {
        checkIfBlock()
        ()
    } else {
        ()
    }
    Assert.isFalse(res)
}