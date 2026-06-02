/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:       04_03_a02_01

  @Level:         1

  @Assertion:  4.3(2)
               The syntax of the if expression is defined as follows.
    ifExpression
        : 'if' '(' ('let' deconstructPattern '<-')? expression ')' block ('else' ( ifExpression | block))?
    ;
  @Description: Validates some examples illustrating the syntax definition above.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore
  @Issue: 0006363

*/

import utils.assert.Assert

var i = 15
var r = Assert.getRuntimeZero()

enum Digits {
    One |
    Two |
    Three 
}

enum TimeUnit {
    | Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

func checkif() {
    if (i == 0) {}

    if (2 != 0) {
        i++
    }

    if (r > 14 && i < 1 || r == i) {
        i ++
    }

    if (r is Int64) {
        i++
    }

    if (true) {
        i++
    }

    if (false) {
        i++
    }

    if (let k <- "123") {
        i++
    }

    if (let _ <- "123") {
        i++
    }

    if (let (1, 2) <- (r, 4)) {
        i++
    }

    if (let 0 <- 0) {
        i++
    } 

    if (let Digits.One <- Digits.Two) {
        i++
    }
}

func checkIfElse() {
    if (i == 0) {} else {}

    if (2 != 0) {
        i++
    } else {
        r--
    }

    if (r > 14 && i < 1 || r == i) {
        i ++
    } else {
        r--
    }

    if (r is Int64) {
        i++
    } else {
        r--
    }

    if (true) {
        i++
    } else {
        r--
    }

    if (false) {
        i++
    } else {
        r--
    }

    if (let k <- "123") {
        i++
    } else {
        r--
    }

    if (let _ <- "123") {
        i++
    } else {
        r--
    }

    if (let (1, 2) <- (r, 4)) {
        i++
    } else {
        r--
    }

    if (let 0 <- 0) {
        i++
    } else {
        r--
    } 

    if (let Digits.One <- Digits.Two) {
        i++
    } else {
        r--
    }
}

func checkIfElseif() {
    if (i == 0) {
    } else if (i < 0) {
    }

    if (2 != 0) {
        i++
    } else if (r > 14 && i < 1 || r == i) {
        r--
    }

    if (r > 14 && i < 1 || r == i) {
        i ++
    } else if (r is Int64)  {
        r--
    }

    if (r is Int64) {
        i++
    } else if (false) {
        r--
    }

    if (true) {
        i++
    } else if (false) {
        r--
    }

    if (false) {
        i++
    } else if (let k <- "123") {
        r--
    }

    if (let k <- "123") {
        i++
    } else if (let _ <- "123") {
        r--
    }

    if (let _ <- "123") {
        i++
    } else if (let (1, 2) <- (r, 4)) {
        r--
    }

    if (let (1, 2) <- (r, 4)) {
        i++
    } else if (let 1 <- 1) {
        r--
    }

    if (let 0 <- 0) {
        i++
    } else if (let Digits.Three <- Digits.Three) {
        r--
    } 

    if (let Digits.One <- Digits.Two) {
        i++
    } else if (r == 0) {
        r--
    }
}

func checkIfElseIfElse() {
    if (i == 0) {
    } else if (i < 0) {
    } else {
    }

    if (2 != 0) {
        i++
    } else if (r > 14 && i < 1 || r == i) {
        r--
    } else {
        i--
    }

    if (r > 14 && i < 1 || r == i) {
        i ++
    } else if (r is Int64)  {
        r--
    } else {
        i--
    }

    if (r is Int64) {
        i++
    } else if (false) {
        r--
    } else {
        i--        
    }

    if (true) {
        i++
    } else if (false) {
        r--
    } else {
        r++
    }

    if (false) {
        i++
    } else if (let k <- "123") {
        r--
    } else {
        i--
    }

    if (let k <- "123") {
        i++
    } else if (let _ <- "123") {
        r--
    } else {
        r++
    }

    if (let _ <- "123") {
        i++
    } else if (let (1, 2) <- (r, 4)) {
        r--
    } else {
        r++
    }

    if (let (1, 2) <- (r, 4)) {
        i++
    } else if (let 1 <- 1) {
        r--
    } else {
        i--
    }

    if (let 0 <- 0) {
        i++
    } else if (let Digits.Three <- Digits.Three) {
        r--
    } else {
        r++
    }

    if (let Digits.One <- Digits.Two) {
        i++
    } else if (r == 0) {
        r--
    } else {
        r++
    }
}

main() {
    checkif()
    checkIfElse()
    checkIfElseif()
}
