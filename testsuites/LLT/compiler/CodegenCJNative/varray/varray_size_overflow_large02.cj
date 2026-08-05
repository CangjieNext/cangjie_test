// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Companion to varray_size_overflow_wrap01: N = 6442450959, element Int64
// (8 bytes). The total byte size N * 8 = 51539607672 (~48GB) does NOT overflow
// uint64, so the per-type overflow check does not fire; the oversized frame
// is rejected by CJIRVerifier's cumulative stack frame check instead, which
// enforces the cangjie 2GB stacksize limit at IR level on every target.
// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan stack frame exceeds cangjie max stacksize(2GB)

main(): Int64 {
    var varr: VArray<Int64, $6442450959> = VArray<Int64, $6442450959> {i => i + 1}
    if (varr.size == 6442450959) {
        return varr[0] - 1
    }
    return 1
}
