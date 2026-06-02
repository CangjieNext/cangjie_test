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

open class C1 {
    public let a: Int64 = 1
}

class C2 <: C1 {
    public let b: Int64
    public init() {
        b = super.a
    }
    public func test() {
        var i: Int32 = 0
        match (i) {
            case _ => super.a
        }
    }
}

main(): Int64 {
    return 0
}
