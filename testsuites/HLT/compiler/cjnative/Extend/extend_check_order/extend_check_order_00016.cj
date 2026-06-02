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

interface I1 {
    func foo() {
        1
    }
}

interface I2 <: I1 {}

extend String <: I2 {}

extend String <: I1 {}

main(): Int64 {
    var res = "aaa".foo()
    if (res != 1) {
        return 1
    }
    0
}
