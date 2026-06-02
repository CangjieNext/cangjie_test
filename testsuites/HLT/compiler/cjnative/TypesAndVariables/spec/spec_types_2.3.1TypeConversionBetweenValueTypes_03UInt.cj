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
    var u16Number: UInt16 = 65535
    var u32Number: UInt32 = 0
    u32Number = UInt32(u16Number) // ok: u32Number = 65535
    u16Number = UInt16(u32Number) // ok: u16Number = 65535
    u32Number = 65536
    u16Number = UInt16(u32Number) // throw an ArithmeticException
    print("${u16Number}")
    return 0
}
