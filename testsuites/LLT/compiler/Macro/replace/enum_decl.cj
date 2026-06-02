// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan a.test

import test.*

@callTest
public enum EMonth {
    Jan | Feb | Mar | Apr | May | Jun | Jul | Aug | Sep | Oct | Nov | Dec
}

enum A {
    a

    @callTest
    public func test() {
        println("a.test")
    }
}

enum B {
    a

    @callTest
    public prop i: Int64 {
        get() {
            return 0
        }
    }
}

main(): Int64 {
    A.a.test()
    return 0
}
