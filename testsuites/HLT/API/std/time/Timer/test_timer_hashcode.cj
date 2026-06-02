/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 
import std.sync.*
import std.time.*

@Test
class Test_Timer_once {
    @TestCase
    func TimerhashCode_case01(): Unit {
        let duration = Duration.Min
        spawn {
            var timer1 = Timer.once(duration) {}
            var num1 = timer1.hashCode()
            @Expect(num1, 1)
            timer1.cancel()
        }
        sleep(Duration.second)
        spawn {
            var timer2 = Timer.once(duration) {}
            var num2 = timer2.hashCode()
            @Expect(num2, 2)
            timer2.cancel()
        }
        sleep(Duration.second)
        spawn {
            var timer3 = Timer.once(duration) {}
            var num3 = timer3.hashCode()
            @Expect(num3, 3)
            timer3.cancel()
        }
        sleep(Duration.second)
        spawn {
            var timer4 = Timer.once(duration) {}
            var num4 = timer4.hashCode()
            @Expect(num4, 4)
            timer4.cancel()
        }
    }
}
