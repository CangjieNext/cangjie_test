/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I1 {}

interface I2 <: I1 {}

interface I3 {
    func foo() {
        1
    }
}

interface I4 {
    func foo() {
        2
    }
}

class A {}

extend A <: I1 {}

extend A <: I2 & I3 {}

main(): Int64 {
    var res = A().foo()
    if (res != 1) {
        return 1
    }
    0
}
