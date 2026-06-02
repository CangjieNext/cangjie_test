// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg.cj -o pkg.a
// EXEC: %compiler %cmp_opt %f pkg.a -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

import default.d2.*

class CB {
    public init() {}

    public static let bbb: CA = CA()
}

extend CB {
    public static func foo() {
        return bbb.aaa
    }
}

main(): Int64 {
    CB.foo() + 93
}
