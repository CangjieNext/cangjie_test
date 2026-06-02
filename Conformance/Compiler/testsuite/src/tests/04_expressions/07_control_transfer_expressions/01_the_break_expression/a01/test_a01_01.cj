
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_01_a01_01

  @Level:         1

  @Assertion:   4.7.1(1) A break expression can only be used in loop bodies.
  @Description: Checks that break is allowed inside all kinds of loops.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: Ignore

*/

func f(n : Nothing) { }

main() {
    do {
        while (true) {
            for (_ in 0..10) {
                break
            }
            f(break)
        }
        var n = break
    } while (true)
}
