/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         aux_sync_lock_unlock

  @Level:         1

  @Description:  Checks that mutex.lock() is called at the beginning of
                 synchronized section, and mutex.unlock() is called at the end
                 mutex can be locked afterwards i.e. mutex was locked only
                 once and fully unlocked

  @Structure:    complex-aux
*/

package sync_lock_unlock

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert

var insideSync:Bool = false
var lockChecked:Bool = false

public func raiseInsideSync() {
    insideSync = true
}

public func getLockChecked() {
    return lockChecked
}

public func resetCommonFlags() {
    // let's reset flags
    insideSync = false
    lockChecked = false
}

public func testSyncGeneric(
        m: Mutex,
        resetState: () -> Unit,
        createThread: () -> Future<Int64>,
        extraCheck: (Future<Int64>) -> Unit) {
    resetState()

    let fut = createThread()
    while (!insideSync) {
        sleep(Duration.nanosecond * 10)
    }
    Assert.isFalse(m.tryLock(), reason: "The lock should be locked")
    lockChecked = true
    extraCheck(fut)

    Assert.isTrue(m.tryLock(), reason: "The lock should be unlocked")
    m.unlock()
}

func testCommon(m: Mutex, syncAction: () -> Unit, extraCheck: (Future<Int64>) -> Unit) {
    testSyncGeneric(m,
        { => resetCommonFlags() },
        { => spawn {
            synchronized(m) {
                raiseInsideSync()
                while (!getLockChecked()) {
                    sleep(Duration.nanosecond * 10)
                }
                syncAction()
            }
            return 0
        }},
        extraCheck)
}

public func testWithoutException(m: Mutex) {
    testCommon(m, { => }, { fut:Future<Int64> =>
        Assert.equals(0, fut.get(), reason: "Future result should match")
    })
}

public func testWithException(m: Mutex) {
    testCommon(m, { =>
            throw Exception("Expected exception")
        }, { fut:Future<Int64> =>
        Assert.throws({ => fut.get() }, check: { e => e is Exception})
    })
}

public func testSyncLockUnlock(m: Mutex) {
    testWithoutException(m)
    testWithException(m)
}
