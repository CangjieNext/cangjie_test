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
var a1s: String = "[true, false]"
var a2: Array<Rune> = [r' ', r'$', r'{', r'a', r'A', r'~']
var a2s: String = "[ , $, {, a, A, ~]"
var a3: Array<String> = [" ", "$", "{", "a", "A", "~", "中"]
var a3s: String = "[ , $, {, a, A, ~, 中]"

main(): Int64 {
    if (a1.toString() != a1s) {
        return 1
    }
    if (a2.toString() != a2s) {
        return 2
    }
    if (a3.toString() != a3s) {
        return 3
    }
    return 0
}
