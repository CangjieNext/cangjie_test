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

interface I<X> {
    static func foo<Y>(a: Y): Y {
        a
    }
}

class A<X> <: I<X> {}

main() {
    return A<Bool>.foo(0)
}

// ASSERT: regex :5:.* error.*?modifier is not allowed here
