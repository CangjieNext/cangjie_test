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
    var lit01 = -2.4e-1
    var lit02 = 2e1
    var lit03 = .128e2
    var lit04 = 0x1.1p0
    var lit05 = 0X1p2
    var lit06 = 0x.2P4
    var lit08 = -1.79e308

    if (lit01 != -0.24) {
        return 1
    }
    if (lit02 != 20.0) {
        return 1
    }
    if (lit03 != 12.8) {
        return 1
    }
    if (lit04 != 1.0625) {
        return 1
    }
    if (lit05 != 4.0) {
        return 1
    }
    if (lit06 != 2.0) {
        return 1
    }

    if (lit08 != -1.79e308) {
        return 1
    }
    return 0
}
