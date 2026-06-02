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
    public var a: Int32
    public init(a: Int32) {
        this.a = a
    }
}

class B <: A {
    public init(a: Int32) {
        super(a)
    }
}

main(): Int64 {
    var l: A = A(1)
    var r: B = B(2)
    l = r
    if (l.a == 2) {
        return 0
    }
    return 1
}
