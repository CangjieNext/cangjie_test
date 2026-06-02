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

// 数值类型转换表达式
func i64() {
    Int64(Int32(1i64))
}

func i32() {
    match (0i32) {
        case 0i32 => 1
        case _ => 2
    }
}

func i16() {
    match (0i16) {
        case 0i16 => 1
        case _ => 2
    }
}

func i8() {
    match (0i8) {
        case 0i8 => 1
        case _ => 2
    }
}

func u64() {
    match (0u64) {
        case 0u64 => 1
        case _ => 2
    }
}

func u32() {
    match (0u32) {
        case 0u32 => 1
        case _ => 2
    }
}

func u16() {
    match (0u16) {
        case 0u16 => 1
        case _ => 2
    }
}

func u8() {
    match (0u8) {
        case 0u8 => 1
        case _ => 2
    }
}

func f16() {
    match (0.0f16) {
        case 0.0f16 => 1
        case _ => 2
    }
}

func f32() {
    match (0.0f32) {
        case 0.0f32 => 1
        case _ => 2
    }
}

func f64() {
    match (0.0f64) {
        case 0.0f64 => 1
        case _ => 2
    }
}

func b() {
    match (UInt8(UInt32(r'A'))) {
        case '\u{41}' => 1
        case _ => 2
    }
}

func bd() {
    match ("A".toArray()[0]) {
        case '\u{41}' => 1
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
