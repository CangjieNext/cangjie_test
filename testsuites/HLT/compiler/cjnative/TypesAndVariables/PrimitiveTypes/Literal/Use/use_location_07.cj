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
// 括号表达式
func i64() {
    ((((((1i64))))))
}

func i32() {
    ((((((1i32))))))
}

func i16() {
    ((((((1i16))))))
}

func i8() {
    ((((((1i8))))))
}

func u64() {
    ((((((1u64))))))
}

func u32() {
    ((((((1u32))))))
}

func u16() {
    ((((((1u16))))))
}

func u8() {
    ((((((1u8))))))
}

func f16() {
    Int64((((((1.0f16))))))
}

func f32() {
    Int64((((((1.0f32))))))
}

func f64() {
    Int64((((((1.0f64))))))
}

func b() {
    (((((((((UInt8(UInt32(r'A'))))))))))) - 64
}

func bd() {
    (((((((("A".toArray()))))))))[0] - 64
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
