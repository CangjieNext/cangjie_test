// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import define.*

@M
func foo(): Int32 {
    let a = Some<Int32>(2)
    if (let Some(v) <- a) {
        println("Ok")
        return v
    }
    return 0
}

main() {
    let a = foo()
    if (a != 2) {
        return 1
    }
    0
}
