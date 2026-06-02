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

var a1: Array<Bool> = [true, false]
var a1s: Array<String> = ["true", "false"]
var a2: Array<Rune> = [r' ', r'$', r'{', r'a', r'A', r'~']
var a2s: Array<String> = [" ", "$", "{", "a", "A", "~"]
var a3: Array<String> = [" ", "$", "{", "a", "A", "~", "中"]
var a3s: Array<String> = [" ", "$", "{", "a", "A", "~", "中"]

main(): Int64 {
    for (item in 0..a1.size) {
        if (a1[item].toString() != a1s[item]) {
            return 1
        }
    }
    for (item in 0..a2.size) {
        if (a2[item].toString() != a2s[item]) {
            return 2
        }
    }
    for (item in 0..a3.size) {
        if (a3[item].toString() != a3s[item]) {
            return 3
        }
    }
    return 0
}
