// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %n.cj
// ERRCHECK: %compiler %enableCompileDebug %n.cj %diag_json

@When[!debug] // interface decl
interface I {
    func foo(): Unit
}

class Foo <: I {
    public func foo(): Unit {
        println("Foo")
    }
}

main() {
    Foo().foo()
}
// ASSERT: scan sema_undeclared_type_name
