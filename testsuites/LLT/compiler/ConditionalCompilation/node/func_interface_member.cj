// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %n.cj
// ERRCHECK: %compiler %enableCompileDebug %n.cj %diag_json

interface I {
    @When[!debug] // interface member func decl
    func foo(): Unit
}

class Foo <: I {
    public func foo(): Unit {
        println("Foo")
    }
}

main() {
    var i: I = Foo()
    i.foo()
}
// ASSERT: scan sema_not_member_of
