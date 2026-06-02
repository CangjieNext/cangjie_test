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
//hex
main(): Int64 {
    var a: Int16 = 10
    var b: Int16 = 0xa8b
    var c: Int16 = 0
    var d: Int16 = 0
    var e: Int16 = 2699
    d = a | b
    if (d != b) {
        return 1
    }
    d = c | b
    if (d != b) {
        return 1
    }
    return 0
}
