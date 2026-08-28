// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression for a struct whose member is a huge VArray. The inner VArray
// (N = 2^61 + 11, N * 8 = 2^64 + 88) overflows uint64, but the enclosing
// struct type's DataLayout size wraps silently to a small value, so a naive
// check of the struct size alone would miss it. The IR-level check must
// recurse into struct members and reject.
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan The allocation type size exceeds the maximum representable size

struct SM {
    var arr: VArray<Int64, $2305843009213693963> = VArray<Int64, $2305843009213693963> {i => i + 1}
}

main(): Int64 {
    var s = SM()
    return s.arr[0]
}
