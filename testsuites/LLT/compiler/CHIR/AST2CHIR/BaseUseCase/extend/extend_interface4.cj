// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 

interface A {
    func foo(): Int64 {
        return 0
    }
}

interface B {
    func foo(): Int64
}

class S {}

extend S <: A & B {}

main(): Int64 {
    let b: B = S()
    return b.foo()
}
