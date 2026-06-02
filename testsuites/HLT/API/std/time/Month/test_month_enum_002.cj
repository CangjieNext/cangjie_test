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
    public func test():Int64 {
        var result = 0
        var m1 = Month.February
        var m2 = Month.February
        var m3 = Month.September
        if (m1 == m3) {
            return 1
        }
        if (m1 != m2) {
            return 1
        }
        if (m1 + 3 != Month.May) {
            return 1
        }
        if (m3 - 6 != Month.March) {
            return 1
        }
        return result
    }
}

main(): Int64 {
    let cases = TestEnum()
    return cases.test()
}
