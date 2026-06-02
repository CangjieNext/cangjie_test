// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func ark_typ(a: Float32, b: Float32): Float32 {
    let c: Float32 = 4.5
    let x: Int32 = 0x7fff0000
    let ch: Rune = 'a'
    return c + (a + b) * 10.0
}

main(): Int64 {
    let a: Float32 = ark_typ(0.3, 0.9)
    if (a == 16.500000) {
        return 0
    }
    return 1
}
