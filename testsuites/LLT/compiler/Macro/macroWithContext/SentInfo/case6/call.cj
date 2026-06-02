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

@Outer
func test1() {
    @Inner1["name1"]
    @Inner2["name2"]
    var a = 1
    @Inner1["name1"]
    @Inner["name"]
    var b = 1
    @Inner1["name1"]
    @Inner["name"]
    var b2 = 1
    @Inner["name"]
    var b1 = 1

    return 0
}

main(): Int64 {
    return 0
}
