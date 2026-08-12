// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Companion to varray_size_overflow_wrap01: N = Int64 max (9223372036854775807),
// element Int64 (8 bytes). N * 8 overflows uint64 as well, so the frontend
// overflow check rejects it with the same "too large" error, before any
// backend stacksize limit is consulted.
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan The allocation type size exceeds the maximum representable size

main(): Int64 {
    var varr: VArray<Int64, $9223372036854775807> = VArray<Int64, $9223372036854775807> {i => i + 1}
    if (varr.size == 9223372036854775807) {
        return varr[0] - 1
    }
    return 1
}
