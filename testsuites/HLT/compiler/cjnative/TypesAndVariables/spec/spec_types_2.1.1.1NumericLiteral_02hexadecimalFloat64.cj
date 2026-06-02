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
    if (2.4e-1 == 0.24) {
        print("decimal Float64 0.24")
    }
    if (2e3 == 2000.0) {
        print("decimal Float64 2000.0")
    }
    if (.8 == 0.8) {
        print("decimal Float64 0.8")
    }
    if (0.123e2 == 12.3) {
        print("decimal Float64 12.3")
    }
    if (0x1.1p0 == 1.0625) {
        print("hexadecimal Float64 1.0625 (decimal value)")
    }
    if (0x1p2 == 4.0) {
        print("hexadecimal Float64 4 (decimal value)")
    }
    if (0x.2p4 == 2.0) {
        print("hexadecimal Float64 2 (decimal value)")
    }
    return 0
}
