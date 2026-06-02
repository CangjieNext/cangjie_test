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

class A {
    var a: Int64
    var b: Int64

    init() {
        a = 1
        b = 1
    }
}

main() {
    var test = A()
    (test.a, test.b) = (2, -2)
    return test.b + test.a
}
