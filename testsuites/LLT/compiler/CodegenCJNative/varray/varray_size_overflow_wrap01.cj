// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression for the VArray total-size wraparound (issue2.md).
// N = 2305843009213693963 (= 2^61 + 11), element Int64 (8 bytes), so the total
// byte size N * 8 = 2^64 + 88 overflows uint64 and wraps to 88 (< 2GB). Before
// the fix, that wraparound silently produced a tiny 88-byte stack allocation,
// bypassing the 2GB stacksize guard, so cjc compiled a binary that crashed at
// runtime. cjc must now reject it as a compile error.
// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan wraps around and exceeds cangjie max stacksize(2GB)

main(): Int64 {
    var varr: VArray<Int64, $2305843009213693963> = VArray<Int64, $2305843009213693963> {i => i + 1}
    println(varr.size)
    for (i in 0..varr.size) {
        println(varr[i])
    }
    return 0
}
