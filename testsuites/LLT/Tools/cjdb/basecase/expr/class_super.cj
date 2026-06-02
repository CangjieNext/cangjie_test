// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class C1 {
    public var a1: Int64 = 1
    let au2: UInt64 = 10
    var af2: Float16 = 16.16
    public var aa2: Array<Int64> = [1, 2, 3]
    public func foo1(): Int64 {
        return 1
    }
}

open class C2 <: C1 {
    public var a2: Int64
    public init() {
        super()
        a2 = super.a1
    }

    public func foo2(): Int64 {
        return super.foo1()
    }
}

main() {
    C2()
    0
}
