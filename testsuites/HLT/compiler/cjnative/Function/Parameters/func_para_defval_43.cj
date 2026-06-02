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
    return run()
}

func run(): Int64 {
    if (Foo() == 178) {
        return 0
    }
    return 1
}

func Foo(a!: UInt8 = !200, b!: UInt8 = 10 << 1, c!: UInt8 = 10 << 1 << 1, d!: UInt8 = 10 >> 1, e!: UInt8 = 10 & 15,
    f!: UInt8 = 10 ^ 15, g!: UInt8 = 10 | 15, h!: UInt8 = !!10 << 1 ^ 8 & 15 | 24): UInt8 {
    return a + b + c + d + e + f + g + h // 55+20+40+5+10+5+15+28
}
