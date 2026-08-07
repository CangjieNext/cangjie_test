// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression for the VArray total-size overflow at global scope.
// N = 2305843009213693963 (= 2^61 + 11), element Int64 (8 bytes), so the total
// byte size N * 8 = 2^64 + 88 overflows uint64. A huge global VArray is kept
// alive by the synthetic 0_for_keeping_some_types function via a bare alloca
// (that function has no Cangjie GC), so the IR-level allocation-size check
// must cover every function, not only GC ones. Before the fix the overflow
// silently produced a tiny stack allocation, bypassing the backend's
// stacksize limit, so cjc compiled a binary that crashed at runtime.
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan The allocation type size exceeds the maximum representable size

var hugeGlobal: VArray<Int64, $2305843009213693963> = VArray<Int64, $2305843009213693963> {i => i + 1}

main(): Int64 {
    println(hugeGlobal.size)
    for (i in 0..hugeGlobal.size) {
        println(hugeGlobal[i])
    }
    return 0
}
