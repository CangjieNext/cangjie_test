// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC-PIPE-1: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan foo(Unit, Bool, Rune, Float16, Float32, Float64, Int8, Int16, Int32, Int64, UInt8, UInt16, UInt32, UInt64, IntNative, UIntNative)
func foo(
    u: Unit,
    b: Bool,
    c: Rune,
    dh: Float16,
    f: Float32,
    d: Float64,
    a: Int8,
    s: Int16,
    i: Int32,
    l: Int64,
    h: UInt8,
    t: UInt16,
    j: UInt32,
    m: UInt64,
    q: IntNative,
    r: UIntNative
): Int64 {
    throw Exception()
}

main() {
    foo(
        (),
        true,
        r'0',
        0.0,
        0.0,
        0.0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
    )
}
