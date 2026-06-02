/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

class A {
    A(var a!: Int64 = 1, var b!: Int64 = a) {
    }
}

main() {
    var a: A = A()
    if (a.a == a.b) {
        return 0
    } else {
        return 1
    }
}
