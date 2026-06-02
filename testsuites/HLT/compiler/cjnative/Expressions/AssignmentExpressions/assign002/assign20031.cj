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
interface C {}

class A <: C {
    public var a: Int32
    public init(a: Int32) {
        this.a = a
    }
}

main(): Int64 {
    var l: C = A(1)
    var r: A = A(2)
    l = r
    return 0
}
