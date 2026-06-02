/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt   %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Exception
// ASSERT: scan Hour value in format "HH" must be in [0, 23]

import std.time.*

class TestParseFormat {
    public func testTimeParse(): Int64 {
        let old1 = "2010-06-01T24:00:00"
        let new1 = DateTime.parse(old1).toString()
        return 0
    }
}

main(): Int64 {
    let cases: TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
