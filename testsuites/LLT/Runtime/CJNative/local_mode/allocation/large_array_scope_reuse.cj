// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A local array larger than the default native2 chunk must be released when
// its owning scope exits instead of accumulating in the per-mutator cache.
// EXEC: %compiler %cmp_opt %disableFuncInlining %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan large arrays: 992

func consumeLarge(seed: Int64): Int64 {
    let values: Array<Int64> @local! = Array<Int64>(1024, repeat: seed) @local!
    values[0] + values[1023]
}

main(): Unit {
    var sum: Int64 = 0
    for (i in 0..32) {
        sum += consumeLarge(i)
    }
    println("large arrays: ${sum}")
}
