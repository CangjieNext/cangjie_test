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
    var a1: Array<Aoo> = Array<Aoo>(2, {i => Aoo(i)})
    a1[0].a++
    if (a1[0].a != 1) {
        return 1
    }
    a1[0] = Aoo(4)
    if (a1[0].a != 4) {
        return 1
    }
    return 0
}

class Aoo {
    public var a: Int64 = 1
    public let b: Int64 = 1
    public init(x: Int64) {
        a = x
    }
}
