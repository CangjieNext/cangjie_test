// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression for a multi-level struct nesting: the huge VArray sits three
// struct levels deep (Outer -> Mid -> Deep -> VArray), and every enclosing
// struct's DataLayout size wraps silently to a small value, so only a check
// that recurses through all struct levels can find the overflowing member.
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan The allocation type size exceeds the maximum representable size

struct Deep {
    var arr: VArray<Int64, $2305843009213693953> = VArray<Int64, $2305843009213693953> {i => i}
}

struct Mid {
    var d: Deep = Deep()
}

struct Outer {
    var m: Mid = Mid()
}

main(): Int64 {
    var s = Outer()
    return s.m.d.arr[0]
}
