/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a13_01

  @Level:         1

  @Assertion: 4.3(13) For if expressions without else branch, its type is Unit
              and its value is (). This is because if expr1{expr2} is the 
              syntactic sugar of if expr1 {expr2; ()} else {()}.
  @Description: Checks that the if expression without else branch is unit.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

var i = 0

func checkif() {
    var x1 = 
        if (i == 0) {
            println("Hello")
        }
    Assert.isTrue(x1 is Unit)

    var x2 = 
        if (i != 0) {
            println("Hello")
        }
    Assert.isTrue(x2 is Unit)

    var x3 = 
        if (i >= 3 && Assert.getRuntimeZero() == 0) {
            1
        }
    Assert.isTrue(x2 is Unit)

    var x4 = 
        if (i == 0 && Assert.getRuntimeZero() == 0) {
            1
        }
    Assert.isTrue(x4 is Unit)

    var x5 = 
        if (i == 0 && Assert.getRuntimeZero() == 0) {
            "Hello, Cangjie!"
        }
    Assert.isTrue(x5 is Unit)
}

func checkIfElseif() {
    var x1 = 
        if (i == 0) {
            println("Hello")
        } else if (i < 3) {
            println("Goodbye")
        }
    Assert.isTrue(x1 is Unit)

    var x2 = 
        if (i != 0) {
            println("Hello")
        } else if (i < 3) {
            println("Goodbye")
        }
    Assert.isTrue(x2 is Unit)

    var x3 = 
        if (i >= 3 && Assert.getRuntimeZero() == 0) {
            1
        } else if (true) {
            2
        }
    Assert.isTrue(x2 is Unit)

    var x4 = 
        if (i == 0 && Assert.getRuntimeZero() == 0) {
            1
        } else if (i != 5) {
            2
        }
    Assert.isTrue(x4 is Unit)

    var x5 = 
        if (i == 0 && Assert.getRuntimeZero() == 0) {
            "Hello, Cangjie!"
        } else if (false) {
            "Goodbye, Cangjie"
        }
    Assert.isTrue(x5 is Unit)
}

main() {
    checkif()
    checkIfElseif()
}
