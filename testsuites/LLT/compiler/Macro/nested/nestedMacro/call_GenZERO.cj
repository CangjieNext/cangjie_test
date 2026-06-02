// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroGenZeroPos.cj
// EXEC: %compiler %cmp_macro macroGenZeroPos.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan helloworld

import m1.*

main(): Int64 {
    let a = @genZEROPos(1+2)
    println(a)
    0
}
