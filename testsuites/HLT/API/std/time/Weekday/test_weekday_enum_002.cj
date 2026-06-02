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
        var w1 = DayOfWeek.Sunday
        var w2 = DayOfWeek.Thursday
        var w3 = DayOfWeek.Sunday
        if (w1 == w2) {
            return 1
        }
        if (w1 != w3) {
            return 2
        }
        return result
    }
}

main(): Int64 {
    let cases = TestEnum()
    return cases.test()
}
