// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

struct Data {
    public var a: Int64
    @callTest
    public var b: Int64

    @callTest
    public init(ia: Int64, ib: Int64) {
        a = ia
        b = ib
    }

    @callTest
    public static func test(input: Int64): Int64 {
        2
    }
}

main(): Int64 {
    return Data(0, 1).a
}
