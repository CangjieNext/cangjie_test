/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

func i64() {
    var a = quote(0i64)
    if (a[0].kind == INTEGER_LITERAL) {
        return 1
    }
    0
}

func i32() {
    match (quote(0i32)[0].kind) {
        case INTEGER_LITERAL => 1
        case _ => 2
    }
}

func i16() {
    match (quote(0x111i16)[0].kind) {
        case INTEGER_LITERAL => 1
        case _ => 2
    }
}

func i8() {
    match (quote(0x11i8)[0].kind) {
        case INTEGER_LITERAL => 1
        case _ => 2
    }
}

func u64() {
    match (quote(0x111u64)[0].kind) {
        case INTEGER_LITERAL => 1
        case _ => 2
    }
}

func u32() {
    match (quote(0x1u32)[0].kind) {
        case INTEGER_LITERAL => 1
        case _ => 2
    }
}

func u16() {
    match (quote(2u16)[0].kind) {
        case INTEGER_LITERAL => 1
        case _ => 2
    }
}

func u8() {
    match (quote(2u8)[0].kind) {
        case INTEGER_LITERAL => 1
        case _ => 2
    }
}

func f16() {
    match (quote(0.0f16)[0].kind) {
        case FLOAT_LITERAL => 1
        case _ => 2
    }
}

func f32() {
    match (quote(0.0f32)[0].kind) {
        case FLOAT_LITERAL => 1
        case _ => 2
    }
}

func f64() {
    match (quote(0.0f64)[0].kind) {
        case FLOAT_LITERAL => 1
        case _ => 2
    }
}

func b() {
    match (quote(b'A')[0].kind) {
        case CHARACTER_BYTE_LITERAL => 1
        case _ => 2
    }
}

func bd() {
    match (quote(b"A")[0].kind) {
        case BYTE_STRING_ARRAY_LITERAL => 1
        case _ => 2
    }
}

main(): Int64 {
    if (i64() != 1) {
        return 1
    }
    if (i32() != 1) {
        return 2
    }
    if (i16() != 1) {
        return 3
    }
    if (i8() != 1) {
        return 4
    }
    if (u64() != 1) {
        return 5
    }
    if (u32() != 1) {
        return 6
    }
    if (u16() != 1) {
        return 7
    }
    if (u8() != 1) {
        return 8
    }
    if (f64() != 1) {
        return 9
    }
    if (f32() != 1) {
        return 10
    }
    if (f16() != 1) {
        return 11
    }
    if (b() != 1) {
        return 12
    }
    if (bd() != 1) {
        return 13
    }
    return 0
}
