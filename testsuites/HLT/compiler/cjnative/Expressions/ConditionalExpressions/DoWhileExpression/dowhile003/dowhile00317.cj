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

open class A {
    public var a: Int64 = 1
}

class B <: A {
    public func test(): Int64 {
        do {
            var a = super.a
            return 0
        } while (true)
        return 1
    }
}

main(): Int64 {
    var b = B()
    return b.test()
    return 1
}
