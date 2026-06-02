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
    var a1: (Aoo, Coo) = (Aoo(2), Coo(2))
    a1[0].a++
    if (a1[0].a != 3) {
        return 1
    }
    return 0
}

class Aoo {
    public var a: Int32 = 1
    public let b: Int32 = 1
    public init(x: Int32) {
        a = x
    }
}

struct Coo {
    public var a: Int32 = 1
    public let b: Int32 = 1
    public init(x: Int32) {
        a = x
    }
}
