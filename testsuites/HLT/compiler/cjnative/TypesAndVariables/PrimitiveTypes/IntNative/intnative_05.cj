/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC: %run %run_opt %output %run_args

main(): IntNative {
    let d: IntNative = 31 + 96
    let d2: IntNative = 0b11111 + 0b1100000
    let d3: IntNative = 0b11111 * 0b1100000
    if (d != 127) {
        return 1
    }
    if (d3 != 2976) {
        return 1
    }
    let k: UIntNative = 63 + 192
    let k2: UIntNative = 0b111111 + 0b11000000
    let k3: UIntNative = 0b111111 * 0b11000000
    if (k != 255) {
        return 1
    }
    if (k3 != 12096) {
        return 1
    }

    return 0
}
