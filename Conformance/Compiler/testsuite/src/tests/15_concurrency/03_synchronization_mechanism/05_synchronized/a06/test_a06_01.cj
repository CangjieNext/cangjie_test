/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_05_a06_01

  @Level:         1
  @Assertion:    15.3.5(6) • Upon reaching a return e expression in the
                 synchronized code block, e is first evaluated to a value v,
                 then m.unlock() is called, and, finally, the value v is
                 returned.

  @Description:  Checks that evaluation of return value happens before unlock

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../aux_sync_lock_unlock.cj

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert
import sync_lock_unlock.*

let misticInt:Int64 = 0xBAAD
var insideCalc:Bool = false
var insideCalcChecked:Bool = false

func calcValue():Int64 {
    insideCalc = true
    while (!insideCalcChecked) {
        sleep(Duration.nanosecond * 10)
    }
    return misticInt
}

func test(m: Mutex) {
    testSyncGeneric(m,
        { =>
            resetCommonFlags()
            insideCalc = false
            insideCalcChecked = false
        },
        { => spawn {
            synchronized(m) {
                raiseInsideSync()
                while (!getLockChecked()) {
                    sleep(Duration.nanosecond * 10)
                }
                return calcValue()
            }
            return 0
        }},
        { fut:Future<Int64> =>
            while (!insideCalc) {
                sleep(Duration.nanosecond * 10)
            }
            Assert.isFalse(m.tryLock(), reason: "The lock should be locked")
            insideCalcChecked = true
            Assert.equals(misticInt, fut.get(), reason: "Future result should match")
        })
}

main(): Int64 {
    test(Mutex())


    return 0
}
