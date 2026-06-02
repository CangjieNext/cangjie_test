// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output
// ASSERT: scan object cannot access static member 'a'

import test.*

class DataA {
    @callTest
    public static var a = 1
    public init(input: Int64) {
        a = input
    }
}

main(): Int64 {
    var da = DataA(0).a
    return 0
}

