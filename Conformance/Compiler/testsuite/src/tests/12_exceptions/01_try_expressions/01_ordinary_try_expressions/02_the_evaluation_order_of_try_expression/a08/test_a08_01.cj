/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_02_a08_01

  @Level:         1

  @Assertion:    12.1.1.2(8) If any break or continue expression in the finally block is executed,
                             then the enclosing loop will be ended immediately.

  @Description: Checks that enclosing loop is ended immediatelly after break or continue expression
                in the finally block was executed.

  @Mode:         run

  @Negative:     no

  @CompileWarning: Ignore

  @Structure:    single

*/

import utils.assert.Assert
main() {
// test case #1
    var ind = 0
    for (i in [1, 2, 3, 4]) {
        if (i == 3) {
            try {
            } catch (_) {
            } finally {
                break
                Assert.fail(reason : "test #1 failed : break has to breck the loop.")
            }
        }
        ind++
    }
    Assert.equals(2, ind)

// test case #2
    ind = 0
    while (ind < 4) {
        ind++
        try {
        } finally {
            continue
            Assert.fail(reason : "test #2 failed : continue has to continue the loop.")
        }
        Assert.fail(reason : "test #2 failed : finally block was not executed.")
    }
}
