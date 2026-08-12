// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression for the VArray total-size overflow at global scope.
// N = 2305843009213693963 (= 2^61 + 11), element Int64 (8 bytes), so the total
// byte size N * 8 = 2^64 + 88 overflows uint64. The global's value type is the
// huge array itself, so the IR-level allocation-size check rejects it by naming
// the global variable. Before the fix the assembler emitted only the wrapped
// byte count for the global, so reads and writes through it went out of bounds
// at run time.
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan The value type size exceeds the maximum representable size

var hugeGlobal: VArray<Int64, $2305843009213693963> = VArray<Int64, $2305843009213693963> {i => i + 1}

main(): Int64 {
    println(hugeGlobal.size)
    for (i in 0..hugeGlobal.size) {
        println(hugeGlobal[i])
    }
    return 0
}
