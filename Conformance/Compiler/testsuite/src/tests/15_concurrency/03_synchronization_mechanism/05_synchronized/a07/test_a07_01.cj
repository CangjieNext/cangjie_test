/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_05_a07_01

  @Level:         1
  @Assertion:    15.3.5(7) • If there is a break or continue expression in the
                 synchronized code block, and the execution of that expression
                 would cause the program to exit the code block, m.unlock()
                 gets called automatically.

  @Description:  Checks that mutex is unlocked automatically if break/continue
                 happens inside synchronized code block

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../aux_sync_lock_unlock.cj

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert
import sync_lock_unlock.*

func testBreak(m: Mutex) {
    testSyncGeneric(m,
        { =>
            resetCommonFlags()
        },
        { => spawn {
            while (0 < 1) {
                synchronized(m) {
                    raiseInsideSync()
                    while (!getLockChecked()) {
                        sleep(Duration.nanosecond * 10)
                    }
                    break
                }
            }
            return 0
        }},
        { fut:Future<Int64> =>
            Assert.equals(0, fut.get(), reason: "Future result should match")
        })
}

func testContinue(m: Mutex) {
    testSyncGeneric(m,
        { =>
            resetCommonFlags()
        },
        { => spawn {
            var i = 0;
            while (i < 1) {
                synchronized(m) {
                    raiseInsideSync()
                    while (!getLockChecked()) {
                        sleep(Duration.nanosecond * 10)
                    }
                    i++
                    continue
                }
            }
            return 0
        }},
        { fut:Future<Int64> =>
            Assert.equals(0, fut.get(), reason: "Future result should match")
        })
}

func test(m: Mutex) {
    testBreak(m)
    testContinue(m)
}

main(): Int64 {
    test(Mutex())

    return 0
}
