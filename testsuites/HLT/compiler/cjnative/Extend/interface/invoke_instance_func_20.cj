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
    public A(let b!: Int32 = 0) {
    }

    public func aaa() {
        return b
    }
}

interface I {
    func foo() {
        return "a"
    }
}

extend A <: I {
    public func me(a!: () -> String = foo) {
        a()
    }
}

main(): Int64 {
    if (A().me() == "a") {
        return 0
    }
    return 2
}
