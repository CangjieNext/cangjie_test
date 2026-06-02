/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_04_a05_01

  @Level:         1

  @Assertion: 4.5.4(5) Since the break and continue expressions require their enclosing loop bodies,
              therefore the break and continue expressions, if appeared in any of the three loop
              expressions, are bound to the nearest outer loop;
  @Description: Check that 'break' terminates execution of nearest loop for all kinds of loops
  @Mode: run
  @Negative: no
  @Issue: 6473

*/

import utils.assert.Assert

func test_for () {
    var sum = 0
    for (x in 1..=4) {
        for (y in 1..10000) {
            sum += y
            if (y == 2) {
                // only sums 1 and 2
                break
            }
        }
    }
    Assert.equals(12, sum) // four times 3
}

func test_while () {
    var sum = 0
    var x = 1
    while (x <= 4) {
        var y = 1
        while (y <= 10000) {
            sum += y
            if (y == 2) {
                break
            }
            y++
        }
        x++
    }
    Assert.equals(12, sum)
}

func test_while_let () {
    var sum = 0
    var x = Some<Int64>(1)
    while (let Some(u) <- x)  {
        var y = Some<Int64>(1)
        while (let Some(v) <- y) {
            sum += v
            if (v == 2) {
                break
            }
            y = Some<Int64>(v + 1)
        }
        if (u <= 3) {
            x = Some<Int64>(u + 1)
        } else {
            x = None<Int64>
        }
    }
    Assert.equals(12, sum)
}

func test_do_while () {
    var sum = 0
    var x = 1
    do {
        var y = 1
         do {
            sum += y
            if (y == 2) {
                break
            }
            y++
        } while (y <= 10000)
        x++
    } while (x <= 4)
    Assert.equals(12, sum)
}

main() {
    test_for()
    test_while()
    test_while_let()
    test_do_while()
}
