/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         aux_test_wrong_cond_id

  @Level:         1

  @Description:  Tests ISSE in case wrong ConditionId is passed

  @Structure:    complex-aux
*/
public import std.sync.*  // Mutex
public import std.time.*
public import utils.assert.Assert

public func testWrongId() {
    let m1 = Mutex()
    let condId1:Condition
    synchronized(m1) {
        condId1 = m1.condition()
    }

    let m2 = Mutex()
    let condId2:Condition
    synchronized(m2) {
        condId2 = m2.condition()
    }

    // wait with timeout
    let fut1 = spawn {
        synchronized(m1) {
            condId2.wait(timeout: Duration.nanosecond * 10)
        }
        return 0xA
    }
    Assert.throws({ => fut1.get() }, check: { e => e is IllegalSynchronizationStateException})

    // wait without timeout
    let fut2 = spawn {
        synchronized(m1) {
            condId2.wait()
        }
        return 0xA
    }
    Assert.throws({ => fut2.get() }, check: { e => e is IllegalSynchronizationStateException})

    // notify
    Assert.throws({ =>
        synchronized(m1) {
            condId2.notify()
        }
    }, check: { e => e is IllegalSynchronizationStateException})

    // notifyAll
    Assert.throws({ =>
        synchronized(m1) {
            condId2.notifyAll()
        }
    }, check: { e => e is IllegalSynchronizationStateException})
}
