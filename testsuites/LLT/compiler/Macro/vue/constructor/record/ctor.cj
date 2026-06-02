// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT: regex constructor 'init' has overload conflicts

import view.*

@callView
struct te2 {
    var fi: Int64
    @callView
    te2(name: Int64) {
        counter = name
        print("Hello Macro!")
    }
    @M[1 + 2]
    init(name: Int64) {
        fi = name
    }
}

main(): Int64 {
    te2(5)
    return 0
}
