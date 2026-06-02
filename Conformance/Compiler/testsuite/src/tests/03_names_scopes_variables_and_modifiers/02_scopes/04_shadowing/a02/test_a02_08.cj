/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a02_08

  @Level:         1

  @Assertion:    3.2.4(2) Note that shadowing ends when the lower-scope ends.

  @Description:  Check different kinds of scopes.
                 Check that outer local-scope is used when inner local-scope ends.

  @Mode:         run

  @Negative:     no


*/

import utils.assert.Assert

let f1: (Int32, Int32) -> Int32 = {
    x, y => if (true) {
                let x = "foo"
                let y = "foo"
                Assert.equals("foofoo", x+y)
            }

            return x + y
}

func fact (n: Int64, ini!: Int64 = 1): Int64 {
    if (n == 0) {
        if (true) {
            let n = "foo"
            let ini = "foo"
            Assert.equals("foofoo", n+ini)
        }

        return n + ini
    } else {
        return n * if (n > 0) {
                        if (true) {
                            let n = "foo"
                            let fact = "foo"
                            Assert.equals("foofoo", n+fact)
                        }

                       if (n == 10) {
                            if (true) {
                                let n = "bar"
                                let fact = "bar"
                                Assert.equals("barbar", n+fact)
                            }
                            fact(n-1)
                        } else {
                            7
                        }
                    } else {
                        7
                    }
    }
}

main() {
    Assert.equals(30, f1(10, 20))
    Assert.equals(630, fact(10))
}
