// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression for a struct whose member sizes overflow only when summed. Each
// member is a giant VArray of 2^61 - 8 bytes, individually representable in
// uint64 bits, but the struct total (2^62 - 16 bytes) is not. The struct
// member sum must be accumulated in checked arithmetic and rejected; the
// wrapped DataLayout struct size would pass a naive check.
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan The allocation type size exceeds the maximum representable size

struct TwoGiant {
    var a: VArray<Int64, $288230376151711743> = VArray<Int64, $288230376151711743> {i => i}
    var b: VArray<Int64, $288230376151711743> = VArray<Int64, $288230376151711743> {i => i}
}

main(): Int64 {
    var s = TwoGiant()
    return s.a[0] + s.b[0]
}
