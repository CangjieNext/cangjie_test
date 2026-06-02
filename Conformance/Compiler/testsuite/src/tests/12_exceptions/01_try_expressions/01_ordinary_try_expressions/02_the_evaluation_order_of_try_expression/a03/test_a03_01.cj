/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      12_01_01_02_a03_01

  @Level:         1

  @Assertion: 12.1.1.2(3) if any break or continue expression is executed 
              before entering the finally block, then the finally block will be
              executed immediately.
  @Description: Checks the finally block will be executed immediately after the
                execution of any break or continue expressions.
  @Mode: run
  @Negative: no
  @CompileWarning: Ignore
  @Structure: single

*/

import utils.assert.Assert

main() {
    var ind = 0
    var sequence = ""

    // test case #1: break in try
    do {
        ind++
        try {
            sequence = sequence + "t" + ind.toString()
            break
            Assert.fail(reason : "test #1 failed.")
        } catch (e: Exception) {
            Assert.fail(reason : "test #1 failed.")
        } finally {
            sequence = sequence + "f" + ind.toString() 
        }
        Assert.fail(reason : "loop should be broken.")
    } while (ind < 3)
    Assert.equals("t1f1", sequence)

    // test case #2: break in catch
    ind = 0
    sequence = ""
    do {
        ind++
        try {
            sequence = sequence + "t" + ind.toString()
            if(ind == 2) {
                throw Exception()
                Assert.fail(reason : "test #2 failed.")
            }
        } catch (e: Exception) {
            sequence = sequence + "c" + ind.toString()
            break
            Assert.fail(reason : "test #2 failed.")
        } finally {
            sequence = sequence + "f" + ind.toString()
        }
        if(ind > 1) {
            Assert.fail(reason : "loop should be broken.")
        }
    } while (ind < 3)
    Assert.equals("t1f1t2c2f2", sequence)

    // test case #3: continue in try
    sequence = ""
    for (i in [0, 1, 2] ) {
        try {
            sequence = sequence + "t" + i.toString()
            continue
            Assert.fail(reason : "test #3 failed.")
        } catch (_) {
            Assert.fail(reason : "test #3 failed.")
        } finally {
            sequence = sequence + "f" + i.toString()
        }
        Assert.fail(reason : "loop should be broken.")
    }
    Assert.equals("t0f0t1f1t2f2", sequence)

    // test case #4: continue in catch
    sequence = ""
    for (i in [0, 1, 2] ) {
        try {
            sequence = sequence + "t" + i.toString()
            throw Exception()
            Assert.fail(reason : "loop should be broken.")
        } catch (_) {
            sequence = sequence + "c" + i.toString()
            continue
            Assert.fail(reason : "test #4 failed.")
        } finally {
            sequence= sequence + "f" + i.toString()
        }
        Assert.fail(reason : "test #4 failed.")
    }
    Assert.equals("t0c0f0t1c1f1t2c2f2", sequence)
}
