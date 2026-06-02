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
    var a = 4.9e-324f16
    var b = 1.79769e308f16
    var c = 4.9e-324__________f16
    var d = 1.79769e308________f16

    if (!(a == 4.9e-324 && a is Float16)) {
        return 1
    }

    if (!(b == 1.79769e308 && a is Float16)) {
        return 2
    }

    if (!(c == 4.9e-324 && a is Float16)) {
        return 3
    }

    if (!(d == 1.79769e308 && a is Float16)) {
        return 4
    }

    return 0
}
