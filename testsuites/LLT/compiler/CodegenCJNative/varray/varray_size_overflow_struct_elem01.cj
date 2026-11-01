// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression for a VArray whose element is a user-defined struct. SE is
// 16 bytes, N = 2305843009213693963 (= 2^61 + 11), so the total byte size
// N * 16 = 2^65 + 176 overflows uint64. The IR-level check must multiply the
// DataLayout size of the struct element by N in checked arithmetic and reject.
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan The allocation type size exceeds the maximum representable size

struct SE {
    var a: Int64
    var b: Int64
    init(a: Int64, b: Int64) {
        this.a = a
        this.b = b
    }
}

main(): Int64 {
    var varr: VArray<SE, $2305843009213693963> = VArray<SE, $2305843009213693963> {i => SE(i, i + 1)}
    return varr[0].a
}
