/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

abstract class R {
    public var c: Int32 = 0
    public open func a(): Int32 {
        c = 10
        return 1
    }
}

open class C <: R {
    public override func a(): Int32 {
        c = 10
        return 1
    }
}

class D <: C {
    public let b: () -> Int32
    public init() {
        b = {=> 3}
        b = super.a
    }
}

var a = D().b

main(): Int64 {
    var c = a()
    return Int64(c - 1)
}
// ASSERT: scan sema_cannot_assign_to_immutable
