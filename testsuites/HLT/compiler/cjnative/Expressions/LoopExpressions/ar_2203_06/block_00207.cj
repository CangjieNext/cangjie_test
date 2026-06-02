/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args
// ASSERT: regex .cj:5:9: .*error.*: 'break' or 'continue' is not allowed here

var a: Array<Bool> = []

main() {
    var b = 0
    while (b < 3) {
        b++
        println(b)
        a = [break is Nothing, continue is Nothing]
    }

    return a.size
}
