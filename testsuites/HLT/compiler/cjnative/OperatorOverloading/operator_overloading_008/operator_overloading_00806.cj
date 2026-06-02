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

interface A {
    operator func +(b: B): Int32 {
        return 1
    }
}

interface B {
    operator func +(b: B): Int32 {
        return 2
    }
}

class C <: A {}

class D <: B {}

main(): Int64 {
    var a: A = C()
    var b: B = D()
    a + b
    return 0
}
