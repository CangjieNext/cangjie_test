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

interface Base {
    static func foo() {
        return 1
    }
}

interface Data <: Base {
    static func foo(a: Int64) {
        return a
    }

    static func inside() {
        return foo() + foo(2)
    }
}

class Test <: Data {}

main(): Int64 {
    var res1: Int64 = Test.foo()
    var res2: Int64 = Test.foo(2)
    var res3: Int64 = Test.inside()
    if (res1 != 1 || res2 != 2 || res3 != 3) {
        return 1
    }
    return 0
}
