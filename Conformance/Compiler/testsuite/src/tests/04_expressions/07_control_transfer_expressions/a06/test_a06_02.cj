
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_a06_02

  @Level:         1

  @Assertion:   4.7(6) As for the control transfer expressions, break and continue must have their enclosing loop
                bodies;
  @Description: Checks that continue is allowed inside all kinds of loops.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

func f(n : Nothing) { }

main() {
    do {
        var i = 0
        while (i < 10) {
            for (_ in 0..10) {
                continue
            }
            i++
            f(continue)
        }
        var n = continue
    } while (false)
    0
}
