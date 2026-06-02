// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE)EXEC-2: %run %run_opt %output %run_args
// (not CJNATIVE)EXEC-1: %run %run_opt %output %run_args

interface I1 {
    func foo() {
        1
    }
}

interface I2 <: I1 {
    func foo() {
        2
    }
}

class A {}

extend A <: I1 {}

extend A <: I2 {}

main() {
    A().foo()
}
