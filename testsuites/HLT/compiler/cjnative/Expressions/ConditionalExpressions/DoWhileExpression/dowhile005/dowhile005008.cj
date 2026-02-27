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

func foo() {
    var a: Int64
    do {
        if (true) {
            a = 1
        } else {
            a = 2
        }
    } while (a == 0)
    return a
}

main() {
    var a = foo()
    return a - 1
}
