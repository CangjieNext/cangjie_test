// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import open.*

func test1() {
    @override(
    let (a, b) = (1, 2)
    )
    (a, b)
}

main(): Int64 {
    @override
    var a = test1()
    var b = a[0]
    if (b != 1) {
        return 1
    }
    return 0
}
