/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_04_a03_01

  @Level:         1

  @Assertion: 4.5.4(3) while or do-while expressions used when the loop keeps iterating until
              a condition is satisfied.
  @Description: Test example of while and do-while loops until condition satisfied
  @Mode: run
  @Negative: no
  @CompileWarning: ignore

*/

import utils.assert.Assert

type Predicate = (Int64) -> Bool

func iterations_until_success_using_while (a: Int64, f: Predicate) {
    var count = 1
    var i = a
    while ( !f(i) ) {
        count++
        i++
    }
    count
}

func iterations_until_success_using_do_while (a: Int64, f: Predicate) {
    var count = 1
    var i = a
    do {
        if (f(i)) {
            break
        }
        count++
        i++
    } while (true)
    count
}

main() {
    let f1 = { x: Int64 => true }
    Assert.equals(1, iterations_until_success_using_while(11, f1))
    Assert.equals(1, iterations_until_success_using_do_while(11, f1))

    let f2 = { x: Int64 => x % 17 == 0 }
    Assert.equals(7, iterations_until_success_using_while(11, f2))
    Assert.equals(7, iterations_until_success_using_do_while(11, f2))
}

