/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_07_a03_01

  @Level:         1
  @Assertion:    15.3.7(3) Initially, a MultiConditionMonitor has no associated
                 conditions. Each invocation of  newCondition associates a new
                 wait queue with this monitor and returns a unique identifer of
                 the following type:

    external struct ConditionID {
        private init() { ... } // constructor is intentionally private to
                               // prevent creation of such structs outside of
                               // MultiConditionMonitor
    }

  @Description:  Checks that newCondition() creates objects of type ConditionID

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import std.sync.*  // Atomics
import utils.assert.Assert

main(): Int64 {
    let m = Mutex()
    let c = synchronized(m) { m.condition() }
    synchronized(m) {
        // checking 1M of ConditionIDs can be generated
        for (i in 0..1_000_000) {
            Assert.isTrue(m.condition() is Condition)
        }
    }

    return 0
}
