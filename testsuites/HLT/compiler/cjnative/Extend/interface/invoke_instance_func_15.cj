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

interface I {
    func foo() {
        return "a"
    }
}

class A {
    public var b: Int32
    public A(b!: Int32 = 0) {
        this.b = b
    }
}

extend A <: I {
    public func foo() {
        return "a"
    }

    public func me() {
        return this.b
    }
}

main(): Int64 {
    return Int64(A(b: 0).me())
}
