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
// spawn
func i64() {
    let fut = spawn {
        1i64
    }
    let res = fut.get()
    res
}

func i32() {
    let fut = spawn {
        1i32
    }
    let res = fut.get()
    res
}

func i16() {
    let fut = spawn {
        1i16
    }
    let res = fut.get()
    res
}

func i8() {
    let fut = spawn {
        1i8
    }
    let res = fut.get()
    res
}

func u64() {
    let fut = spawn {
        1u64
    }
    let res = fut.get()
    res
}

func u32() {
    let fut = spawn {
        1u32
    }
    let res = fut.get()
    res
}

func u16() {
    let fut = spawn {
        1u16
    }
    let res = fut.get()
    res
}

func u8() {
    let fut = spawn {
        1u8
    }
    let res = fut.get()
    res
}

func f16() {
    let fut = spawn {
        1.0f16
    }
    let res = fut.get()
    res
}

func f32() {
    let fut = spawn {
        1.0f32
    }
    let res = fut.get()
    res
}

func f64() {
    let fut = spawn {
        1.0f64
    }
    let res = fut.get()
    res
}

func b() {
    let fut = spawn {
        UInt8(UInt32(r'A'))
    }
    let res = fut.get()
    match (res) {
        case '\u{41}' => 1
        case _ => 2
    }
}

func bd() {
    let fut = spawn {
        UInt8(UInt32(r'A'))
    }
    let res = fut.get()
    match (res) {
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
    if (f64() != 1.0f64) {
        return 9
    }
    if (f32() != 1.0f32) {
        return 10
    }
    if (f16() != 1.0f16) {
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
