/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

const a1: UInt64 = 0
const a2 = 1
const a3 = 0i32
const a4 = 0i16
const a5 = 0i8
const a6 = 0u32
const a7 = 0u16
const a8 = 0u8
const b1 = true
const b2 = false
const c = ()
const d = r'a'
const e: Rune = 'A'
const f: Rune = "a"
const g1 = "123"
const g2 = "Hello Cangjie Lang\n"
const g3 = """
"""
const g4 = #""#
const g5 = ##""##

main(): Int64 {
    const _a1: UInt64 = 0
    const _a2 = 1
    const _a3 = 0i32
    const _a4 = 0i16
    const _a5 = 0i8
    const _a6 = 0u32
    const _a7 = 0u16
    const _a8 = 0u8

    const _b1 = true
    const _b2 = false

    const _c = ()

    const _d = r'a'
    const _e: Rune = 'A'
    const _f: Rune = "a"

    const _g1 = "123"
    const _g2 = "Hello Cangjie Lang\n"
    const _g3 = """
    """
    const _g4 = #""#
    const _g5 = ##""##
    return 0
}
