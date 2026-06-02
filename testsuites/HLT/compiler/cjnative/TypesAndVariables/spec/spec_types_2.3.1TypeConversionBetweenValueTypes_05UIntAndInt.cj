/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main() {
    var i8Number: Int8 = 127
    var u8Number: UInt8 = 0
    u8Number = UInt8(i8Number) // ok: u8Number = 127
    u8Number = 100
    i8Number = Int8(u8Number) // ok: i8Number= 100
    i8Number = -100
    u8Number = UInt8(i8Number) // throw an ArithmeticException
    u8Number = 255
    i8Number = Int8(u8Number) // throw an ArithmeticException
    return 0
}
