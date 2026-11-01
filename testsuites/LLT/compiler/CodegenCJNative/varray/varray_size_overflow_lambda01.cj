// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression for a huge VArray declared inside a lambda. A lambda is codegen'd
// as a separate LLVM function with its own stack frame, and the IR-level
// overflow check covers every function, so the overflowing VArray
// (N = 2^61 + 11, N * 8 = 2^64 + 88 overflows uint64) must be rejected just
// like one declared directly in main.
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan The allocation type size exceeds the maximum representable size

main(): Int64 {
    let f = { =>
        var varr: VArray<Int64, $2305843009213693963> = VArray<Int64, $2305843009213693963> {i => i + 1}
        return varr[0]
    }
    return f()
}
