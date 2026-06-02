/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the Class Timer.
 * Test API:
 *          public func hashCode(): Int64
 */

import std.sync.*
import std.time.*

@Test
class TestTimerHashable {
    @TestCase
    func test() {
        let cnt = 10
        let timers = Array<Bool>(cnt, repeat: false)

        for (i in 0..cnt) {
            spawn {
                let timer = match (i % 4) {
                    case 0 => Timer.once(Duration.Zero) {=>}
                    case 1 => Timer.repeat(Duration.Zero, Duration.second, {=>})
                    case 2 => Timer.repeatDuring(Duration.hour, Duration.Zero, Duration.second, {=>})
                    case 3 => Timer.repeatTimes(10, Duration.Zero, Duration.second, {=>})
                    case _ => throw Exception("Impossible")
                }
                timers[timer.hashCode() - 1] = true
            }
        }

        sleep(Duration.millisecond * 100)

        for (hasTimer in timers where hasTimer == false) {
            @Expect(false)
        }
    }
}
