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
    var c = (match (1) {
        case _ => 1
    } ^ match (1) {
        case _ => 3
    }) | (match (1) {
        case _ => 1
    } ^ match (1) {
        case _ => 0
    })
    if (c != 3) {
        return 1
    }
    return 0
}
