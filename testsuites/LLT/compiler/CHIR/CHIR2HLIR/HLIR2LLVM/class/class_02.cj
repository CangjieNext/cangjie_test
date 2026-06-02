// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I1 {
    func f(): Int64
}

open class A <: I1 {
    public var id = 5
    public open func f(): Int64 {
        return 12
    }
    public func getId() {
        id
    }
}

class B <: A {
    public var a = 8
    public init(a_: Int64) {
        a = a_
    }
    public func testB() {}
    public override func f(): Int64 {
        return 34
    }
    public func getIdB(): Int64 {
        a
    }
}

main() {
    var insA = A()
    var insB = B(9)
    if (insA.f() != 12) {
        return 1
    }
    if (insB.f() != 34) {
        return 1
    }
    insB.id = 4
    return insA.getId() + insB.getId() - insB.getIdB()
}
