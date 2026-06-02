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

class A {
    A(var a!: Int64 = 5) {
    }
}

interface I {
    func foo() {
        return 4
    }
}

extend A <: I {
    public func me(): Int64 {
        func me() {
            func me(a!: Int32 = 2) {
                return a
            }
            return me()
        }
        return Int64(me()) + foo()
    }
}

main(): Int64 {
    return A().me() - 6
}
