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

main() {
    var a = 1
    var t = ("Bob", 90)
    if (let (x, y) <- t) {
        if (x == "Bob" && y == 90) {
            a--
        } else {
            a++
        }
    } else {
        a++
    }
    return a
}
