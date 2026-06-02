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
    var a: Array<Int64> = [0, 1, 2]
    var c = if (a[match (1) {
            case _ => 1
        }] != 1) {
        10
    } else {
        20
    }
    if (c != 20) {
        return 1
    }
    return 0
}
