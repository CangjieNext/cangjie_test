// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %compile_lib_opt %f -o %output

// Regression test: an if-let inside a compound condition (`&&`). Unlike overload_resolution_12.cj
// the LetPatternDestructor's syntactic parent is a BinaryExpr, which pops before the then-body
// is walked; the bound name v must be scoped to the enclosing IfExpr so it stays alive through
// add(v) in the then-body. Guards that the stale negative cache for add(v) is cleared and the
// (Int64, Int64) -> Unit candidate is no longer rejected with "mismatched number of parameters:
// expected '0', found '2'".

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
                if (true && let A(v) <- E.A(p)) { add(v) }
                return
        }
    }
}
