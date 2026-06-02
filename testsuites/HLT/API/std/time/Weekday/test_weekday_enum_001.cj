/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not Exception

import std.time.*

class TestEnum {
    public func test(): Int64 {
        var result = 0
        let weekNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        for (i in 0..=6) {
            let dayOfWeek = DayOfWeek.of(i)
            if (dayOfWeek.toString() != weekNames[i]) {
                print("Test function of, the expect is ${weekNames[i]}, the actual is ${dayOfWeek.toString()}\n")
                result = 1
            }
            if (dayOfWeek.value() != i) {
                print("Test function value, the expect is ${i}, the actual is ${dayOfWeek.value()}\n")
                result = 1
            }
        }
        let daysOfWeek = [-1, 7]
        for (num in daysOfWeek) {
            try {
                let time = DayOfWeek.of(num)
            } catch (_) {
                continue
            }
            print("DayOfWeek of ${num} should throw exception!\n")
            result = 1
        }

        return result
    }
}

main(): Int64 {
    let cases = TestEnum()
    return cases.test()
}
