// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class A {}

open class B <: A {}

open class C <: B {}

class A1 <: A {}

class B1 <: B {}

class C1 <: C {}

class D {
    public var content: Array<A>
    public init(content!: Array<A>) {
        this.content = content
    }
    public func build(): Int64 {
        return 140
    }
}

func a(content: Array<B>) {
    1
}

main(): Int64 {
    let e: Array<A> = [C1(), B1(), A1(), C()]
    let d = D(content: [C1(), B1(), A1(), C()])
    let f: Array<A> = Array<A>(5, repeat: A())
    var g = a([B(), C()])
    var h = a([C(), C()])
    // var i = a({})
    // return d.build() + g + h + i // 143
    return 0 // d.build() + g + h  // 142
}
