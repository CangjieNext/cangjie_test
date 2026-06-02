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
    var t: Bool = true
    var f: Bool = false
    //三段表达式
    if ((if (t) {
        33
    } else {
        777
    }) != 33) {
        return 1
    }
    if ((if (f) {
        33
    } else {
        777
    }) != 777) {
        return 1
    }
    return 0
}
