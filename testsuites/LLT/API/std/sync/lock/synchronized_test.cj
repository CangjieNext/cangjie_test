/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*

/*
 * Test description: Test the key world `synchronized` for interface `Lock`.
 */
@Test
class SynchronizedTest {
    @TestCase
    func testMutex(): Unit {
        let m = Mutex()
        synchronized(m) {
            println("mutex lock success")
        }
    }

    @TestCase
    func testCustomLock(): Unit {
        let l = MyLock()
        synchronized(l) {
            println("custom lock success")
        }
    }
}

class MyLock <: Lock {
    public func lock(): Unit {
        println("lock called")
    }

    public func tryLock(): Bool {
        throw UnsupportedException("tryLock")
    }

    public func unlock(): Unit {
        println("unlock called")
    }
}

/* SCAN-IN
mutex lock success
lock called
custom lock success
unlock called
 */
