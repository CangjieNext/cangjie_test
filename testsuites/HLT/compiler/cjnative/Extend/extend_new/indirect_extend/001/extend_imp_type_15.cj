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

open class classA {
    public var a: Int64 = 1
}

type A = classA

interface I {
    func b(): Int64 {
        1
    }
}

extend A <: I {
    public func b(): Int64 {
        1
    }
}

class B <: A {}

main(): Int64 {
    var a: B = B()
    if (a.a == a.b()) {
        return 0
    } else {
        return 1
    }
}
