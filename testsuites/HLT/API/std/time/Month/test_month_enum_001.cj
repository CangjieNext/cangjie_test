/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not Exception

import std.time.*

class TestEnum {
    public func test() :Int64{
        var result = 0
        let monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September",
            "October", "November", "December"]
        for (i in 1..=12) {
            let month = Month.of(i)
            if (month.toString() != monthNames[i - 1]) {
                print("Test function of, the expect is ${monthNames[i - 1]}, the actual is ${month.toString()}\n")
                result = 1
            }
            if (month.value() != i) {
                print("Test function value, the expect is ${i}, the actual is ${month.value()}\n")
                result = 1
            }
        }
        let months = [0, 13]
        for (num in months) {
            try {
                let time = Month.of(num)
                print("num: " + num.toString() + "\n")
            } catch (_) {
                continue
            }
            print("Month of ${num} should throw exception!\n")
            result = 1
        }
        return result
    }
}

main(): Int64 {
    let cases = TestEnum()
    return cases.test()
}
