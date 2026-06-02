/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.sync.*
import std.time.*

@Test
class TestTimeout {
    let mm = MultiConditionMonitor()
    @TestCase
    func negative_value(): Unit {
        synchronized(mm) {
            let id = mm.newCondition()
            try {
                mm.wait(id, timeout: Duration.Zero)
                @Expect(false)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message, "Timeout cannot be less than or equal to `Duration.Zero`.")
            }
        }
    }

    @TestCase
    func big_value(): Unit {
        let id = synchronized(mm) {
            mm.newCondition()
        }
        spawn {
            sleep(Duration.second)
            synchronized(mm) {
                mm.notify(id)
            }
        }
        synchronized(mm) {
            mm.wait(id, timeout: Duration.Max)
        }
    }
}
