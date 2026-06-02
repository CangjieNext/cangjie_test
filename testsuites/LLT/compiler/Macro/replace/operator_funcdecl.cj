// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 1

import test.*

public class DateTime {
    //@callTest(private static let MinTickValue : Int64 = -6933062592000000000)
    @callTest
    private static let MinTickValue: Int64 = -6933062592000000000

    public var year: Int64
    public init(year: Int64, month: Int64, day: Int64) {
        this.year = year
    }

    @callTest
    public operator func +(d2: DateTime) {
        return this.year + d2.year
    }
}

main() {
    var a = DateTime(0, 0, 0)
    var b = DateTime(1, 1, 1)
    println(a + b)
    return 0
}
