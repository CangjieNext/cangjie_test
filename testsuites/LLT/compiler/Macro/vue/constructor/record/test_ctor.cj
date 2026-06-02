// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: regex Hello Macro!

import view.*

struct t {
    var counter: Int64 = 3
    @callView
    init(name: Int64) {
        counter = name
        print("Hello Macro!")
    }
}

main(): Int64 {
    t(5)
    return 0
}
