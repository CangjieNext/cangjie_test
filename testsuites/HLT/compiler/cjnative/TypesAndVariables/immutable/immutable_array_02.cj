/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var a1: Array<Aoo> = Array<Aoo>(2, {i => Aoo(i)})
    a1[0].b++
    var c1: Array<Coo> = Array<Coo>(2, {i => Coo(i)})
    c1[0].a++
    c1[0] = Coo(4)
    c1[0].b++
    return 0
}

struct Coo {
    public var a: Int64 = 1
    public let b: Int64 = 1
    public init(x: Int64) {
        a = x
    }
}

class Aoo {
    public var a: Int64 = 1
    public let b: Int64 = 1
    public init(x: Int64) {
        a = x
    }
}
// ASSERT: scan sema_cannot_assign_to_immutable
