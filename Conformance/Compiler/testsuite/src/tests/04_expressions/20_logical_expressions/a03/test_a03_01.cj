
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_20_a03_01

  @Level:         1

  @Assertion:   4.20(3) There are three logical operators: logic NOT (!), logic AND (&&) and logic OR (||).
                See the last section for their precedence and associativity.
  @Description: Checks compilation and execution of a program that uses logical operators !, && and ||. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import std.random.Random

func toBool(x : UInt64) { x != 0 }

main() {
    let x = true
    let y = false

    let rnd = Random(123)

    for (_ in 0..2**10) {
        var x = rnd.nextUInt64()
        var y = rnd.nextUInt64()

        while (x != 0 || y != 0) {
            let bx = toBool(x & 1)
            let by = toBool(y & 1)
            println(bx || by)
            println(bx && by)
            println(!bx)
            println(!by)
            x >>= 1
            y >>= 1
        }
    }
}
