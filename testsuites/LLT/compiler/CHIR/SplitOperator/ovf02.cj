// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

interface M {
    operator func +(a: Int8): Int8
}

interface N <: M {}

interface I <: M {
    operator func +(a: Int8): Int8 {
        a
    }
}

extend Int8 <: N {}

extend Int8 <: I {}

main() {
    println(Int8(3) + Int8(15))
}
