/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_04_a02_01

  @Level:         1

  @Assertion: 4.5.4(2) In general, for-in expressions are used when the number of iterations is known,
              or all elements in a sequence need to be visited
  @Description: Test example of for-in loop over array
  @Mode: run
  @Negative: no
  @CompileWarning: ignore

*/

import utils.assert.Assert

type Predicate = (Int64) -> Bool

func find_elem (a: Array<(Int64, String)>, f: Predicate) {
    for ((x, y) in a) {
        if (f(x)) {
            return y
        }
    }
    return ""
}

main() {
    let a = [(3, "no"), (7, "no"), (21, "yes"), (100, "no")]
    let predicate = { x: Int64 => x % 3 == 0 && x % 7 == 0 }
    Assert.equals("yes", find_elem(a, predicate))
}
