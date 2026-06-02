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
    var a1: (Aoo, Coo) = (Aoo(2), Coo(2))
    a1[0].b++
    a1[0] = Aoo(4)
    a1[1].a++
    a1[1] = Coo(4)
    a1[1].b++
    return 0
}

struct Coo {
    public var a: Int32 = 1
    public let b: Int32 = 1
    public init(x: Int32) {
        a = x
    }
}

class Aoo {
    public var a: Int32 = 1
    public let b: Int32 = 1
    public init(x: Int32) {
        a = x
    }
}
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_unqualified_left_value_assigned
