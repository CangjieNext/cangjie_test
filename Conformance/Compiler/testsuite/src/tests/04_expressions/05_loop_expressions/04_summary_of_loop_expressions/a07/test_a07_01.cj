/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_04_a07_01

  @Level:         1

  @Assertion: 4.5.4(7)
  @Description: Check example code
  @Mode: run
  @Negative: no
  @CompileWarning: ignore

*/

import utils.assert.Assert

var log = 0 // --added

main() {
    while (true) {
        println("outer") // printed once
        log += 10        // --added
        do {
             println("inner") // printed once
             log += 100       // --added
        } while (break) // stop the execution of the outer loop
        println("unreached") // not printed
        log += 1000          // --added
    }

    Assert.equals(110, log)
}
