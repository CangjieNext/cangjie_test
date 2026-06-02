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
main(): Int64 {
    if (!10i64 != -11) {
        return 1
    }
    if (!20i32 != -21) {
        return 2
    }
    if (10i16 << 1i8 != 20) {
        return 3
    }
    if (10u64 << 1u32 << 1u16 != 40) {
        return 4
    }
    if (10u8 >> 1u64 != 5) {
        return 5
    }
    if ((10i64 & 15i64) != 10) {
        return 6
    }

    if ((10u32 ^ 15u32) != 5) {
        return 7
    }
    if ((10i16 | 15i16) != 15) {
        return 8
    }
    if ((UInt8(UInt32(r'\u{1}')) ^ 8u8 & 15u8 | "\u{18}".toArray()[0]) != 25) {
        return 9
    }

    return 0
}
