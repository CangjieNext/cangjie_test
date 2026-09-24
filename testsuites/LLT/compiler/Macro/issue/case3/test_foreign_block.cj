// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import define.*

@V4(
    foreign {
        func foo(): Unit
    }
)

@V4(
    foreign {
        func bar(): Int32
        func baz(): Int32
    }
)

@V4(
    foreign func qux(): Unit
)

foreign {
    func direct(): Unit
}

main(): Int32 {
    return 0
}
