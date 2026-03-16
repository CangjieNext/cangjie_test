// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %compile_lib_opt %f -o %output

// Regression test: an if-let bound name whose type flows from an aliased lambda parameter
// (e.g. `if (let A(v) <- E.A(p))`) must itself become an alias so that uses of it in the
// then-body clear the stale negative cache. The bound name lives in the LetPatternDestructor's
// pattern subtree, whose post-action fires before the then-body is walked, so the bindings are
// collected there and registered under the enclosing IfExpr (whose post-action fires after the
// then-body). Guards that `add(v)` inside the if-let then-body no longer rejects the
// (Int64, Int64) -> Unit candidate with "mismatched number of parameters: expected '0',
// found '2'".

enum E {
    A(Int64)
}

class B {
    init(list: () -> Unit) {}
    init(list: (Int64, Int64) -> Unit) {}
}

class C {
    func add(arg: Bool): Unit {}
    func add(arg: Int64): Unit {}

    func f() {
        B() {
            p, q =>
                if (let A(v) <- E.A(p)) { add(v) }
                return
        }
    }
}
