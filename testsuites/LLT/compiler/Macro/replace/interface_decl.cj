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

interface A {
    @callTest
    static func test(input: Int32): Int64 {
        1
    }
    @callTest
    static func test(input: Int64): Int64 {
        2
    }
    @callTest
    func test2(input: Int64): Int64
}

class Test <: A {
    public func test2(input: Int64): Int64 {
        3
    }
}

main() {
    if (Test.test(1) != 2) {
        return 1
    }

    return 0
}
