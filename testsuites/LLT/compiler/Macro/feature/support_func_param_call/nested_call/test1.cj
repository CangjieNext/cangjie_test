// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj define1.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_macro define1.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
import define.*
import define1.*

func test(
    @M
    @N(a2 : Int64),
    @M
    @N(a !: Int64)
) {
    println(a2)
    println(a)
}

main() {
    test(1, a: 11)
    return 0
}
