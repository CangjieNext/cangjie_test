/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt   %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not Exception
// ASSERT: scan-not Failure

import std.time.*

func hasException(lamb: () -> DateTime): Bool {
    try {
        lamb()
        return false
    } catch (e: Exception) {
        return true
    }
}

class TestParseFormat {
    public func testTimeParse(): Int64 {
        let old1 = "2020-10-1T"
        if (!hasException({=> DateTime.parse(old1)})) {
            print("Failure")
        }

        return 0
    }
}

main(): Int64 {
    let cases: TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
