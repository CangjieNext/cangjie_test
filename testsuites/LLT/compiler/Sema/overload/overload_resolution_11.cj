// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %compile_lib_opt %f -o %output

// Regression test: a for-in bound name whose type flows from an aliased lambda parameter
// (e.g. `for (i in [p])`) must itself become an alias so that uses of it in the loop body
// clear the stale negative cache. The ForInExpr post-action is too late (the body is a child
// of the ForInExpr and is walked before it), so the bound names are registered in the
// pre-action when an aliased RefExpr is first seen in the in-expression. Guards that
// `add(i)` inside the loop body no longer rejects the (Int64, Int64) -> Unit candidate with
// "mismatched number of parameters: expected '0', found '2'".

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
                for (i in [p]) { add(i) }
                return
        }
    }
}
