// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import view.*

struct te2<T> {
    var fi: T
    var fi2: T
    @M[1 + 2]
    public init(name: T) {
        fi = name
        fi2 = name
    }
    @M
    public init(name: T, name2: T) {
        fi = name
        fi2 = name2
    }
}

main(): Int64 {
    var a = te2<Int64>(5)
    if (a.fi != 5 || a.fi2 != 5) {
        return 1
    }
    return 0
}
