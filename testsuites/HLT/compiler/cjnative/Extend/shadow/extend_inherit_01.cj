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

class B <: A {}

open class A {}

extend A {
    public static func foo1(a: Int32, b!: Int64 = 0): Int32 {
        return a
    }
}

extend A {
    public func foo2(a: Int32, b!: Int64 = 0): Int32 {
        return a
    }
}

extend A {
    public static func foo3() {
        return 1
    }
}

extend A {
    public func foo4() {
        3
    }
}

main(): Int64 {
    let a = Int64(B.foo1(1)) + Int64(B().foo2(1)) + B.foo3() + B().foo4()
    return a - 6
}
