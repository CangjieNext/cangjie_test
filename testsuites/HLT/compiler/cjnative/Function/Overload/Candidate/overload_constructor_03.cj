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

main(): Int64 {
    var a = foo2(2)
    if (a.a2 != 2) {
        return 1
    }
    var b = foo3(Int32(3))
    if (b.a3 != 6) {
        return 2
    }
    return 0
}

open class foo1 {
    public var a1: Int64 = 1
    public foo1(x: Int64) {
        a1 = Int64(x)
    }
    public init(x: Int32) {
        a1 = Int64(x) + 1
    }
}

open class foo2 <: foo1 {
    public var a2: Int64 = 1
    public foo2(x: Int64) {
        super(x)
        a2 = super.a1
    }
    public init(x: Int32) {
        super(x)
        a2 = super.a1 + 1
    }
}

class foo3 <: foo2 {
    public var a3: Int64 = 1
    public foo3(x: Int64) {
        super(x)
        a3 = super.a2
    }
    public init(x: Int32) {
        super(x)
        a3 = super.a2 + 1
    }
}
