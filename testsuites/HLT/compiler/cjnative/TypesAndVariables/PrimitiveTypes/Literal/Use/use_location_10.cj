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
func i64() {
    var a = 0i64..=1i64 : 1i64
    [1, 0][a][0]
}

func i32() {
    var a = 0i32..=1i32 : 1i64
    a.end
}

func i16() {
    var a = 0i16..=1i16 : 1i64
    a.end
}

func i8() {
    var a = 0i8..=1i8 : 1i64
    a.end
}

func u64() {
    var a = 0u64..=1u64 : 1i64
    a.end
}

func u32() {
    var a = 0u32..=1u32 : 1i64
    a.end
}

func u16() {
    var a = 0u16..=1u16 : 1i64
    a.end
}

func u8() {
    var a = 0u8..=1u8 : 1i64
    a.end
}

func b() {
    var a = UInt8(UInt32(r'A'))..=UInt8(UInt32(r'B')) : 1i64
    a.end - a.start
}

func bd() {
    var a = "A"[0]..="B".toArray().toArray()[0] : 1i64
    a.end - a.start
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
    if (b() != 1) {
        return 12
    }
    if (bd() != 1) {
        return 13
    }
    return 0
}
