/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: A.cj
// EXEC: %compiler %cmp_opt %f A.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum A {
    | RED
}

extend A <: I2 {}

extend A <: I1 {}

main(): Int64 {
    var res = A.foo()
    if (res != 1) {
        return 1
    }
    0
}
