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

open class Boo {
    public var a: Int64 = 0
    public func foo(x: Int64) {
        return x + a
    }
    public init(x: Int64) {
        a = x
    }
}

class Coo <: Boo {
    public init(x!: Int64 = match (1) {
            case _ => 1
        }) {
        super(x)
        a = x
    }
}

main(): Int64 {
    var a = Coo(x: 2).foo(1)
    if (a != 3) {
        return 1
    }
    return 0
}
