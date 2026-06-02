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
class A {}

interface I {}

extend A <: I {}

class C {
    static func foo(a: I) {
        a
    }
}

main(): Int64 {
    if (C.foo(A()) is I && C.foo(A()) is A) {
        return 0
    }
    return 2
}
