
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_19_a04_01

  @Level:         1

  @Assertion:   4.19(4) There are two kinds of range operators: .. and ..=, which are used to create Range instances
                that are half-open and closed, respectively. See Range Type for more details.
  @Description: Checks execution of a program which uses range expressions of both types. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert
import std.random.Random

main() {
    let rnd = Random(123)

    for (_ in 0..1024) {
        var i : Int64
        do {
           i = rnd.nextInt64()
        } while (i >= Int64.Max - 256)
        var counter = 0
        let j = i + Int64(rnd.nextUInt8())
        for (_ in i..j) {
            counter++
        }
        Assert.equals(j - i, counter)
        for (_ in i..=j) {
            counter--
        }
        Assert.equals(-1, counter)
    }

}
